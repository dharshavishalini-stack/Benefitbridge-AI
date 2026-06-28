import 'package:flutter/material.dart';

/// Temporary placeholder widget used by named routes until
/// individual screen modules are implemented in later phases.
class RoutePlaceholder extends StatelessWidget {
  const RoutePlaceholder({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          '$title — Coming Soon',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
