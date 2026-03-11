import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import '../../../shared/widgets/soft_card.dart';
import '../shell_section.dart';

class ShellSidebar extends StatelessWidget {
  const ShellSidebar({
    required this.currentSection,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.onSectionSelected,
    super.key,
  });

  final ShellSection currentSection;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final ValueChanged<ShellSection> onSectionSelected;

  static const List<_SidebarItemData> _items = [
    _SidebarItemData(
      label: 'Dashboard',
      icon: Icons.space_dashboard_rounded,
      section: ShellSection.dashboard,
    ),
    _SidebarItemData(
      label: 'Hastalar',
      icon: Icons.people_alt_rounded,
      section: ShellSection.patients,
      badgeCount: 12,
    ),
    _SidebarItemData(
      label: 'Randevular',
      icon: Icons.event_note_rounded,
      section: ShellSection.appointments,
      badgeCount: 4,
    ),
    _SidebarItemData(
      label: 'Tedaviler',
      icon: Icons.medical_services_rounded,
      section: ShellSection.treatments,
      badgeCount: 5,
    ),
    _SidebarItemData(
      label: 'Finans/Muhasebe',
      icon: Icons.account_balance_wallet_rounded,
      section: ShellSection.finance,
      badgeCount: 6,
    ),
    _SidebarItemData(
      label: 'Ayarlar',
      icon: Icons.settings_rounded,
      section: ShellSection.settings,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();

    return SizedBox(
      width: 248,
      child: SoftCard(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DentPRG',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Klinik kontrol alanı',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _items.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return _SidebarMenuItem(
                    item: item,
                    isSelected: item.section == currentSection,
                    onTap: item.section == null
                        ? null
                        : () => onSectionSelected(item.section!),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 18),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: surfaceTheme.baseColor.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: surfaceTheme.borderColor),
              ),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      themeMode == ThemeMode.dark
                          ? Icons.dark_mode_rounded
                          : Icons.light_mode_rounded,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tema',
                          style: theme.textTheme.labelLarge,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          themeMode == ThemeMode.dark
                              ? 'Gece modu'
                              : 'Gündüz modu',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      onThemeModeChanged(
                        value ? ThemeMode.dark : ThemeMode.light,
                      );
                    },
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

class _SidebarMenuItem extends StatelessWidget {
  const _SidebarMenuItem({
    required this.item,
    required this.isSelected,
    this.onTap,
  });

  final _SidebarItemData item;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();

    final backgroundColor = isSelected
        ? colorScheme.primary.withValues(alpha: 0.12)
        : Colors.transparent;
    final foregroundColor =
        isSelected ? colorScheme.primary : colorScheme.onSurface;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary.withValues(alpha: 0.18)
                  : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              Icon(item.icon, color: foregroundColor, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item.label,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: foregroundColor,
                  ),
                ),
              ),
              if (item.badgeCount != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? colorScheme.primary
                        : surfaceTheme.baseColor.withValues(alpha: 0.75),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: isSelected
                          ? colorScheme.primary.withValues(alpha: 0.35)
                          : surfaceTheme.borderColor,
                    ),
                  ),
                  child: Text(
                    '${item.badgeCount}',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: isSelected
                          ? colorScheme.onPrimary
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SidebarItemData {
  const _SidebarItemData({
    required this.label,
    required this.icon,
    this.section,
    this.badgeCount,
  });

  final String label;
  final IconData icon;
  final ShellSection? section;
  final int? badgeCount;
}
