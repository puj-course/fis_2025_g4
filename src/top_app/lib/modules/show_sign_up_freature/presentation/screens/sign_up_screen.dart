import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/atoms/custom_dot_page_indicator.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/molecules/header_with_counter.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/organisms/email_question.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/organisms/name_question.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/organisms/password_question.dart';
import 'package:top_app/shared/widgets/buttons/underlined_text_button.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        break;
      case 1:
        isValid = _emailQuestionKey.currentState?.validate() ?? false;
        break;
      case 2:
        isValid = _passwordQuestionKey.currentState?.validate() ?? false;
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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Header with counter
            SafeArea(
              child: Column(
                children: [
                  HeaderWithCounter(),
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
            ),

            // Bottom navigation elements (dot indicator, go back button, continue button)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Dot indicator
                  Center(
                    child: CustomDotPageIndicator(
                      controller: _pageController,
                      count: _totalPages,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Go Back button (only shown after first screen)
                  if (_currentPage > 0) ...[
                    UnderlinedTextButton(
                      text: 'Go Back',
                      onPressed: _previousPage,
                    ),
                    const SizedBox(height: 15),
                  ],

                  // Continue button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: WhiteFilledButton(
                      text: _currentPage == _totalPages - 1 ? 'Create Account' : 'Continue',
                      onPressed: _nextPage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
