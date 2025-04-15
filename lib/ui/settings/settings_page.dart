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
    viewModel.saveApiKeyCommand.addListener(_saveApiKeyListenable);
    viewModel.deleteApiKeyCommand.addListener(_deleteApiKeyListenable);
    super.initState();
  }

  @override
  void dispose() {
    viewModel.logoutCommand.removeListener(_logoutListenable);
    viewModel.restoreAppCommand.removeListener(_restoreAppListenable);
    viewModel.saveApiKeyCommand.removeListener(_saveApiKeyListenable);
    viewModel.deleteApiKeyCommand.removeListener(_deleteApiKeyListenable);
    super.dispose();
  }

  void _deleteApiKeyListenable() {
    if (!mounted) return;

    if (viewModel.deleteApiKeyCommand.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chave API excluída com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    } else if (viewModel.deleteApiKeyCommand.isFailure) {
      final failure = viewModel.deleteApiKeyCommand.value as FailureCommand;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao excluir a chave: ${failure.error}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _logoutListenable() {
    if (!mounted) return;
    if (viewModel.logoutCommand.isSuccess) {
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
    if (!mounted) return;
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

  void _saveApiKeyListenable() {
    if (!mounted) return;
    if (viewModel.saveApiKeyCommand.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chave API salva com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    } else if (viewModel.saveApiKeyCommand.isFailure) {
      final failure = viewModel.saveApiKeyCommand.value as FailureCommand;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao salvar a chave: ${failure.error}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _showRestoreConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
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

  Future<void> _showApiKeyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Configurar Chave API Gemini'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Digite sua chave API do Gemini para habilitar recursos de IA.',
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: viewModel.apiKeyController,
                  decoration: const InputDecoration(
                    hintText: 'Digite sua chave API aqui',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: [
            if (viewModel.apiKey != null)
              TextButton(
                onPressed: () {
                  viewModel.deleteApiKeyCommand.execute().then((_) {
                    Navigator.of(dialogContext).pop();
                  });
                },
                child: const Text(
                  'Excluir',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            TextButton(
              onPressed: () {
                viewModel.apiKeyController.text = '';
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancelar'),
            ),
            ValueListenableBuilder(
              valueListenable: viewModel.apiKeyController,
              builder: (context, value, child) {
                return ListenableBuilder(
                  listenable: viewModel.saveApiKeyCommand,
                  builder: (context, _) {
                    final isRunning = viewModel.saveApiKeyCommand.isRunning;
                    final isEmpty = value.text.trim().isEmpty;

                    return TextButton(
                      onPressed:
                          isRunning || isEmpty
                              ? null
                              : () {
                                viewModel.saveApiKeyCommand.execute().then((_) {
                                  Navigator.of(dialogContext).pop();
                                });
                              },
                      child:
                          isRunning
                              ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                              : const Text('Salvar'),
                    );
                  },
                );
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
                listenable: viewModel,
                builder: (context, _) {
                  return ListTile(
                    leading: const Icon(Icons.dark_mode_outlined),
                    title: const Text('Modo Escuro'),
                    trailing: Switch(
                      value: viewModel.isDarkMode,
                      onChanged: (value) => viewModel.toggleDarkMode(),
                    ),
                    onTap: viewModel.toggleDarkMode,
                  );
                },
              ),
              const Divider(),
              // API Key Gemini
              ListenableBuilder(
                listenable: viewModel,
                builder: (context, _) {
                  return ListTile(
                    leading: const Icon(Icons.key),
                    title: const Text('Chave API Gemini'),
                    subtitle: Text(
                      viewModel.apiKey != null
                          ? 'Chave configurada'
                          : 'Chave não configurada',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: _showApiKeyDialog,
                    ),
                  );
                },
              ),
              const Divider(),
              // Restaurar Aplicativo
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
