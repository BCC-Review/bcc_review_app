import 'package:bcc_review_app/ui/home/home_view_model.dart';
import 'package:bcc_review_app/ui/home/official_modules/official_modules_view_model.dart';
import 'package:bcc_review_app/ui/home/widgets/subject_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class OfficialModulesView extends StatefulWidget {
  final OfficialModulesViewModel viewModel;
  final HomeViewModel homeViewModel;
  const OfficialModulesView({
    super.key,
    required this.viewModel,
    required this.homeViewModel,
  });

  @override
  State<OfficialModulesView> createState() => _OfficialModulesViewState();
}

class _OfficialModulesViewState extends State<OfficialModulesView> {
  @override
  void initState() {
    widget.viewModel.getUser();
    widget.viewModel.refreshSubjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        ListenableBuilder(
          listenable: widget.viewModel,
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
              widget.viewModel.filterSubjects(value);
            },
          ),
        ),
        ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, _) {
            if (widget.viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (widget.viewModel.subjectsGroupedByPeriod.isEmpty) {
              return const Center(
                child: Text('Nenhuma disciplina encontrada!'),
              );
            }
            return Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await widget.viewModel.refreshSubjects();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListView.builder(
                    itemCount: widget.viewModel.subjectsGroupedByPeriod.length,
                    itemBuilder: (context, index) {
                      final period =
                          widget.viewModel.subjectsGroupedByPeriod[index].key;
                      final subjects =
                          widget.viewModel.subjectsGroupedByPeriod[index].value;
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
                                        widget.viewModel.refreshSubjects();
                                        widget.viewModel.getUser();
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
    );
  }

  Widget _buildStatsPanel() {
    final showPanel =
        widget.viewModel.user != null &&
        widget.homeViewModel.isStatsPanelVisible;

    final user = widget.viewModel.user;
    final currentXp = user?.currentLevelXp() ?? 0;

    final requiredXp = user?.requiredXpForCurrentLevel() ?? 0;
    final progress = requiredXp > 0 ? currentXp.toDouble() / requiredXp : 0.0;
    final xpToNext = user?.xpToNextLevel() ?? 0;

    return AnimatedContainer(
      decoration: BoxDecoration(color: Theme.of(context).cardTheme.color),
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      onEnd: () {
        setState(() {
          widget.homeViewModel.showStatsPanelContent = true;
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
                        'Faltam $xpToNext XP para o próximo nível',
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
                                widget.homeViewModel.isStatsPanelVisible =
                                    !widget.homeViewModel.isStatsPanelVisible;
                                widget.homeViewModel.showStatsPanelContent =
                                    false;
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
