import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/di/injector.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/domain/cubit/sign_up_cubit.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/presentation/molecules/header_with_counter.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/presentation/molecules/signup_bottom_navigation.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/presentation/organisms/email_question.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/presentation/organisms/name_question.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/presentation/organisms/password_question.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (BuildContext context) => getIt<SignUpCubit>(),
      child: const SignUpScreenContent(),
    );
  }
}

class SignUpScreenContent extends StatefulWidget {
  const SignUpScreenContent({super.key});

  @override
  State<SignUpScreenContent> createState() => _SignUpScreenContentState();
}

class _SignUpScreenContentState extends State<SignUpScreenContent> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 3;

  // Keys for the question widgets
  final GlobalKey<NameQuestionState> _nameQuestionKey = GlobalKey<NameQuestionState>();
  final GlobalKey<EmailQuestionState> _emailQuestionKey = GlobalKey<EmailQuestionState>();
  final GlobalKey<PasswordQuestionState> _passwordQuestionKey = GlobalKey<PasswordQuestionState>();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() async {
    // Validate the current page before proceeding
    bool isValid = false;

    switch (_currentPage) {
      case 0:
        isValid = _nameQuestionKey.currentState?.validate() ?? false;
        if (isValid) {
          // Save name to cubit
          final String name = _nameQuestionKey.currentState?.getName() ?? '';
          context.read<SignUpCubit>().setName(name);
        }
        break;
      case 1:
        isValid = _emailQuestionKey.currentState?.validate() ?? false;
        if (isValid) {
          // Save email to cubit
          final String email = _emailQuestionKey.currentState?.getEmail() ?? '';
          context.read<SignUpCubit>().setEmail(email);
        }
        break;
      case 2:
        isValid = _passwordQuestionKey.currentState?.validate() ?? false;
        if (isValid) {
          // Save password and confirmPassword to cubit
          final String password = _passwordQuestionKey.currentState?.getPassword() ?? '';
          final String confirmPassword =
              _passwordQuestionKey.currentState?.getConfirmPassword() ?? '';
          context.read<SignUpCubit>().setPassword(password);
          context.read<SignUpCubit>().setConfirmPassword(confirmPassword);
        }
        break;
    }

    if (!isValid) {
      // Show error message if validation fails
      CustomSnackBar.error(context, 'Please fix the errors before continuing');
      return;
    }

    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Handle signup completion
      await context.read<SignUpCubit>().signUp();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (BuildContext context, SignUpState state) {
        if (state is SignUpError) {
          CustomSnackBar.error(context, state.message);
        }
        if (state is SignUpSuccess) {
          Navigator.of(context).pop();
          AutoRouter.of(context).replace(CountdownRecordRoute(
            remainingSeconds: context.read<SignUpCubit>().freezedRemainingSeconds,
            rank: context.read<SignUpCubit>().rank,
          ));
        }
      },
      builder: (BuildContext context, SignUpState state) {
        return Scaffold(
          body: SafeArea(
            child:
                // Main content
                Column(
              children: <Widget>[
                const HeaderWithCounter(),
                const SizedBox(height: 30),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        NameQuestion(key: _nameQuestionKey),
                        EmailQuestion(key: _emailQuestionKey),
                        PasswordQuestion(key: _passwordQuestionKey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: SignupBottomNavigation(
              isLoading: state is SignUpLoading || state is SignUpSuccess || state is SignUpSaving,
              isDone: state is SignUpSuccess,
              pageController: _pageController,
              currentPage: _currentPage,
              totalPages: _totalPages,
              onNext: _nextPage,
              onPrevious: _previousPage,
            ),
          ),
        );
      },
    );
  }
}
