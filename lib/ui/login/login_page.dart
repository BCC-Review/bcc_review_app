import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:bcc_review_app/app_widget.dart';
import 'package:bcc_review_app/config/dependecies.dart';
import 'package:bcc_review_app/core/exceptions/app_exception.dart';
import 'package:bcc_review_app/core/ui/widgets/logo_widget.dart';
import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:bcc_review_app/domain/validators/user_validator.dart';
import 'package:bcc_review_app/ui/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:routefly/routefly.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final viewmodel = injector.get<LoginViewModel>();
  final userValidator = UserValidator();
  final User user = User(name: '');

  @override
  void initState() {
    _usernameFocus.requestFocus();
    viewmodel.loginCommand.addListener(_listenable);
    super.initState();
  }

  @override
  void dispose() {
    _usernameFocus.dispose();
    viewmodel.loginCommand.removeListener(_listenable);
    super.dispose();
  }

  void _listenable() {
    if (viewmodel.loginCommand.isSuccess) {
      Routefly.navigate(routePaths.home);
    } else if (viewmodel.loginCommand.isFailure) {
      final failure = viewmodel.loginCommand.value as FailureCommand;
      final exception = failure.error as AppException;
      AsukaSnackbar.alert(exception.message).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
        child: SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LogoWidget(),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Insira um nome de usuário',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      focusNode: _usernameFocus,
                      decoration: InputDecoration(
                        hintText: 'Digite seu nome de usuário',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => user.name = value,
                      validator: userValidator.byField(user, 'name'),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ListenableBuilder(
                        listenable: viewmodel.loginCommand,
                        builder: (context, _) {
                          return ElevatedButton(
                            onPressed:
                                viewmodel.loginCommand.isRunning
                                    ? null
                                    : () {
                                      if (_formKey.currentState!.validate()) {
                                        _usernameFocus.unfocus();
                                        viewmodel.loginCommand.execute(user);
                                      }
                                    },
                            child:
                                viewmodel.loginCommand.isRunning
                                    ? SizedBox(
                                      height: 20,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child:
                                            const CircularProgressIndicator(),
                                      ),
                                    )
                                    : const Text('Entrar'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
