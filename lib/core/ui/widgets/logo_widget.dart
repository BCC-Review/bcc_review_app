import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Text(
          '<',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 50,
            height: 0,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'BCC',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize:
                    Theme.of(context).textTheme.headlineLarge?.fontSize ?? 20,
                height: 0,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              'Review',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize:
                    Theme.of(context).textTheme.headlineMedium?.fontSize ?? 20,
                height: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Text(
          '>',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 50,
            height: 0,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
