import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/di/injector.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/modules/auth_domain/show_sign_in_feature/domain/cubit/sign_in_cubit.dart';
import 'package:top_app/modules/auth_domain/show_sign_in_feature/presentation/molecules/sign_in_bottom_navigation.dart';
import 'package:top_app/modules/auth_domain/show_sign_in_feature/presentation/molecules/sign_in_header.dart';
import 'package:top_app/modules/auth_domain/show_sign_in_feature/presentation/organisms/sign_in_form.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SignInCubit>(),
      child: const SignInScreenContent(),
    );
  }
}

class SignInScreenContent extends StatefulWidget {
  const SignInScreenContent({super.key});

  @override
  State<SignInScreenContent> createState() => _SignInScreenContentState();
}

class _SignInScreenContentState extends State<SignInScreenContent> {
  final GlobalKey<SignInFormState> _formKey = GlobalKey<SignInFormState>();

  Future<void> _handleSignIn() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Get form values and update cubit
      final email = _formKey.currentState?.getEmail() ?? '';
      final password = _formKey.currentState?.getPassword() ?? '';

      final cubit = context.read<SignInCubit>();
      cubit.setEmail(email);
      cubit.setPassword(password);

      // Trigger sign-in
      await cubit.signIn();
    } else {
      CustomSnackBar.error(context, 'Please fix the errors before continuing');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInError) {
          CustomSnackBar.error(context, state.message);
        } else if (state is SignInSuccess) {
          CustomSnackBar.success(context, 'Sign in successful!');

          //TODO: Navigate to home or dashboard
          // AutoRouter.of(context).replace(const HomeRoute());
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              color: AppColors.whitePrimary,
              onPressed: () {
                AutoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: SafeArea(
            child:
                // Main content
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SignInHeader(),
                    const SizedBox(height: 40),
                    SignInForm(
                      key: _formKey,
                      onEmailChanged: (value) => context.read<SignInCubit>().setEmail(value),
                      onPasswordChanged: (value) => context.read<SignInCubit>().setPassword(value),
                    ),
                    const SizedBox(height: 100), // Add space for the button
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: SignInBottomNavigation(
              isLoading: state is SignInLoading,
              onSignIn: () {
                _handleSignIn();
              },
            ),
          ),
        );
      },
    );
  }
}
