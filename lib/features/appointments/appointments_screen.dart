import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';
import '../../shared/widgets/soft_card.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  static const List<_AppointmentData> _appointments = [
    _AppointmentData(
      time: '09:00',
      endTime: '09:45',
      patientName: 'Ayse Kaya',
      initials: 'AK',
      doctor: 'Dr. Selin Yilmaz',
      procedure: 'Kanal Tedavisi',
      status: 'Beklemede',
      tone: _AppointmentTone.pending,
      notes: 'Ilk seans, radyografi hazir.',
      dayIndex: 0,
      startMinutes: 9 * 60,
      durationMinutes: 45,
    ),
    _AppointmentData(
      time: '10:15',
      endTime: '11:15',
      patientName: 'Mert Demir',
      initials: 'MD',
      doctor: 'Dr. Selin Yilmaz',
      procedure: 'Implant Kontrolu',
      status: 'Islemde',
      tone: _AppointmentTone.inProgress,
      notes: 'Kontrol filmi alinacak.',
      dayIndex: 0,
      startMinutes: 10 * 60 + 15,
      durationMinutes: 60,
    ),
    _AppointmentData(
      time: '11:30',
      endTime: '12:15',
      patientName: 'Zeynep Arslan',
      initials: 'ZA',
      doctor: 'Dr. Selin Yilmaz',
      procedure: 'Dis Tasi Temizligi',
      status: 'Tamamlandi',
      tone: _AppointmentTone.completed,
      notes: 'Sonraki kontrol 6 ay sonra.',
      dayIndex: 1,
      startMinutes: 11 * 60 + 30,
      durationMinutes: 45,
    ),
    _AppointmentData(
      time: '13:45',
      endTime: '14:30',
      patientName: 'Kerem Tunc',
      initials: 'KT',
      doctor: 'Dr. Selin Yilmaz',
      procedure: 'Ortodonti Kontrolu',
      status: 'Beklemede',
      tone: _AppointmentTone.pending,
      notes: 'Braket kontrolu yapilacak.',
      dayIndex: 2,
      startMinutes: 13 * 60 + 45,
      durationMinutes: 45,
    ),
    _AppointmentData(
      time: '15:00',
      endTime: '16:30',
      patientName: 'Derya Celik',
      initials: 'DC',
      doctor: 'Dr. Ece Aydin',
      procedure: 'Gulus Tasarimi',
      status: 'Planlandi',
      tone: _AppointmentTone.scheduled,
      notes: 'Demo mockup onayi beklenecek.',
      dayIndex: 2,
      startMinutes: 15 * 60,
      durationMinutes: 90,
    ),
    _AppointmentData(
      time: '16:00',
      endTime: '16:30',
      patientName: 'Elif Koc',
      initials: 'EK',
      doctor: 'Dr. Selin Yilmaz',
      procedure: 'Estetik Dolgu',
      status: 'Iptal',
      tone: _AppointmentTone.cancelled,
      notes: 'Hasta telefonla erteledi.',
      dayIndex: 3,
      startMinutes: 16 * 60,
      durationMinutes: 30,
    ),
  ];

  static const List<_PlannerDay> _plannerDays = [
    _PlannerDay(
      label: 'Pzt',
      dateLabel: '10',
      fullLabel: '10 Mart 2026, Pazartesi',
      summary: '3 aktif plan',
    ),
    _PlannerDay(
      label: 'Sal',
      dateLabel: '11',
      fullLabel: '11 Mart 2026, Sali',
      summary: '2 aktif plan',
    ),
    _PlannerDay(
      label: 'Car',
      dateLabel: '12',
      fullLabel: '12 Mart 2026, Carsamba',
      summary: '2 aktif plan',
    ),
    _PlannerDay(
      label: 'Per',
      dateLabel: '13',
      fullLabel: '13 Mart 2026, Persembe',
      summary: '1 aktif plan',
    ),
    _PlannerDay(
      label: 'Cum',
      dateLabel: '14',
      fullLabel: '14 Mart 2026, Cuma',
      summary: 'Hazir bloklar',
    ),
  ];

  _AppointmentView _activeView = _AppointmentView.list;
  int _selectedDayIndex = 2;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedDay = _plannerDays[_selectedDayIndex];
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
                      selectedDay.fullLabel,
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
                      children: [
                        _ViewToggleChip(
                          label: 'Liste',
                          icon: Icons.view_list_rounded,
                          isSelected: _activeView == _AppointmentView.list,
                          onTap: () {
                            setState(() {
                              _activeView = _AppointmentView.list;
                            });
                          },
                        ),
                        const SizedBox(width: 6),
                        _ViewToggleChip(
                          label: 'Takvim',
                          icon: Icons.calendar_month_rounded,
                          isSelected: _activeView == _AppointmentView.calendar,
                          onTap: () {
                            setState(() {
                              _activeView = _AppointmentView.calendar;
                            });
                          },
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
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            child: _activeView == _AppointmentView.list
                ? _AppointmentsListView(
                    key: const ValueKey('appointments-list'),
                    appointments: _appointments,
                  )
                : _AppointmentsCalendarView(
                    key: const ValueKey('appointments-calendar'),
                    appointments: _appointments,
                    plannerDays: _plannerDays,
                    selectedDayIndex: _selectedDayIndex,
                    onSelectDay: (index) {
                      setState(() {
                        _selectedDayIndex = index;
                      });
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _AppointmentsListView extends StatelessWidget {
  const _AppointmentsListView({
    super.key,
    required this.appointments,
  });

  final List<_AppointmentData> appointments;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();

    return SoftCard(
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
                _headerCell(theme, 'Saat', 1),
                _headerCell(theme, 'Hasta Adi', 3),
                _headerCell(theme, 'Hekim', 3),
                _headerCell(theme, 'Islem', 3),
                _headerCell(theme, 'Durum', 2),
                _headerCell(theme, 'Notlar', 3),
                _headerCell(theme, 'Islemler', 1),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ListView.separated(
            itemCount: appointments.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, _) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return _AppointmentRow(data: appointments[index]);
            },
          ),
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

class _AppointmentsCalendarView extends StatelessWidget {
  const _AppointmentsCalendarView({
    super.key,
    required this.appointments,
    required this.plannerDays,
    required this.selectedDayIndex,
    required this.onSelectDay,
  });

  final List<_AppointmentData> appointments;
  final List<_PlannerDay> plannerDays;
  final int selectedDayIndex;
  final ValueChanged<int> onSelectDay;

  static const double _hourRowHeight = 76;
  static const double _timelineStartHour = 8;
  static const double _timelineEndHour = 18;
  static const double _timeColumnWidth = 84;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();
    final selectedAppointments = appointments
        .where((appointment) => appointment.dayIndex == selectedDayIndex)
        .toList()
      ..sort((a, b) => a.startMinutes.compareTo(b.startMinutes));

    return LayoutBuilder(
      builder: (context, constraints) {
        final timelineWidth =
            (constraints.maxWidth - 430).clamp(620.0, 1200.0).toDouble();

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300,
              child: _MiniCalendarPanel(
                plannerDays: plannerDays,
                selectedDayIndex: selectedDayIndex,
                appointments: appointments,
                onSelectDay: onSelectDay,
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: SoftCard(
                padding: const EdgeInsets.all(18),
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
                                plannerDays[selectedDayIndex].fullLabel,
                                style: theme.textTheme.titleLarge,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Gunluk ajanda akisi ve blok planlama gorunumu',
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: surfaceTheme.baseColor.withValues(alpha: 0.55),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.auto_awesome_mosaic_rounded,
                                size: 16,
                                color: theme.colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${selectedAppointments.length} planli blok',
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 92),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: _timeColumnWidth),
                          Expanded(
                            child: SizedBox(
                              height: 92,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: plannerDays.length,
                                separatorBuilder: (_, _) =>
                                    const SizedBox(width: 10),
                                itemBuilder: (context, index) {
                                  final day = plannerDays[index];
                                  final isSelected = index == selectedDayIndex;

                                  return SizedBox(
                                    width: 120,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () => onSelectDay(index),
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 180),
                                        curve: Curves.easeOut,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? theme.colorScheme.primary
                                                  .withValues(alpha: 0.12)
                                              : surfaceTheme.baseColor
                                                  .withValues(alpha: 0.44),
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                            color: isSelected
                                                ? theme.colorScheme.primary
                                                    .withValues(alpha: 0.16)
                                                : surfaceTheme.borderColor,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              day.label,
                                              style: theme.textTheme.labelMedium,
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              day.dateLabel,
                                              style: theme.textTheme.titleLarge
                                                  ?.copyWith(
                                                color: isSelected
                                                    ? theme.colorScheme.primary
                                                    : null,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              day.summary,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    LayoutBuilder(
                      builder: (context, cardConstraints) {
                        final viewportHeight = cardConstraints.maxHeight.isFinite
                            ? cardConstraints.maxHeight.clamp(420.0, 760.0)
                                .toDouble()
                            : 620.0;

                        return SizedBox(
                          height: viewportHeight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                              color: surfaceTheme.baseColor.withValues(alpha: 0.28),
                              child: SingleChildScrollView(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: timelineWidth,
                                        child: _TimelineBoard(
                                          appointments: selectedAppointments,
                                          rowHeight: _hourRowHeight,
                                          timelineStartHour: _timelineStartHour,
                                          timelineEndHour: _timelineEndHour,
                                          timeColumnWidth: _timeColumnWidth,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}

class _TimelineBoard extends StatelessWidget {
  const _TimelineBoard({
    required this.appointments,
    required this.rowHeight,
    required this.timelineStartHour,
    required this.timelineEndHour,
    required this.timeColumnWidth,
  });

  final List<_AppointmentData> appointments;
  final double rowHeight;
  final double timelineStartHour;
  final double timelineEndHour;
  final double timeColumnWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalHeight =
        (timelineEndHour - timelineStartHour) * rowHeight + 51;
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();
    final gridLineColor = theme.dividerColor.withValues(alpha: 0.12);

    return SizedBox(
      height: totalHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: timeColumnWidth,
            child: Column(
              children: [
                for (var i = 0; i < (timelineEndHour - timelineStartHour + 1); i++)
                  SizedBox(
                    height: i ==
                            (timelineEndHour - timelineStartHour).toInt()
                        ? 0
                        : rowHeight,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 12),
                        child: Text(
                          '${(timelineStartHour.toInt() + i).toString().padLeft(2, '0')}:00',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final contentWidth =
                    (constraints.maxWidth - 28).clamp(420.0, 980.0).toDouble();

                return Stack(
                  children: [
                    Column(
                      children: [
                        for (var i = 0;
                            i < (timelineEndHour - timelineStartHour).toInt();
                            i++)
                          Container(
                            height: rowHeight,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: gridLineColor,
                                ),
                              ),
                            ),
                          ),
                        Container(
                          height: 1,
                          color: gridLineColor,
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                    for (final appointment in appointments)
                      _CalendarAppointmentBlock(
                        appointment: appointment,
                        top: _topOffset(appointment.startMinutes),
                        height: _heightForAppointment(appointment.durationMinutes),
                        left: 14,
                        width: contentWidth,
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  double _topOffset(int startMinutes) {
    final minutesFromStart = startMinutes - (timelineStartHour * 60);
    return (minutesFromStart / 60) * rowHeight;
  }

  double _heightForAppointment(int durationMinutes) {
    return (durationMinutes / 60) * rowHeight;
  }
}

class _MiniCalendarPanel extends StatelessWidget {
  const _MiniCalendarPanel({
    required this.plannerDays,
    required this.selectedDayIndex,
    required this.appointments,
    required this.onSelectDay,
  });

  final List<_PlannerDay> plannerDays;
  final int selectedDayIndex;
  final List<_AppointmentData> appointments;
  final ValueChanged<int> onSelectDay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();

    return SoftCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Mart 2026',
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Icon(
                Icons.calendar_today_rounded,
                size: 18,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _MiniCalendarLabel('P'),
              _MiniCalendarLabel('S'),
              _MiniCalendarLabel('C'),
              _MiniCalendarLabel('P'),
              _MiniCalendarLabel('C'),
              _MiniCalendarLabel('C'),
              _MiniCalendarLabel('P'),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(31, (index) {
              final dayNumber = index + 1;
              final plannerIndex = plannerDays.indexWhere(
                (day) => int.parse(day.dateLabel) == dayNumber,
              );
              final isSelected = plannerIndex == selectedDayIndex;
              final isMapped = plannerIndex != -1;

              return InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: isMapped ? () => onSelectDay(plannerIndex) : null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.colorScheme.primary.withValues(alpha: 0.14)
                        : surfaceTheme.baseColor.withValues(
                            alpha: isMapped ? 0.58 : 0.26,
                          ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    '$dayNumber',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : isMapped
                              ? theme.colorScheme.onSurface
                              : theme.textTheme.bodySmall?.color,
                      fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: surfaceTheme.baseColor.withValues(alpha: 0.42),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bugunun yogunlugu',
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(height: 12),
                for (var i = 0; i < plannerDays.length; i++)
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: i == plannerDays.length - 1 ? 0 : 12,
                    ),
                    child: _MiniCalendarLegendRow(
                      label: plannerDays[i].fullLabel.split(',').first,
                      value:
                          '${appointments.where((item) => item.dayIndex == i).length} blok',
                      isActive: i == selectedDayIndex,
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

class _CalendarAppointmentBlock extends StatelessWidget {
  const _CalendarAppointmentBlock({
    required this.appointment,
    required this.top,
    required this.height,
    required this.left,
    required this.width,
  });

  final _AppointmentData appointment;
  final double top;
  final double height;
  final double left;
  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusStyle = _statusStyle(appointment.tone);
    final surfaceTheme =
        theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();
    final boxHeight = (height - 12).clamp(54.0, 220.0).toDouble();

    return Positioned(
      top: top + 8,
      left: left,
      width: width,
      height: boxHeight,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: boxHeight <= 70 ? 10 : 12,
          vertical: boxHeight <= 70 ? 4 : 10,
        ),
        decoration: BoxDecoration(
          color: statusStyle.foreground.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: statusStyle.foreground.withValues(alpha: 0.14),
          ),
          boxShadow: surfaceTheme.softShadow,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: statusStyle.foreground,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final compact = constraints.maxHeight < 84 || boxHeight <= 70;
                  final ultraCompact = constraints.maxHeight < 66 || boxHeight <= 60;

                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment.patientName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: ultraCompact
                                ? 12
                                : compact
                                    ? 13
                                    : null,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(height: ultraCompact ? 1 : 2),
                        if (!ultraCompact)
                          Text(
                            appointment.procedure,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: compact ? 11 : null,
                              height: 1.1,
                            ),
                          ),
                        SizedBox(height: ultraCompact ? 1 : 2),
                        Row(
                          children: [
                            Icon(
                              Icons.schedule_rounded,
                              size: ultraCompact ? 11 : 12,
                              color: statusStyle.foreground,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                '${appointment.time} - ${appointment.endTime}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: statusStyle.foreground,
                                  fontWeight: FontWeight.w700,
                                  fontSize: ultraCompact
                                      ? 10
                                      : compact
                                          ? 11
                                          : null,
                                  height: 1.1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
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
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: AnimatedContainer(
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
                color:
                    isSelected ? colorScheme.primary : theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
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

class _MiniCalendarLabel extends StatelessWidget {
  const _MiniCalendarLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 24,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: theme.textTheme.labelMedium,
      ),
    );
  }
}

class _MiniCalendarLegendRow extends StatelessWidget {
  const _MiniCalendarLegendRow({
    required this.label,
    required this.value,
    required this.isActive,
  });

  final String label;
  final String value;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? theme.colorScheme.primary
                : theme.colorScheme.primary.withValues(alpha: 0.26),
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodySmall,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
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
    case _AppointmentTone.scheduled:
      return const _AppointmentStatusStyle(
        background: Color(0x19697CCF),
        foreground: Color(0xFF697CCF),
      );
  }
}

enum _AppointmentView { list, calendar }

enum _AppointmentTone {
  pending,
  inProgress,
  completed,
  cancelled,
  scheduled,
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
    required this.endTime,
    required this.patientName,
    required this.initials,
    required this.doctor,
    required this.procedure,
    required this.status,
    required this.tone,
    required this.notes,
    required this.dayIndex,
    required this.startMinutes,
    required this.durationMinutes,
  });

  final String time;
  final String endTime;
  final String patientName;
  final String initials;
  final String doctor;
  final String procedure;
  final String status;
  final _AppointmentTone tone;
  final String notes;
  final int dayIndex;
  final int startMinutes;
  final int durationMinutes;
}

class _PlannerDay {
  const _PlannerDay({
    required this.label,
    required this.dateLabel,
    required this.fullLabel,
    required this.summary,
  });

  final String label;
  final String dateLabel;
  final String fullLabel;
  final String summary;
}
