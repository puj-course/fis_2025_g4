import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';

class WhiteFilledButton extends StatefulWidget {
  const WhiteFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.hasHaptic = true,
    this.isLoading = false,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.textStyle,
    this.borderRadius = 10,
    this.doneIcon,
    this.isDone = false,
    this.doneInfoMessage,
  });

  final String text;
  final VoidCallback onPressed;
  final bool hasHaptic;
  final bool isLoading;
  final EdgeInsets padding;
  final TextStyle? textStyle;
  final double borderRadius;
  final Widget? doneIcon;
  final bool isDone;
  final String? doneInfoMessage;
  @override
  State<WhiteFilledButton> createState() => _WhiteFilledButtonState();
}

class _WhiteFilledButtonState extends State<WhiteFilledButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: ElevatedButton(
          onPressed: widget.isLoading || widget.isDone
              ? () {
                  CustomSnackBar.info(
                      context, widget.doneInfoMessage ?? 'This action is already done');
                }
              : widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.whitePrimary,
            foregroundColor: AppColors.blackPrimary,
            padding: widget.padding,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: widget.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: AppColors.blackPrimary,
                      strokeWidth: 2,
                    ),
                  )
                : widget.isDone && widget.doneIcon != null
                    ? widget.doneIcon!
                    : Text(
                        widget.text,
                        style: widget.textStyle ??
                            AppTextStyles.bold16.copyWith(color: AppColors.blackPrimary),
                      ),
          ),
        ),
      ),
    );
  }
}
