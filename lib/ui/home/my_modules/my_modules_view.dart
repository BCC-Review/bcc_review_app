import 'package:bcc_review_app/app_widget.dart';
import 'package:bcc_review_app/ui/home/my_modules/my_modules_view_model.dart';
import 'package:bcc_review_app/ui/module/%5Bid%5D/widgets/module_list_item.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class MyModulesView extends StatefulWidget {
  final MyModulesViewModel viewModel;

  const MyModulesView({super.key, required this.viewModel});

  @override
  State<MyModulesView> createState() => _MyModulesViewState();
}

class _MyModulesViewState extends State<MyModulesView> {
  MyModulesViewModel? viewModel;

  @override
  void initState() {
    viewModel = widget.viewModel;
    init();
    super.initState();
  }

  Future<void> init() async {
    await viewModel!.getMyModules();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel!,
      builder: (context, _) {
        if (viewModel == null || viewModel!.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (viewModel!.filteredModules.isEmpty &&
            viewModel!.searchQueryModules.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_book_rounded,
                    size: 80,
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.7),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Crie seus próprios módulos!',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Personalize seu estudo adicionando módulos e perguntas sobre os assuntos que você mais precisa revisar.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () {
                      Routefly.push(routePaths.module.create.createModule).then(
                        (value) {
                          viewModel!.getMyModules();
                        },
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text('Criar Novo Módulo'),
                  ),
                ],
              ),
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          viewModel!.filterModules(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Pesquisar Módulos',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Routefly.push(
                            routePaths.module.create.createModule,
                          ).then((value) {
                            viewModel!.getMyModules();
                          });
                        },
                        style: Theme.of(context).elevatedButtonTheme.style
                            ?.copyWith(elevation: WidgetStateProperty.all(0)),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
              if (viewModel!.filteredModules.isEmpty &&
                  viewModel!.searchQueryModules.isNotEmpty)
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text(
                      'Nenhum módulo encontrado com o nome "${viewModel!.searchQueryModules}".',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel!.filteredModules.length,
                  itemBuilder: (context, index) {
                    final module = viewModel!.filteredModules[index];
                    return ModuleListItem(
                      module: module,
                      onTap: () {
                        if (module.multipleChoiceQuestions.toList().isEmpty) {
                          Routefly.push(
                            '/module/create_questions/[moduleId]/form_questions'
                                .replaceAll('[moduleId]', module.id.toString()),
                          ).then((value) {
                            viewModel!.getMyModules();
                          });
                          return;
                        }

                        Routefly.push('/quiz/${module.id}/quiz').then((value) {
                          viewModel!.getMyModules();
                        });
                      },
                      onTapEdit:
                          module.isOfficial == false
                              ? () {
                                Routefly.push(
                                  '/module/create_questions/[moduleId]/form_questions'
                                      .replaceAll(
                                        '[moduleId]',
                                        module.id.toString(),
                                      ),
                                ).then((value) {
                                  viewModel!.getMyModules();
                                });
                              }
                              : null,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
