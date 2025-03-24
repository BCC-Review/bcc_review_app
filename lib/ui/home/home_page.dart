import 'package:bcc_review_app/app_widget.dart';
import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/ui/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
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
    viewModel.logoutCommand.addListener(_listenable);
    viewModel.getUser(context);
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
    return Scaffold(
      appBar: AppBar(
        title: AnimatedBuilder(
          animation: viewModel,
          builder: (context, _) {
            if (viewModel.user != null) {
              return Text('Bem vindo ${viewModel.user!.name}!');
            }
            return const Text('Bem vindo...');
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                viewModel.logoutCommand.execute();
              },
              child: const Text('Sair'),
            ),
          ),
        ],
      ),
    );
  }
}
