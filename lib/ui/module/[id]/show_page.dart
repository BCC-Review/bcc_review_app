import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:bcc_review_app/ui/module/%5Bid%5D/module_show_view_model.dart';
import 'package:bcc_review_app/ui/module/%5Bid%5D/widgets/module_list_item.dart';
import 'package:flutter/material.dart';
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

  // Função auxiliar para mapear o nome do ícone (string) para IconData
  IconData _getIconFromString(String iconName) {
    switch (iconName) {
      case 'functions':
        return Icons.functions;
      case 'data_object':
        return Icons.data_object;
      case 'view_list':
        return Icons.view_list;
      case 'link':
        return Icons.link;
      case 'code':
        return Icons.code;
      case 'data_usage':
        return Icons.data_usage;
      case 'psychology':
        return Icons.psychology;
      case 'memory':
        return Icons.memory;
      case 'integration_instructions':
        return Icons.integration_instructions;
      default:
        return Icons.extension; // Ícone padrão de fallback
    }
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
                    Container(
                      width: 2,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withAlpha(50),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: const Icon(Icons.book),
                        onPressed: () {},
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
                    return ModuleListItem(module: module);
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
