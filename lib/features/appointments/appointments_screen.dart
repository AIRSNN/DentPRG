import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';
import '../../shared/widgets/soft_card.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  static const List<_AppointmentData> _appointments = [
    _AppointmentData(
      time: '09:00',
      patientName: 'Ayşe Kaya',
      initials: 'AK',
      doctor: 'Dr. Selin Yılmaz',
      procedure: 'Kanal Tedavisi',
      status: 'Beklemede',
      tone: _AppointmentTone.pending,
      notes: 'İlk seans, radyografi hazır.',
    ),
    _AppointmentData(
      time: '10:15',
      patientName: 'Mert Demir',
      initials: 'MD',
      doctor: 'Dr. Selin Yılmaz',
      procedure: 'İmplant Kontrolü',
      status: 'İşlemde',
      tone: _AppointmentTone.inProgress,
      notes: 'Kontrol filmi alınacak.',
    ),
    _AppointmentData(
      time: '11:30',
      patientName: 'Zeynep Arslan',
      initials: 'ZA',
      doctor: 'Dr. Selin Yılmaz',
      procedure: 'Diş Taşı Temizliği',
      status: 'Tamamlandı',
      tone: _AppointmentTone.completed,
      notes: 'Sonraki kontrol 6 ay sonra.',
    ),
    _AppointmentData(
      time: '13:45',
      patientName: 'Kerem Tunç',
      initials: 'KT',
      doctor: 'Dr. Selin Yılmaz',
      procedure: 'Ortodonti Kontrolü',
      status: 'Beklemede',
      tone: _AppointmentTone.pending,
      notes: 'Braket kontrolü yapılacak.',
    ),
    _AppointmentData(
      time: '16:00',
      patientName: 'Elif Koç',
      initials: 'EK',
      doctor: 'Dr. Selin Yılmaz',
      procedure: 'Estetik Dolgu',
      status: 'İptal',
      tone: _AppointmentTone.cancelled,
      notes: 'Hasta telefonla erteledi.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
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
                      'Randevu Takvimi',
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '10 Mart 2026, Salı',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: surfaceTheme.baseColor.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: const [
                        _ViewToggleChip(
                          label: 'Liste',
                          icon: Icons.view_list_rounded,
                          isSelected: true,
                        ),
                        SizedBox(width: 6),
                        _ViewToggleChip(
                          label: 'Takvim',
                          icon: Icons.calendar_month_rounded,
                          isSelected: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_rounded, size: 18),
                    label: const Text('Yeni Randevu'),
                  ),
                ],
              ),
            ],
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
                      _headerCell(context, 'Saat', 1),
                      _headerCell(context, 'Hasta Adı', 3),
                      _headerCell(context, 'Hekim', 3),
                      _headerCell(context, 'İşlem', 3),
                      _headerCell(context, 'Durum', 2),
                      _headerCell(context, 'Notlar', 3),
                      _headerCell(context, 'İşlemler', 1),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                ListView.separated(
                  itemCount: _appointments.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return _AppointmentRow(data: _appointments[index]);
                  },
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

class _ViewToggleChip extends StatelessWidget {
  const _ViewToggleChip({
    required this.label,
    required this.icon,
    required this.isSelected,
  });

  final String label;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected
            ? colorScheme.primary.withValues(alpha: 0.14)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: isSelected ? colorScheme.primary : theme.colorScheme.onSurface,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: isSelected ? colorScheme.primary : theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _AppointmentRow extends StatelessWidget {
  const _AppointmentRow({
    required this.data,
  });

  final _AppointmentData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();
    final avatarColor = _avatarColor(data.initials);
    final statusStyle = _statusStyle(data.tone);

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
            flex: 1,
            child: Text(
              data.time,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
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
                    data.patientName,
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
              data.doctor,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              data.procedure,
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
                  color: statusStyle.background,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  data.status,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: statusStyle.foreground,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              data.notes,
              style: theme.textTheme.bodySmall,
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
                    Icons.more_horiz_rounded,
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

_AppointmentStatusStyle _statusStyle(_AppointmentTone tone) {
  switch (tone) {
    case _AppointmentTone.pending:
      return const _AppointmentStatusStyle(
        background: Color(0x19D1A14B),
        foreground: Color(0xFFD18A4B),
      );
    case _AppointmentTone.inProgress:
      return const _AppointmentStatusStyle(
        background: Color(0x195B8C95),
        foreground: Color(0xFF5B8C95),
      );
    case _AppointmentTone.completed:
      return const _AppointmentStatusStyle(
        background: Color(0x163E9A6C),
        foreground: Color(0xFF3E9A6C),
      );
    case _AppointmentTone.cancelled:
      return const _AppointmentStatusStyle(
        background: Color(0x19CF6767),
        foreground: Color(0xFFCF6767),
      );
  }
}

enum _AppointmentTone {
  pending,
  inProgress,
  completed,
  cancelled,
}

class _AppointmentStatusStyle {
  const _AppointmentStatusStyle({
    required this.background,
    required this.foreground,
  });

  final Color background;
  final Color foreground;
}

class _AppointmentData {
  const _AppointmentData({
    required this.time,
    required this.patientName,
    required this.initials,
    required this.doctor,
    required this.procedure,
    required this.status,
    required this.tone,
    required this.notes,
  });

  final String time;
  final String patientName;
  final String initials;
  final String doctor;
  final String procedure;
  final String status;
  final _AppointmentTone tone;
  final String notes;
}
