import 'package:bcc_review_app/app_widget.dart';
import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/core/extensions/date_only_compare.dart';
import 'package:bcc_review_app/ui/home/home_view_model.dart';
import 'package:bcc_review_app/ui/home/widgets/subject_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = injector.get<HomeViewModel>();
  bool _isStatsPanelVisible = false;
  bool _showStatsPanelContent = false;

  @override
  void initState() {
    viewModel.getUser();
    viewModel.refreshSubjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Routefly.push(routePaths.settings);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        title: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            return Row(
              spacing: 8,
              children: [
                const CircleAvatar(
                  radius: 17,
                  child: Icon(Icons.person, size: 20),
                ),
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  firstChild: const Text('Carregando...'),
                  secondChild: Text(viewModel.user?.name ?? "..."),
                  crossFadeState:
                      viewModel.user == null
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                ),
                Spacer(flex: 2),
                // Agrupa Nível e Sequência para clique
                InkWell(
                  onTap: () {
                    setState(() {
                      _isStatsPanelVisible = !_isStatsPanelVisible;
                      if (_showStatsPanelContent) {
                        _showStatsPanelContent = !_showStatsPanelContent;
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.school, color: Colors.blue),
                        Text('${viewModel.user?.level ?? 0}'),
                        SizedBox(width: 4),
                        Icon(
                          Icons.local_fire_department,
                          color:
                              viewModel.user != null &&
                                      viewModel.user?.lastDailySequenceDate !=
                                          null &&
                                      viewModel.user!.lastDailySequenceDate!
                                          .isSameDate(DateTime.now())
                                  ? Colors.orange[900]
                                  : Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withAlpha(100),
                        ),
                        Text('${viewModel.user?.dailySequence ?? 0}'),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      body: Column(
        spacing: 16,
        children: [
          ListenableBuilder(
            listenable: viewModel,
            builder: (context, _) {
              return _buildStatsPanel();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Pesquisar disciplina',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                viewModel.filterSubjects(value);
              },
            ),
          ),
          ListenableBuilder(
            listenable: viewModel,
            builder: (context, _) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (viewModel.subjectsGroupedByPeriod.isEmpty) {
                return const Center(
                  child: Text('Nenhuma disciplina encontrada!'),
                );
              }
              return Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await viewModel.refreshSubjects();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListView.builder(
                      itemCount: viewModel.subjectsGroupedByPeriod.length,
                      itemBuilder: (context, index) {
                        final period =
                            viewModel.subjectsGroupedByPeriod[index].key;
                        final subjects =
                            viewModel.subjectsGroupedByPeriod[index].value;
                        return ExpansionTile(
                          title: Text('Período $period'),
                          children:
                              subjects
                                  .map(
                                    (subject) => SubjectListTile(
                                      subject: subject,
                                      onTap: () {
                                        Routefly.push(
                                          '/module/${subject.id}/show',
                                        ).then((value) {
                                          viewModel.refreshSubjects();
                                          viewModel.getUser();
                                        });
                                      },
                                    ),
                                  )
                                  .toList(),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      //Botão de redicionamento para os minijogos
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Routefly.push('/minigames');
        },
        child: const Icon(Icons.videogame_asset),
        tooltip: 'Abrir Minijogos',
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
    );
  }

  // Constrói o painel de estatísticas expansível
  Widget _buildStatsPanel() {
    final showPanel = viewModel.user != null && _isStatsPanelVisible;

    final user = viewModel.user;
    final currentXp = user?.currentLevelXp() ?? 0;

    final requiredXp = user?.requiredXpForCurrentLevel() ?? 0;
    final progress = requiredXp > 0 ? currentXp.toDouble() / requiredXp : 0.0;
    final xpToNext = user?.xpToNextLevel() ?? 0;

    // Define a altura desejada para o painel

    return AnimatedContainer(
      decoration: BoxDecoration(color: Theme.of(context).cardTheme.color),

      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      onEnd: () {
        setState(() {
          _showStatsPanelContent = true;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child:
            showPanel
                ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nível ${user?.level ?? 0} (${user?.totalXp ?? 0} XP Total)',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: LinearProgressIndicator(
                                value: progress,
                                minHeight: 10,
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.1),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '$currentXp / $requiredXp XP',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Próximo nível: $xpToNext XP',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.8),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isStatsPanelVisible = !_isStatsPanelVisible;
                                _showStatsPanelContent = false;
                              });
                            },
                            child: Icon(
                              Icons.keyboard_arrow_up,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                : const SizedBox.shrink(),
      ),
    );
  }
}
