import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';
import '../../shared/widgets/soft_card.dart';
import '../appointments/appointments_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../patients/patients_screen.dart';
import 'shell_section.dart';
import 'widgets/shell_sidebar.dart';
import 'widgets/shell_topbar.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    required this.themeMode,
    required this.onThemeModeChanged,
    super.key,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  ShellSection _currentSection = ShellSection.dashboard;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();

    final currentScreen = switch (_currentSection) {
      ShellSection.dashboard => const DashboardScreen(),
      ShellSection.patients => const PatientsScreen(),
      ShellSection.appointments => const AppointmentsScreen(),
    };

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          ShellSidebar(
            currentSection: _currentSection,
            themeMode: widget.themeMode,
            onThemeModeChanged: widget.onThemeModeChanged,
            onSectionSelected: (section) {
              setState(() {
                _currentSection = section;
              });
            },
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: [
                const ShellTopbar(),
                const SizedBox(height: 24),
                Expanded(
                  child: SoftCard(
                    padding: EdgeInsets.zero,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            surfaceTheme.cardColor.withValues(alpha: 0.9),
                            surfaceTheme.baseColor.withValues(alpha: 0.74),
                          ],
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24),
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 220),
                          switchInCurve: Curves.easeOut,
                          switchOutCurve: Curves.easeOut,
                          child: KeyedSubtree(
                            key: ValueKey<ShellSection>(_currentSection),
                            child: currentScreen,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
