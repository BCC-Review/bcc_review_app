import 'package:bcc_review_app/app_widget.dart';
import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/ui/settings/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:routefly/routefly.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final viewModel = injector.get<SettingsViewModel>();

  @override
  void initState() {
    viewModel.logoutCommand.addListener(_logoutListenable);
    viewModel.restoreAppCommand.addListener(_restoreAppListenable);
    super.initState();
  }

  @override
  void dispose() {
    viewModel.logoutCommand.removeListener(_logoutListenable);
    viewModel.restoreAppCommand.removeListener(_restoreAppListenable);
    super.dispose();
  }

  void _logoutListenable() {
    if (!mounted) return; // Check if the widget is still in the tree
    if (viewModel.logoutCommand.isSuccess) {
      // Navega para o login após o logout bem-sucedido
      Routefly.navigate(routePaths.login);
    } else if (viewModel.logoutCommand.isFailure) {
      final failure = viewModel.logoutCommand.value as FailureCommand;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao sair: ${failure.error}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _restoreAppListenable() {
    if (!mounted) return; // Check if the widget is still in the tree
    if (viewModel.restoreAppCommand.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Aplicativo restaurado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
      Routefly.navigate(routePaths.splash);
    } else if (viewModel.restoreAppCommand.isFailure) {
      final failure = viewModel.restoreAppCommand.value as FailureCommand;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao restaurar: ${failure.error}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _showRestoreConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirmar Restauração'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Tem certeza que deseja restaurar o aplicativo para o estado inicial?',
                ),
                Text(
                  'Todos os dados não oficiais e progresso serão perdidos.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Restaurar'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                viewModel.restoreAppCommand.execute();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              // Modo Escuro
              ListenableBuilder(
                listenable:
                    viewModel, // Ou viewModel.darkModeNotifier se tiver um dedicado
                builder: (context, _) {
                  return ListTile(
                    leading: const Icon(Icons.dark_mode_outlined),
                    title: const Text('Modo Escuro'),
                    trailing: Switch(
                      value: viewModel.isDarkMode,
                      // Corrigido: Envolve a chamada async em uma função síncrona
                      onChanged: (value) => viewModel.toggleDarkMode(),
                    ),
                    onTap:
                        viewModel
                            .toggleDarkMode, // Permite clicar na linha toda
                  );
                },
              ),
              const Divider(),
              ListenableBuilder(
                listenable: viewModel.restoreAppCommand,
                builder: (context, _) {
                  final isRunning = viewModel.restoreAppCommand.isRunning;
                  return ListTile(
                    leading: Icon(
                      Icons.restore,
                      color: isRunning ? Colors.grey : Colors.orange,
                    ),
                    title: const Text('Restaurar Aplicativo'),
                    subtitle: const Text('Volta o app ao estado inicial.'),
                    trailing:
                        isRunning
                            ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : const Icon(Icons.chevron_right),
                    onTap: isRunning ? null : _showRestoreConfirmationDialog,
                  );
                },
              ),
              const Divider(),
              const SizedBox(height: 20),
              // Botão Sair
              ListenableBuilder(
                listenable: viewModel.logoutCommand,
                builder: (context, _) {
                  final isRunning = viewModel.logoutCommand.isRunning;
                  return SizedBox(
                    width: size.width,
                    child: ElevatedButton.icon(
                      icon:
                          isRunning
                              ? Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(2.0),
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                              : const Icon(Icons.logout),
                      label: const Text('Sair'),
                      onPressed:
                          isRunning
                              ? null
                              : () => viewModel.logoutCommand.execute(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
