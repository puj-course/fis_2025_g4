import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/modules/auth_domain/show_sign_in_feature/domain/cubit/sign_in_cubit.dart';
import 'package:top_app/shared/widgets/text_fields/gray_text_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
    required this.onEmailChanged,
    required this.onPasswordChanged,
  });

  final Function(String) onEmailChanged;
  final Function(String) onPasswordChanged;

  @override
  State<SignInForm> createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = context.read<SignInCubit>().email;
    _passwordController.text = context.read<SignInCubit>().password;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool validate() {
    return _formKey.currentState?.validate() ?? false;
  }

  String getEmail() {
    return _emailController.text.trim();
  }

  String getPassword() {
    return _passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GrayTextField(
            controller: _emailController,
            label: 'Email',
            hint: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            onChanged: widget.onEmailChanged,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          GrayTextField(
            controller: _passwordController,
            label: 'Password',
            hint: 'Enter your password',
            isObscured: true,
            onChanged: widget.onPasswordChanged,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
