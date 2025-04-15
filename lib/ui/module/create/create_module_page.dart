import 'dart:convert';

import 'package:asuka/asuka.dart';
import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/core/exceptions/app_exception.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:bcc_review_app/domain/validators/module_validator.dart';
import 'package:bcc_review_app/ui/module/create/create_module_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Models/configuration.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:result_command/result_command.dart';
import 'package:routefly/routefly.dart';

class CreateModulePage extends StatefulWidget {
  const CreateModulePage({super.key});

  @override
  State<CreateModulePage> createState() => _CreateModulePageState();
}

class _CreateModulePageState extends State<CreateModulePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _iconController = TextEditingController();
  final viewmodel = injector.get<CreateModuleViewModel>();
  IconPickerIcon? _icon;

  bool _firstIconValidation = false;

  ModuleValidator validator = ModuleValidator();

  _pickIcon() async {
    IconPickerIcon? iconPickerIcon = await showIconPicker(
      context,
      configuration: SinglePickerConfiguration(
        iconPackModes: [IconPack.roundedMaterial],
        showTooltips: true,
        iconColor: Theme.of(context).colorScheme.onSurface,
        backgroundColor: Theme.of(context).colorScheme.surface,
        searchHintText: 'Pesquisar ícone',
        title: const Text('Escolha um ícone'),
        closeChild: const Text('Fechar'),
      ),
    );

    if (iconPickerIcon != null) {
      setState(() {
        _icon = iconPickerIcon;
        module.icon = JsonEncoder().convert(serializeIcon(_icon!));
      });
    }
  }

  Module module = Module(
    name: '',
    description: '',
    isOfficial: false,
    icon: '',
  );

  @override
  void initState() {
    super.initState();
    viewmodel.createModuleCommand.addListener(_listenable);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _iconController.dispose();
    viewmodel.createModuleCommand.removeListener(_listenable);
    super.dispose();
  }

  void _listenable() {
    if (viewmodel.createModuleCommand.isSuccess) {
      Routefly.pop(context);
      Routefly.push(
        '/module/create_questions/[moduleId]/form_questions'.replaceAll(
          '[moduleId]',
          viewmodel.createdModule!.id.toString(),
        ),
      );
    } else if (viewmodel.createModuleCommand.isFailure) {
      final failure = viewmodel.createModuleCommand.value as FailureCommand;
      final exception = failure.error as AppException;
      AsukaSnackbar.alert(exception.message).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Módulo')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          child: SizedBox(
            width: size.width,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informações do Módulo',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome do Módulo',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => module.name = value,
                    validator: validator.byField(module, 'name'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Descrição',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                    onChanged: (value) => module.description = value,
                    validator: validator.byField(module, 'description'),
                  ),
                  const SizedBox(height: 24),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Escolha um ícone',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      // Exibição do ícone selecionado
                      InkWell(
                        onTap: _pickIcon,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardTheme.color,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color:
                                  _icon == null && _firstIconValidation
                                      ? Theme.of(context).colorScheme.error
                                      : Theme.of(context)
                                          .inputDecorationTheme
                                          .enabledBorder!
                                          .borderSide
                                          .color,
                              width:
                                  _icon == null && _firstIconValidation
                                      ? 1.5
                                      : 0.5,
                            ),
                          ),
                          child: Center(
                            child:
                                _icon != null
                                    ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          _icon!.data,
                                          size: 48,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Toque para alterar',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                          ),
                                        ),
                                      ],
                                    )
                                    : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_circle_outline,
                                          size: 36,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Toque para escolher um ícone',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Theme.of(
                                                  context,
                                                ).textTheme.bodyMedium?.color,
                                          ),
                                        ),
                                      ],
                                    ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _icon == null && _firstIconValidation,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4, left: 22),
                          child: Text(
                            'Escolha um ícone para o módulo',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.error,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ListenableBuilder(
                      listenable: viewmodel.createModuleCommand,
                      builder: (context, _) {
                        return ElevatedButton(
                          onPressed:
                              viewmodel.createModuleCommand.isRunning
                                  ? null
                                  : () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        _firstIconValidation = true;
                                      });
                                      if (module.icon.isEmpty) {
                                        AsukaSnackbar.alert(
                                          'Escolha um ícone',
                                        ).show();
                                        return;
                                      }
                                      viewmodel.createModuleCommand.execute(
                                        module,
                                      );
                                    }
                                  },
                          child:
                              viewmodel.createModuleCommand.isRunning
                                  ? const SizedBox(
                                    height: 20,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                  : const Text('Criar Módulo'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
