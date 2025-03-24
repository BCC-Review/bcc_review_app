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
    viewModel.getUser(context);
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
            return AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              firstChild: const Text('Carregando...'),
              secondChild: Text('Bem vindo ${viewModel.user?.name ?? "..."}!'),
              crossFadeState:
                  viewModel.user == null
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
            );
          },
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ],
      ),
    );
  }
}
