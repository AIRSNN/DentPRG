import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';
import '../../shared/widgets/soft_card.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  static const List<_FinanceSummaryData> _summaryItems = [
    _FinanceSummaryData(
      label: 'Toplam Gelir',
      amount: '₺145.000',
      delta: '+12.4%',
      note: 'Bu ay tahsil edilen toplam gelir',
      tone: _FinanceAccentTone.positive,
      icon: Icons.trending_up_rounded,
    ),
    _FinanceSummaryData(
      label: 'Bekleyen Tahsilat',
      amount: '₺28.400',
      delta: '9 hasta',
      note: 'Tahsilat bekleyen aktif faturalar',
      tone: _FinanceAccentTone.warning,
      icon: Icons.schedule_rounded,
    ),
    _FinanceSummaryData(
      label: 'Aylık Gider',
      amount: '₺41.850',
      delta: '-4.1%',
      note: 'Sarf, personel ve operasyon giderleri',
      tone: _FinanceAccentTone.neutral,
      icon: Icons.payments_rounded,
    ),
    _FinanceSummaryData(
      label: 'Net Nakit Akışı',
      amount: '₺103.150',
      delta: 'Sağlıklı',
      note: 'Gelir ve gider dengesinin özet görünümü',
      tone: _FinanceAccentTone.primary,
      icon: Icons.account_balance_wallet_rounded,
    ),
  ];

  static const List<_FinanceTransactionData> _transactions = [
    _FinanceTransactionData(
      date: '11 Mart 2026',
      type: 'Gelir',
      description: 'Ayşe Kaya - İmplant tahsilatı',
      amount: '₺14.500',
      status: 'Ödendi',
      typeTone: _TransactionTypeTone.income,
      statusTone: _TransactionStatusTone.paid,
    ),
    _FinanceTransactionData(
      date: '10 Mart 2026',
      type: 'Gider',
      description: 'Laboratuvar - Zirkonyum siparişi',
      amount: '₺8.250',
      status: 'Ödendi',
      typeTone: _TransactionTypeTone.expense,
      statusTone: _TransactionStatusTone.paid,
    ),
    _FinanceTransactionData(
      date: '09 Mart 2026',
      type: 'Gelir',
      description: 'Mert Demir - Kanal tedavisi',
      amount: '₺4.500',
      status: 'Bekliyor',
      typeTone: _TransactionTypeTone.income,
      statusTone: _TransactionStatusTone.pending,
    ),
    _FinanceTransactionData(
      date: '08 Mart 2026',
      type: 'Gider',
      description: 'Klinik sarf malzeme alımı',
      amount: '₺3.980',
      status: 'Ödendi',
      typeTone: _TransactionTypeTone.expense,
      statusTone: _TransactionStatusTone.paid,
    ),
    _FinanceTransactionData(
      date: '07 Mart 2026',
      type: 'Gelir',
      description: 'Zeynep Arslan - Şeffaf plak ön ödeme',
      amount: '₺9.000',
      status: 'Bekliyor',
      typeTone: _TransactionTypeTone.income,
      statusTone: _TransactionStatusTone.pending,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
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
                      'Finans ve Muhasebe',
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Kliniğin genel finansal durumu, gelir/gider takibi ve faturalandırma.',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_circle_outline_rounded,
                      size: 18,
                    ),
                    label: const Text('Gider Ekle'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.receipt_long_rounded, size: 18),
                    label: const Text('Yeni Fatura'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 22),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(_summaryItems.length, (index) {
                      final item = _summaryItems[index];

                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: index == _summaryItems.length - 1 ? 0 : 14,
                          ),
                          child: _FinanceSummaryCard(data: item),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Son Finansal İşlemler',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 14),
                  SoftCard(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        const _FinanceTableHeader(),
                        const SizedBox(height: 12),
                        ListView.separated(
                          itemCount: _transactions.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, _) => const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            return _FinanceTransactionRow(
                              data: _transactions[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FinanceSummaryCard extends StatelessWidget {
  const _FinanceSummaryCard({
    required this.data,
  });

  final _FinanceSummaryData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();
    final accent = _accentStyle(data.tone);

    return SoftCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: accent.softBackground,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  data.icon,
                  color: accent.foreground,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: surfaceTheme.baseColor.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  data.delta,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: accent.foreground,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            data.label,
            style: theme.textTheme.labelLarge,
          ),
          const SizedBox(height: 10),
          Text(
            data.amount,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: accent.foreground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.note,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _FinanceTableHeader extends StatelessWidget {
  const _FinanceTableHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: surfaceTheme.baseColor.withValues(alpha: 0.36),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          _headerCell(theme, 'Tarih', 2),
          _headerCell(theme, 'İşlem Tipi', 2),
          _headerCell(theme, 'Hasta / Açıklama', 4),
          _headerCell(theme, 'Tutar', 2),
          _headerCell(theme, 'Durum', 2),
        ],
      ),
    );
  }

  Widget _headerCell(ThemeData theme, String label, int flex) {
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

class _FinanceTransactionRow extends StatelessWidget {
  const _FinanceTransactionRow({
    required this.data,
  });

  final _FinanceTransactionData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();
    final typeStyle = _transactionTypeStyle(data.typeTone);
    final statusStyle = _transactionStatusStyle(data.statusTone);

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
            flex: 2,
            child: Text(
              data.date,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: typeStyle.background,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  data.type,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: typeStyle.foreground,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              data.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              data.amount,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
        ],
      ),
    );
  }
}

_FinanceAccentStyle _accentStyle(_FinanceAccentTone tone) {
  switch (tone) {
    case _FinanceAccentTone.positive:
      return const _FinanceAccentStyle(
        foreground: Color(0xFF3E9A6C),
        softBackground: Color(0x163E9A6C),
      );
    case _FinanceAccentTone.warning:
      return const _FinanceAccentStyle(
        foreground: Color(0xFFD18A4B),
        softBackground: Color(0x19D18A4B),
      );
    case _FinanceAccentTone.neutral:
      return const _FinanceAccentStyle(
        foreground: Color(0xFFC67F69),
        softBackground: Color(0x19C67F69),
      );
    case _FinanceAccentTone.primary:
      return const _FinanceAccentStyle(
        foreground: Color(0xFF5B8C95),
        softBackground: Color(0x195B8C95),
      );
  }
}

_FinancePillStyle _transactionTypeStyle(_TransactionTypeTone tone) {
  switch (tone) {
    case _TransactionTypeTone.income:
      return const _FinancePillStyle(
        background: Color(0x163E9A6C),
        foreground: Color(0xFF3E9A6C),
      );
    case _TransactionTypeTone.expense:
      return const _FinancePillStyle(
        background: Color(0x19CF6767),
        foreground: Color(0xFFCF6767),
      );
  }
}

_FinancePillStyle _transactionStatusStyle(_TransactionStatusTone tone) {
  switch (tone) {
    case _TransactionStatusTone.paid:
      return const _FinancePillStyle(
        background: Color(0x195B8C95),
        foreground: Color(0xFF5B8C95),
      );
    case _TransactionStatusTone.pending:
      return const _FinancePillStyle(
        background: Color(0x19D18A4B),
        foreground: Color(0xFFD18A4B),
      );
  }
}

enum _FinanceAccentTone {
  positive,
  warning,
  neutral,
  primary,
}

enum _TransactionTypeTone {
  income,
  expense,
}

enum _TransactionStatusTone {
  paid,
  pending,
}

class _FinanceAccentStyle {
  const _FinanceAccentStyle({
    required this.foreground,
    required this.softBackground,
  });

  final Color foreground;
  final Color softBackground;
}

class _FinancePillStyle {
  const _FinancePillStyle({
    required this.background,
    required this.foreground,
  });

  final Color background;
  final Color foreground;
}

class _FinanceSummaryData {
  const _FinanceSummaryData({
    required this.label,
    required this.amount,
    required this.delta,
    required this.note,
    required this.tone,
    required this.icon,
  });

  final String label;
  final String amount;
  final String delta;
  final String note;
  final _FinanceAccentTone tone;
  final IconData icon;
}

class _FinanceTransactionData {
  const _FinanceTransactionData({
    required this.date,
    required this.type,
    required this.description,
    required this.amount,
    required this.status,
    required this.typeTone,
    required this.statusTone,
  });

  final String date;
  final String type;
  final String description;
  final String amount;
  final String status;
  final _TransactionTypeTone typeTone;
  final _TransactionStatusTone statusTone;
}
