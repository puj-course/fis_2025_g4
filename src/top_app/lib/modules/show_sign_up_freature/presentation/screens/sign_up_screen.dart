import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/di/injector.dart';
import 'package:top_app/modules/show_sign_up_freature/domain/cubit/sign_up_cubit.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/molecules/header_with_counter.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/molecules/signup_bottom_navigation.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/organisms/email_question.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/organisms/name_question.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/organisms/password_question.dart';
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
    return BlocProvider(
      create: (context) => getIt<SignUpCubit>(),
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

  void _nextPage() {
    // Validate the current page before proceeding
    bool isValid = false;

    switch (_currentPage) {
      case 0:
        isValid = _nameQuestionKey.currentState?.validate() ?? false;
        if (isValid) {
          // Save name to cubit
          final name = _nameQuestionKey.currentState?.getName() ?? '';
          context.read<SignUpCubit>().setName(name);
        }
        break;
      case 1:
        isValid = _emailQuestionKey.currentState?.validate() ?? false;
        if (isValid) {
          // Save email to cubit
          final email = _emailQuestionKey.currentState?.getEmail() ?? '';
          context.read<SignUpCubit>().setEmail(email);
        }
        break;
      case 2:
        isValid = _passwordQuestionKey.currentState?.validate() ?? false;
        if (isValid) {
          // Save password and confirmPassword to cubit
          final password = _passwordQuestionKey.currentState?.getPassword() ?? '';
          final confirmPassword = _passwordQuestionKey.currentState?.getConfirmPassword() ?? '';
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
      CustomSnackBar.success(context, 'Account created successfully!');
      //TODO: Sumbit form to API and navigate to home screen
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
      listener: (context, state) {
        if (state is SignUpError) {
          CustomSnackBar.error(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                // Main content
                Column(
                  children: [
                    const HeaderWithCounter(),
                    const SizedBox(height: 30),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: PageView(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: [
                            NameQuestion(key: _nameQuestionKey),
                            EmailQuestion(key: _emailQuestionKey),
                            PasswordQuestion(key: _passwordQuestionKey),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Bottom navigation
                SignupBottomNavigation(
                  pageController: _pageController,
                  currentPage: _currentPage,
                  totalPages: _totalPages,
                  onNext: _nextPage,
                  onPrevious: _previousPage,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
