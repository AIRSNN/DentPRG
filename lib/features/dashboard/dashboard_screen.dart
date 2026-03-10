import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';
import '../../shared/widgets/soft_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const List<_StatCardData> _stats = [
    _StatCardData(
      title: 'Bugünkü Randevu',
      value: '12',
      detail: '%5 düne göre',
      icon: Icons.trending_up_rounded,
      tone: _AccentTone.success,
    ),
    _StatCardData(
      title: 'Aylık Tahsilat',
      value: '₺45.000',
      detail: 'Mart ayı hedefinin %78i',
      icon: Icons.payments_rounded,
      tone: _AccentTone.primary,
    ),
    _StatCardData(
      title: 'Bekleyen Bakiye',
      value: '₺12.500',
      detail: '5 gecikmiş ödeme',
      icon: Icons.warning_amber_rounded,
      tone: _AccentTone.warning,
    ),
    _StatCardData(
      title: 'Toplam Hasta',
      value: '1.240',
      detail: 'Bu ay +32 yeni kayıt',
      icon: Icons.group_rounded,
      tone: _AccentTone.neutral,
    ),
  ];

  static const List<_AppointmentData> _appointments = [
    _AppointmentData(
      time: '09:00',
      patient: 'Ayşe Kaya',
      initials: 'AK',
      procedure: 'Diş Taşı Temizliği',
      status: 'Bekliyor',
      tone: _AccentTone.warning,
    ),
    _AppointmentData(
      time: '10:30',
      patient: 'Mert Demir',
      initials: 'MD',
      procedure: 'İmplant kontrolü',
      status: 'Hazır',
      tone: _AccentTone.primary,
    ),
    _AppointmentData(
      time: '11:15',
      patient: 'Zeynep Arslan',
      initials: 'ZA',
      procedure: 'Kanal tedavisi',
      status: 'Tamamlandı',
      tone: _AccentTone.success,
    ),
    _AppointmentData(
      time: '13:45',
      patient: 'Can Yıldız',
      initials: 'CY',
      procedure: 'Ortodonti kontrolü',
      status: 'Bekliyor',
      tone: _AccentTone.warning,
    ),
    _AppointmentData(
      time: '15:00',
      patient: 'Elif Koç',
      initials: 'EK',
      procedure: 'Estetik dolgu',
      status: 'Onaylandı',
      tone: _AccentTone.primary,
    ),
  ];

  static const List<_PaymentData> _payments = [
    _PaymentData(
      patient: 'Bora Aydın',
      service: 'İmplant taksidi',
      amount: '₺4.200',
      urgency: '3 gün gecikti',
    ),
    _PaymentData(
      patient: 'Derya Güneş',
      service: 'Ortodonti ödemesi',
      amount: '₺2.800',
      urgency: 'Bugün hatırlat',
    ),
    _PaymentData(
      patient: 'Kerem Tunç',
      service: 'Porselen kaplama',
      amount: '₺3.500',
      urgency: '2 gün sonra vade',
    ),
    _PaymentData(
      patient: 'Sena Polat',
      service: 'Kontrol bakiyesi',
      amount: '₺1.950',
      urgency: '7 gün gecikti',
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
          Text(
            'Dashboard',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 6),
          Text(
            'Bugünün klinik akışı, tahsilat durumu ve operasyonel odak noktaları.',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _stats
                .asMap()
                .entries
                .map(
                  (entry) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: entry.key == _stats.length - 1 ? 0 : 16,
                      ),
                      child: _DashboardStatCard(data: entry.value),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: _DashboardPanel(
                  title: 'Bugünkü Randevular',
                  subtitle: 'Koltuk planı ve hasta akışına göre sıralandı',
                  trailing: Text(
                    '${_appointments.length} kayıt',
                    style: theme.textTheme.bodySmall,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: surfaceTheme.baseColor.withValues(alpha: 0.38),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            _tableHeader(context, 'Saat', 1),
                            _tableHeader(context, 'Hasta', 3),
                            _tableHeader(context, 'İşlem', 3),
                            _tableHeader(context, 'Durum', 2),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      ..._appointments.map(
                        (appointment) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _AppointmentRow(data: appointment),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 4,
                child: _DashboardPanel(
                  title: 'Bekleyen Ödemeler',
                  subtitle: 'Hatırlatma gerektiren son hareketler',
                  trailing: Icon(
                    Icons.receipt_long_rounded,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                  child: Column(
                    children: _payments
                        .map(
                          (payment) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _PaymentRow(data: payment),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tableHeader(BuildContext context, String label, int flex) {
    final theme = Theme.of(context);

    return Expanded(
      flex: flex,
      child: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _DashboardStatCard extends StatelessWidget {
  const _DashboardStatCard({
    required this.data,
  });

  final _StatCardData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = _toneColor(context, data.tone);

    return SoftCard(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              data.icon,
              color: accent,
              size: 22,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            data.title,
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 6),
          Text(
            data.value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(
                data.icon,
                size: 15,
                color: accent,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  data.detail,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: accent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DashboardPanel extends StatelessWidget {
  const _DashboardPanel({
    required this.title,
    required this.subtitle,
    required this.child,
    this.trailing,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SoftCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: 18),
          child,
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
    final accent = _toneColor(context, data.tone);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: surfaceTheme.cardColor.withValues(alpha: 0.74),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: surfaceTheme.borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              data.time,
              style: theme.textTheme.labelLarge,
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.14),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    data.initials,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: accent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    data.patient,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
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
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: accent.withValues(alpha: 0.18),
                  ),
                ),
                child: Text(
                  data.status,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: accent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentRow extends StatelessWidget {
  const _PaymentRow({
    required this.data,
  });

  final _PaymentData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();
    final warningColor = _toneColor(context, _AccentTone.warning);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceTheme.baseColor.withValues(alpha: 0.42),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: surfaceTheme.borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.amount,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  data.patient,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data.service,
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.schedule_rounded,
                      size: 15,
                      color: warningColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      data.urgency,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: warningColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: theme.colorScheme.primary,
              backgroundColor:
                  theme.colorScheme.primary.withValues(alpha: 0.10),
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text('Hatırlat'),
          ),
        ],
      ),
    );
  }
}

Color _toneColor(BuildContext context, _AccentTone tone) {
  final colorScheme = Theme.of(context).colorScheme;

  switch (tone) {
    case _AccentTone.success:
      return const Color(0xFF4D9A72);
    case _AccentTone.warning:
      return const Color(0xFFD18A4B);
    case _AccentTone.primary:
      return colorScheme.primary;
    case _AccentTone.neutral:
      return colorScheme.secondary;
  }
}

enum _AccentTone {
  success,
  warning,
  primary,
  neutral,
}

class _StatCardData {
  const _StatCardData({
    required this.title,
    required this.value,
    required this.detail,
    required this.icon,
    required this.tone,
  });

  final String title;
  final String value;
  final String detail;
  final IconData icon;
  final _AccentTone tone;
}

class _AppointmentData {
  const _AppointmentData({
    required this.time,
    required this.patient,
    required this.initials,
    required this.procedure,
    required this.status,
    required this.tone,
  });

  final String time;
  final String patient;
  final String initials;
  final String procedure;
  final String status;
  final _AccentTone tone;
}

class _PaymentData {
  const _PaymentData({
    required this.patient,
    required this.service,
    required this.amount,
    required this.urgency,
  });

  final String patient;
  final String service;
  final String amount;
  final String urgency;
}
