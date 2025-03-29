import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({super.key});

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  final subjectId = Routefly.query['id'] ?? '0';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Módulos da disciplina')),
      body: Center(child: Text('Módulos da disciplina: $subjectId')),
    );
  }
}
