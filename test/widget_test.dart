import 'package:dentprg/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app builds shell and navigates to patients and appointments', (
    tester,
  ) async {
    await tester.pumpWidget(const DentPrgApp());

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('DentPRG'), findsOneWidget);
    expect(find.text('Dashboard'), findsNWidgets(2));
    expect(find.text('Dr. Selin Yılmaz'), findsOneWidget);
    expect(find.text('Bugünkü Randevu'), findsOneWidget);
    expect(find.text('Bugünkü Randevular'), findsOneWidget);
    expect(find.text('Bekleyen Ödemeler'), findsOneWidget);

    await tester.tap(find.text('Hastalar'));
    await tester.pumpAndSettle();

    expect(find.text('Hasta Listesi'), findsOneWidget);
    expect(find.text('Toplam 1.240 kayıtlı hasta'), findsOneWidget);
    expect(find.text('Yeni Hasta Ekle'), findsOneWidget);
    expect(find.text('Ayşe Kaya'), findsOneWidget);

    await tester.tap(find.text('Randevular'));
    await tester.pumpAndSettle();

    expect(find.text('Randevu Takvimi'), findsOneWidget);
    expect(find.text('10 Mart 2026, Salı'), findsOneWidget);
    expect(find.text('Yeni Randevu'), findsOneWidget);
    expect(find.text('Kanal Tedavisi'), findsOneWidget);
  });
}
