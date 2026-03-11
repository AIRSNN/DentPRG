import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';
import '../../shared/widgets/soft_card.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  static const List<_PatientData> _patients = [
    _PatientData(
      fullName: 'Ayşe Kaya',
      initials: 'AK',
      contact: '0532 412 18 44',
      lastVisit: '28 Şubat 2026',
      nextAppointment: '12 Mart 2026, 10:30',
      balanceLabel: 'Borçsuz',
      balanceTone: _BalanceTone.clear,
    ),
    _PatientData(
      fullName: 'Mert Demir',
      initials: 'MD',
      contact: 'mert.demir@gmail.com',
      lastVisit: '03 Mart 2026',
      nextAppointment: '15 Mart 2026, 14:00',
      balanceLabel: '500 TL Borç',
      balanceTone: _BalanceTone.debt,
    ),
    _PatientData(
      fullName: 'Zeynep Arslan',
      initials: 'ZA',
      contact: '0544 221 09 73',
      lastVisit: '08 Mart 2026',
      nextAppointment: '18 Mart 2026, 09:15',
      balanceLabel: 'Alacaklı',
      balanceTone: _BalanceTone.credit,
    ),
    _PatientData(
      fullName: 'Kerem Tunç',
      initials: 'KT',
      contact: 'kerem.tunc@dentmail.com',
      lastVisit: '21 Şubat 2026',
      nextAppointment: '20 Mart 2026, 11:45',
      balanceLabel: '1.250 TL Borç',
      balanceTone: _BalanceTone.debt,
    ),
    _PatientData(
      fullName: 'Elif Koç',
      initials: 'EK',
      contact: '0536 818 22 10',
      lastVisit: '10 Mart 2026',
      nextAppointment: '25 Mart 2026, 16:20',
      balanceLabel: 'Borçsuz',
      balanceTone: _BalanceTone.clear,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hasta Listesi',
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Toplam 1.240 kayıtlı hasta',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_rounded, size: 18),
                label: const Text('Yeni Hasta Ekle'),
              ),
            ],
          ),
          const SizedBox(height: 22),
          SoftCard(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              children: [
                Icon(
                  Icons.search_rounded,
                  color: theme.textTheme.bodySmall?.color,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Hasta adı, TC veya telefon ile ara...',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: surfaceTheme.baseColor.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.tune_rounded,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Filtrele',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          SoftCard(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: surfaceTheme.baseColor.withValues(alpha: 0.36),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      _headerCell(context, 'Hasta Adı Soyadı', 3),
                      _headerCell(context, 'İletişim', 3),
                      _headerCell(context, 'Son Ziyaret', 2),
                      _headerCell(context, 'Gelecek Randevu', 3),
                      _headerCell(context, 'Bakiye Durumu', 2),
                      _headerCell(context, 'İşlemler', 1),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                ListView.separated(
                  itemCount: _patients.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return _PatientRow(data: _patients[index]);
                  },
                ),
                const SizedBox(height: 18),
                _PatientsPagination(
                  currentPage: 2,
                  totalPages: 26,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerCell(BuildContext context, String label, int flex) {
    final theme = Theme.of(context);

    return Expanded(
      flex: flex,
      child: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _PatientsPagination extends StatelessWidget {
  const _PatientsPagination({
    required this.currentPage,
    required this.totalPages,
  });

  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: surfaceTheme.baseColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _PaginationControl(
            label: 'Önceki',
            icon: Icons.chevron_left_rounded,
            isPrimary: false,
            onTap: () {},
          ),
          const SizedBox(width: 10),
          ...List.generate(4, (index) {
            final page = index + 1;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _PaginationChip(
                label: '$page',
                isSelected: page == currentPage,
                onTap: () {},
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              '...',
              style: theme.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _PaginationChip(
              label: '$totalPages',
              isSelected: false,
              onTap: () {},
            ),
          ),
          const Spacer(),
          Text(
            'Sayfa $currentPage / $totalPages',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 12),
          _PaginationControl(
            label: 'Sonraki',
            icon: Icons.chevron_right_rounded,
            isPrimary: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _PaginationControl extends StatelessWidget {
  const _PaginationControl({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isPrimary
              ? colorScheme.primary.withValues(alpha: 0.14)
              : surfaceTheme.cardColor.withValues(alpha: 0.88),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isPrimary
                ? colorScheme.primary.withValues(alpha: 0.16)
                : surfaceTheme.borderColor,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: isPrimary ? colorScheme.primary : colorScheme.onSurface,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: theme.textTheme.labelLarge?.copyWith(
                color: isPrimary ? colorScheme.primary : colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaginationChip extends StatelessWidget {
  const _PaginationChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : surfaceTheme.cardColor.withValues(alpha: 0.88),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? colorScheme.primary.withValues(alpha: 0.2)
                : surfaceTheme.borderColor,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(
            color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

class _PatientRow extends StatelessWidget {
  const _PatientRow({
    required this.data,
  });

  final _PatientData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();
    final avatarColor = _avatarColor(data.initials);
    final balanceStyle = _balanceStyle(data.balanceTone);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: surfaceTheme.cardColor.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: surfaceTheme.borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: avatarColor.withValues(alpha: 0.14),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    data.initials,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: avatarColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    data.fullName,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              data.contact,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              data.lastVisit,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              data.nextAppointment,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: balanceStyle.background,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  data.balanceLabel,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: balanceStyle.foreground,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: surfaceTheme.baseColor.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit_outlined,
                    size: 18,
                    color: theme.colorScheme.primary,
                  ),
                  splashRadius: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Color _avatarColor(String initials) {
  const palette = [
    Color(0xFF5B8C95),
    Color(0xFF7A9E7E),
    Color(0xFFB17D63),
    Color(0xFF8B7CB6),
    Color(0xFF5C9FB2),
  ];

  return palette[initials.codeUnitAt(0) % palette.length];
}

_BalanceStyle _balanceStyle(_BalanceTone tone) {
  switch (tone) {
    case _BalanceTone.clear:
      return const _BalanceStyle(
        background: Color(0x163E9A6C),
        foreground: Color(0xFF3E9A6C),
      );
    case _BalanceTone.debt:
      return const _BalanceStyle(
        background: Color(0x19D18A4B),
        foreground: Color(0xFFD18A4B),
      );
    case _BalanceTone.credit:
      return const _BalanceStyle(
        background: Color(0x19CF6767),
        foreground: Color(0xFFCF6767),
      );
  }
}

enum _BalanceTone {
  clear,
  debt,
  credit,
}

class _BalanceStyle {
  const _BalanceStyle({
    required this.background,
    required this.foreground,
  });

  final Color background;
  final Color foreground;
}

class _PatientData {
  const _PatientData({
    required this.fullName,
    required this.initials,
    required this.contact,
    required this.lastVisit,
    required this.nextAppointment,
    required this.balanceLabel,
    required this.balanceTone,
  });

  final String fullName;
  final String initials;
  final String contact;
  final String lastVisit;
  final String nextAppointment;
  final String balanceLabel;
  final _BalanceTone balanceTone;
}
