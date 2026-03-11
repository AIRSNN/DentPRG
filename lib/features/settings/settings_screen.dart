import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';
import '../../shared/widgets/soft_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          Text(
            'Klinik ve Sistem Ayarları',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 6),
          Text(
            'Klinik profili, bildirimler ve entegrasyon tercihleri',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 22),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SoftCard(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Klinik Bilgileri',
                            style: theme.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Kliniğin temel iletişim ve profil alanları',
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(height: 20),
                          _SettingsField(
                            label: 'Klinik Adı',
                            value: 'DentPRG',
                            icon: Icons.local_hospital_rounded,
                          ),
                          const SizedBox(height: 14),
                          _SettingsField(
                            label: 'Telefon',
                            value: '+90 212 444 90 90',
                            icon: Icons.call_rounded,
                          ),
                          const SizedBox(height: 14),
                          _SettingsField(
                            label: 'E-posta',
                            value: 'iletisim@dentprg.com',
                            icon: Icons.mail_rounded,
                          ),
                          const SizedBox(height: 14),
                          _SettingsField(
                            label: 'Adres',
                            value: 'Nisbetiye Cad. No:24 Besiktas / Istanbul',
                            icon: Icons.location_on_rounded,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: SoftCard(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sistem Tercihleri',
                            style: theme.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Hatırlatma, entegrasyon ve deneyim tercihleri',
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(height: 20),
                          _SettingsSwitchTile(
                            title: 'Randevu Hatırlatıcı SMS\'leri',
                            subtitle:
                                'Yaklaşan randevular için otomatik bildirim',
                            value: true,
                          ),
                          const SizedBox(height: 12),
                          _SettingsSwitchTile(
                            title: 'E-Fatura Entegrasyonu',
                            subtitle:
                                'Resmi belge akışlarını otomatikleştir',
                            value: false,
                          ),
                          const SizedBox(height: 12),
                          _SettingsSwitchTile(
                            title: 'Koyu Tema Varsayılan',
                            subtitle:
                                'Yeni oturumlarda koyu arayüzü kullan',
                            value: false,
                          ),
                          const SizedBox(height: 12),
                          _SettingsSwitchTile(
                            title: 'Gün Sonu Finans Özeti',
                            subtitle:
                                'Her akşam yönetici paneline özet gönder',
                            value: true,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: surfaceTheme.baseColor.withValues(alpha: 0.44),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.admin_panel_settings_rounded,
                                  color: theme.colorScheme.primary,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Değişiklikler otomatik kayıt modunda demo olarak görüntüleniyor.',
                                    style: theme.textTheme.bodySmall,
                                  ),
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
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsField extends StatelessWidget {
  const _SettingsField({
    required this.label,
    required this.value,
    required this.icon,
    this.maxLines = 1,
  });

  final String label;
  final String value;
  final IconData icon;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: TextEditingController(text: value),
          maxLines: maxLines,
          readOnly: true,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 18),
          ),
        ),
      ],
    );
  }
}

class _SettingsSwitchTile extends StatelessWidget {
  const _SettingsSwitchTile({
    required this.title,
    required this.subtitle,
    required this.value,
  });

  final String title;
  final String subtitle;
  final bool value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: surfaceTheme.baseColor.withValues(alpha: 0.34),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: surfaceTheme.borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
