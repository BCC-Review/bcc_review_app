import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? shadowColor;
  final Function() onPressed;
  final String? text;

  const CustomElevatedButton({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.shadowColor,
    required this.onPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: foregroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: shadowColor ?? Colors.white, width: 0.4),
      ),
      padding: const EdgeInsets.only(bottom: 5),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          padding: const EdgeInsets.all(0),
          foregroundColor:
              foregroundColor ?? Theme.of(context).colorScheme.error,
          textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.error,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          shadowColor: shadowColor ?? Theme.of(context).colorScheme.primary,
        ),
        onPressed: onPressed,
        child: Text(text?.toUpperCase() ?? 'OK'),
      ),
    );
  }
}
