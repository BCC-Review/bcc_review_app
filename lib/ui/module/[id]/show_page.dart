import 'package:bcc_review_app/app_widget.dart';
import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:bcc_review_app/ui/module/%5Bid%5D/module_show_view_model.dart';
import 'package:bcc_review_app/ui/module/%5Bid%5D/widgets/module_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:routefly/routefly.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({super.key});

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  final subjectId = Routefly.query['id'] ?? '0';
  final viewModel = injector.get<ModuleShowViewModel>();

  @override
  void initState() {
    viewModel.refreshModules(subjectId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, _) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (viewModel.modules.isEmpty) {
            return const Center(
              child: Text('Nenhum módulo encontrado para esta disciplina.'),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewModel.subject?.period != null
                                  ? '${viewModel.subject?.period}º Período'
                                  : '...',
                              style: Theme.of(context).textTheme.bodySmall!,
                            ),
                            Text(
                              viewModel.subject?.name ?? '...',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.modules.length,
                  itemBuilder: (context, index) {
                    final module = viewModel.modules[index];
                    return ModuleListItem(
                      module: module,
                      onTap:
                          () => Routefly.push(
                            routePaths.quiz.$moduleId.quiz.replaceAll(
                              '[moduleId]',
                              module.id.toString(),
                            ),
                          ).then((value) {
                            viewModel.refreshModules(subjectId);
                          }),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
