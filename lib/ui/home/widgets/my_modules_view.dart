import 'package:bcc_review_app/app_widget.dart';
import 'package:bcc_review_app/ui/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class MyModulesView extends StatefulWidget {
  final HomeViewModel viewModel;
  const MyModulesView({super.key, required this.viewModel});

  @override
  State<MyModulesView> createState() => _MyModulesViewState();
}

class _MyModulesViewState extends State<MyModulesView> {
  @override
  Widget build(BuildContext context) {
    // TODO: Implementar a lógica para exibir os módulos criados pelo usuário
    // Por enquanto, exibiremos uma tela de boas-vindas se não houver módulos.
    final bool hasModules = false; // Simula a ausência de módulos

    if (hasModules) {
      // TODO: Exibir a lista de módulos do usuário aqui
      return const Center(
        child: Text('Lista de módulos do usuário (a implementar)'),
      );
    } else {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.menu_book_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
              ),
              const SizedBox(height: 24),
              Text(
                'Crie seus próprios módulos!',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Personalize seu estudo adicionando módulos e perguntas sobre os assuntos que você mais precisa revisar.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  Routefly.push(routePaths.module.create.createModule);
                },
                icon: const Icon(Icons.add),
                label: const Text('Criar Novo Módulo'),
              ),
            ],
          ),
        ),
      );
    }
  }
}
