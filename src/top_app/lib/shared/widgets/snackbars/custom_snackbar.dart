import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_app/core/theme/app_colors.dart';

// List to track active snackbars
final List<CustomSnackBar> _activeSnackBars = [];

class CustomSnackBar {
  // Static methods to show different types of snackbars
  static void info(BuildContext context, String message) {
    _show(
      context,
      message,
      AppColors.whitePrimary,
      AppColors.blackPrimary,
      Icons.info_outline,
    );
  }

  static void success(BuildContext context, String message) {
    _show(
      context,
      message,
      Colors.green,
      Colors.white,
      Icons.check_circle_outline,
    );
  }

  static void error(BuildContext context, String message) {
    _show(
      context,
      message,
      Colors.red,
      Colors.white,
      Icons.error_outline,
    );
  }

  // Private properties
  late final OverlayEntry _entry;
  final GlobalKey<_SnackBarContentState> _key = GlobalKey<_SnackBarContentState>();
  bool _removed = false;

  // Private constructor
  CustomSnackBar._();

  // Show a snackbar
  static void _show(
    BuildContext context,
    String message,
    Color backgroundColor,
    Color textColor,
    IconData icon,
  ) {
    // Trigger haptic feedback
    HapticFeedback.lightImpact();

    // Get the top padding for safe area
    final double topPadding = MediaQuery.of(context).padding.top;

    // Create a new snackbar instance
    final snackBar = CustomSnackBar._();

    // Create the overlay entry
    snackBar._entry = OverlayEntry(
      builder: (context) => _SnackBarContent(
        key: snackBar._key,
        message: message,
        backgroundColor: backgroundColor,
        textColor: textColor,
        icon: icon,
        topPadding: topPadding,
        onDismiss: () => snackBar._remove(),
      ),
    );

    // Add to active snackbars
    _activeSnackBars.add(snackBar);

    // Remove any existing snackbars
    _removeExistingSnackBars();

    // Insert the new snackbar
    Overlay.of(context).insert(snackBar._entry);

    // Auto-dismiss after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (!snackBar._removed) {
        // Use the dismiss method to ensure animation plays
        snackBar._key.currentState?.dismiss();
      }
    });
  }

  // Remove all existing snackbars
  static void _removeExistingSnackBars() {
    for (final snackBar in _activeSnackBars) {
      if (!snackBar._removed) {
        snackBar._key.currentState?.dismiss();
      }
    }
  }

  // Remove this snackbar
  void _remove() {
    if (_removed) return;
    _removed = true;
    _activeSnackBars.remove(this);
    _entry.remove();
  }

  // Remove all snackbars
  static void removeAll() {
    for (final snackBar in _activeSnackBars) {
      if (!snackBar._removed) {
        snackBar._key.currentState?.dismiss();
      }
    }
    _activeSnackBars.clear();
  }
}

// Widget to display the snackbar content with animations
class _SnackBarContent extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
  final double topPadding;
  final VoidCallback onDismiss;

  const _SnackBarContent({
    Key? key,
    required this.message,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    required this.topPadding,
    required this.onDismiss,
  }) : super(key: key);

  @override
  State<_SnackBarContent> createState() => _SnackBarContentState();
}

class _SnackBarContentState extends State<_SnackBarContent> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isDismissing = false;

  @override
  void initState() {
    super.initState();

    // Create animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Create animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    // Start the animation
    _controller.forward();
  }

  // Dismiss the snackbar with animation
  void dismiss() {
    if (_isDismissing) return;
    _isDismissing = true;

    _controller.reverse().then((_) {
      widget.onDismiss();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.topPadding + 10,
      left: 20,
      right: 20,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -100 * (1 - _animation.value)),
            child: Opacity(
              opacity: _animation.value,
              child: child,
            ),
          );
        },
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(10),
          color: widget.backgroundColor,
          child: InkWell(
            onTap: dismiss,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(widget.icon, color: widget.textColor),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.message,
                      style: TextStyle(color: widget.textColor),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: widget.textColor, size: 18),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: dismiss,
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
