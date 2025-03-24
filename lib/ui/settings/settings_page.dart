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
    viewModel.logoutCommand.addListener(_listenable);
    super.initState();
  }

  @override
  void dispose() {
    viewModel.logoutCommand.removeListener(_listenable);
    super.dispose();
  }

  void _listenable() {
    if (viewModel.logoutCommand.isSuccess) {
      Routefly.navigate(routePaths.login);
    } else if (viewModel.logoutCommand.isFailure) {
      final failure = viewModel.logoutCommand.value as FailureCommand;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(failure.error.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
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
              ListenableBuilder(
                listenable: viewModel,
                builder: (context, _) {
                  return ListTile(
                    leading: const Icon(Icons.dark_mode),
                    trailing: Switch(
                      value: viewModel.isDarkMode,
                      onChanged: (value) => viewModel.toggleDarkMode(),
                    ),
                    title: const Text('Modo escuro'),
                  );
                },
              ),
              ListenableBuilder(
                listenable: viewModel.logoutCommand,
                builder: (context, _) {
                  return SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                      onPressed:
                          viewModel.logoutCommand.isRunning
                              ? null
                              : () {
                                viewModel.logoutCommand.execute();
                              },
                      child:
                          viewModel.logoutCommand.isRunning
                              ? SizedBox(
                                height: 20,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: const CircularProgressIndicator(),
                                ),
                              )
                              : const Text('Sair'),
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
