import 'package:flutter/material.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/atoms/custom_dot_page_indicator.dart';
import 'package:top_app/shared/widgets/buttons/underlined_text_button.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';

/// A molecule component that displays the bottom navigation for the signup flow.
///
/// This includes:
/// - Dot indicator showing the current page
/// - Go back button (only shown after the first page)
/// - Continue/Create Account button
class SignupBottomNavigation extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const SignupBottomNavigation({
    super.key,
    required this.pageController,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
              controller: pageController,
              count: totalPages,
            ),
          ),

          const SizedBox(height: 15),

          // Go Back button (only shown after first screen)
          if (currentPage > 0) ...[
            UnderlinedTextButton(
              text: 'Go Back',
              onPressed: onPrevious,
            ),
            const SizedBox(height: 15),
          ],

          // Continue button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: WhiteFilledButton(
              text: currentPage == totalPages - 1 ? 'Create Account' : 'Continue',
              onPressed: onNext,
            ),
          ),
        ],
      ),
    );
  }
}
