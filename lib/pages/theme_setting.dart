import 'package:flutter/material.dart';

class ThemeSettings {
  static bool darkMode = false;
}

class ReloadApp extends StatefulWidget {
  final Widget Function(BuildContext) builder;

  ReloadApp({required this.builder});

  @override
  ReloadAppState createState() => ReloadAppState();

  static ReloadAppState of(BuildContext context) {
    final ReloadAppState? result = context.findAncestorStateOfType<ReloadAppState>();
    assert(result != null, 'No ReloadAppState found in context');
    return result!;
  }
}

class ReloadAppState extends State<ReloadApp> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  void rebuild() {
    setState(() {});
  }
}
