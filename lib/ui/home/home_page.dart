import 'package:bcc_review_app/app_widget.dart';
import 'package:bcc_review_app/config/dependecies.dart';
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
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.school, color: Colors.blue),
                    Text('${viewModel.user!.level}'),

                    Icon(
                      Icons.local_fire_department,
                      color: Colors.orange[900],
                    ),
                    Text('${viewModel.user!.dailySequence}'),

                    Icon(Icons.star, color: Colors.yellow[700]),
                    Text('${viewModel.user!.totalXp} XP'),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Pesquisar disciplina',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                viewModel.filterSubjects(value);
              },
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
