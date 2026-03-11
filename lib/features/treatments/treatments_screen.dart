import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';
import '../../shared/widgets/soft_card.dart';

class TreatmentsScreen extends StatelessWidget {
  const TreatmentsScreen({super.key});

  static const List<_TreatmentData> _treatments = [
    _TreatmentData(
      code: 'TR-01',
      name: 'İmplant Uygulaması',
      category: 'Cerrahi',
      price: '₺14.500',
      tone: _TreatmentCategoryTone.surgical,
    ),
    _TreatmentData(
      code: 'TR-02',
      name: 'Kanal Tedavisi',
      category: 'Endodonti',
      price: '₺4.500',
      tone: _TreatmentCategoryTone.endodontic,
    ),
    _TreatmentData(
      code: 'TR-03',
      name: 'Estetik Dolgu',
      category: 'Restoratif',
      price: '₺2.750',
      tone: _TreatmentCategoryTone.restorative,
    ),
    _TreatmentData(
      code: 'TR-04',
      name: 'Diş Taşı Temizliği',
      category: 'Periodonti',
      price: '₺1.350',
      tone: _TreatmentCategoryTone.periodontal,
    ),
    _TreatmentData(
      code: 'TR-05',
      name: 'Şeffaf Plak Planlaması',
      category: 'Ortodonti',
      price: '₺18.000',
      tone: _TreatmentCategoryTone.orthodontic,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();

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
                      'Tedavi ve İşlem Kataloğu',
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Klinikte uygulanan standart işlemler ve fiyatlandırmalar',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.category_rounded, size: 18),
                    label: const Text('Kategorileri Yönet'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_rounded, size: 18),
                    label: const Text('Yeni İşlem Ekle'),
                  ),
                ],
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
                    'İşlem adı, kodu veya kategori ile ara...',
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
                        'Tüm Kategoriler',
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
          Expanded(
            child: SingleChildScrollView(
              child: SoftCard(
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
                          _headerCell(context, 'İşlem Kodu', 2),
                          _headerCell(context, 'İşlem Adı', 4),
                          _headerCell(context, 'Kategori', 3),
                          _headerCell(context, 'Taban Fiyat', 2),
                          _headerCell(context, 'İşlemler', 1),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListView.separated(
                      itemCount: _treatments.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return _TreatmentRow(data: _treatments[index]);
                      },
                    ),
                  ],
                ),
              ),
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

class _TreatmentRow extends StatelessWidget {
  const _TreatmentRow({
    required this.data,
  });

  final _TreatmentData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();
    final categoryStyle = _categoryStyle(data.tone);

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
              data.code,
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              data.name,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: categoryStyle.background,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  data.category,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: categoryStyle.foreground,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              data.price,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
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

_CategoryStyle _categoryStyle(_TreatmentCategoryTone tone) {
  switch (tone) {
    case _TreatmentCategoryTone.surgical:
      return const _CategoryStyle(
        background: Color(0x195B8C95),
        foreground: Color(0xFF5B8C95),
      );
    case _TreatmentCategoryTone.endodontic:
      return const _CategoryStyle(
        background: Color(0x19D18A4B),
        foreground: Color(0xFFD18A4B),
      );
    case _TreatmentCategoryTone.restorative:
      return const _CategoryStyle(
        background: Color(0x19C67F69),
        foreground: Color(0xFFC67F69),
      );
    case _TreatmentCategoryTone.periodontal:
      return const _CategoryStyle(
        background: Color(0x163E9A6C),
        foreground: Color(0xFF3E9A6C),
      );
    case _TreatmentCategoryTone.orthodontic:
      return const _CategoryStyle(
        background: Color(0x198B7CB6),
        foreground: Color(0xFF8B7CB6),
      );
  }
}

enum _TreatmentCategoryTone {
  surgical,
  endodontic,
  restorative,
  periodontal,
  orthodontic,
}

class _CategoryStyle {
  const _CategoryStyle({
    required this.background,
    required this.foreground,
  });

  final Color background;
  final Color foreground;
}

class _TreatmentData {
  const _TreatmentData({
    required this.code,
    required this.name,
    required this.category,
    required this.price,
    required this.tone,
  });

  final String code;
  final String name;
  final String category;
  final String price;
  final _TreatmentCategoryTone tone;
}
