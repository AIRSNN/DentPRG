import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'features/shell/app_shell.dart';

void main() {
  runApp(const DentPrgApp());
}

class DentPrgApp extends StatefulWidget {
  const DentPrgApp({super.key});

  @override
  State<DentPrgApp> createState() => _DentPrgAppState();
}

class _DentPrgAppState extends State<DentPrgApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DentPRG',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: _themeMode,
      home: Scaffold(
        body: SafeArea(
          child: AppShell(
            themeMode: _themeMode,
            onThemeModeChanged: (themeMode) {
              setState(() {
                _themeMode = themeMode;
              });
            },
          ),
        ),
      ),
    );
  }
}
