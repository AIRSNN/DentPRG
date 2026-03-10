import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _lightPrimary = Color(0xFF5B8C95);
  static const Color _lightAccent = Color(0xFF7DB6B0);
  static const Color _lightBackground = Color(0xFFF3F4F2);
  static const Color _lightSurface = Color(0xFFFFFFFF);
  static const Color _lightBorder = Color(0x03243447);
  static const Color _lightText = Color(0xFF243447);
  static const Color _lightMutedText = Color(0xFF64707D);

  static const Color _darkPrimary = Color(0xFF7AAEB5);
  static const Color _darkAccent = Color(0xFF8FC8C2);
  static const Color _darkBackground = Color(0xFF171B20);
  static const Color _darkSurface = Color(0xFF1E242B);
  static const Color _darkBorder = Color(0x24F2F4F8);
  static const Color _darkText = Color(0xFFF1F2F4);
  static const Color _darkMutedText = Color(0xFFADB6C2);

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _lightPrimary,
      brightness: Brightness.light,
    ).copyWith(
      primary: _lightPrimary,
      onPrimary: Colors.white,
      secondary: _lightAccent,
      onSecondary: _lightText,
      error: const Color(0xFFC76B67),
      onError: Colors.white,
      surface: _lightSurface,
      onSurface: _lightText,
    );

    return _buildTheme(
      colorScheme: colorScheme,
      background: _lightBackground,
      textColor: _lightText,
      mutedTextColor: _lightMutedText,
      borderColor: _lightBorder,
      surfaceTheme: AppSurfaceTheme.light(),
    );
  }

  static ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _darkPrimary,
      brightness: Brightness.dark,
    ).copyWith(
      primary: _darkPrimary,
      onPrimary: const Color(0xFF101418),
      secondary: _darkAccent,
      onSecondary: const Color(0xFF0F1418),
      error: const Color(0xFFD88984),
      onError: const Color(0xFF101418),
      surface: _darkSurface,
      onSurface: _darkText,
    );

    return _buildTheme(
      colorScheme: colorScheme,
      background: _darkBackground,
      textColor: _darkText,
      mutedTextColor: _darkMutedText,
      borderColor: _darkBorder,
      surfaceTheme: AppSurfaceTheme.dark(),
    );
  }

  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required Color background,
    required Color textColor,
    required Color mutedTextColor,
    required Color borderColor,
    required AppSurfaceTheme surfaceTheme,
  }) {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: colorScheme.primary.withValues(alpha: 0.06),
      dividerColor: borderColor,
    );

    final textTheme = GoogleFonts.interTextTheme(base.textTheme).copyWith(
      headlineLarge: GoogleFonts.inter(
        color: textColor,
        fontSize: 30,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.9,
      ),
      headlineMedium: GoogleFonts.inter(
        color: textColor,
        fontSize: 24,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.6,
      ),
      titleLarge: GoogleFonts.inter(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.4,
      ),
      titleMedium: GoogleFonts.inter(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.inter(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.45,
      ),
      bodyMedium: GoogleFonts.inter(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.35,
      ),
      bodySmall: GoogleFonts.inter(
        color: mutedTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.3,
      ),
      labelLarge: GoogleFonts.inter(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: GoogleFonts.inter(
        color: mutedTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );

    return base.copyWith(
      textTheme: textTheme,
      canvasColor: background,
      cardColor: surfaceTheme.cardColor,
      shadowColor: surfaceTheme.shadowColor,
      extensions: <ThemeExtension<dynamic>>[
        surfaceTheme,
      ],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: textColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceTheme.cardColor,
        hintStyle: textTheme.bodyMedium?.copyWith(color: mutedTextColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: colorScheme.primary.withValues(alpha: 0.45)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: textColor,
          side: BorderSide(color: borderColor),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
    );
  }
}

@immutable
class AppSurfaceTheme extends ThemeExtension<AppSurfaceTheme> {
  const AppSurfaceTheme({
    required this.baseColor,
    required this.cardColor,
    required this.borderColor,
    required this.shadowColor,
    required this.softShadow,
  });

  final Color baseColor;
  final Color cardColor;
  final Color borderColor;
  final Color shadowColor;
  final List<BoxShadow> softShadow;

  factory AppSurfaceTheme.light() {
    return const AppSurfaceTheme(
      baseColor: Color(0xFFF5F3EF),
      cardColor: Color(0xFFFFFFFF),
      borderColor: Color(0x03243447),
      shadowColor: Color(0x10617082),
      softShadow: <BoxShadow>[
        BoxShadow(
          color: Color(0x0C516475),
          blurRadius: 48,
          spreadRadius: -6,
          offset: Offset(0, 20),
        ),
        BoxShadow(
          color: Color(0x08243447),
          blurRadius: 20,
          spreadRadius: -8,
          offset: Offset(0, 6),
        ),
      ],
    );
  }

  factory AppSurfaceTheme.dark() {
    return const AppSurfaceTheme(
      baseColor: Color(0xFF171B20),
      cardColor: Color(0xFF1E242B),
      borderColor: Color(0x05F2F4F8),
      shadowColor: Color(0x320B0E12),
      softShadow: <BoxShadow>[
        BoxShadow(
          color: Color(0x36090B0E),
          blurRadius: 44,
          spreadRadius: -6,
          offset: Offset(0, 20),
        ),
        BoxShadow(
          color: Color(0x16000000),
          blurRadius: 18,
          spreadRadius: -8,
          offset: Offset(0, 6),
        ),
      ],
    );
  }

  @override
  AppSurfaceTheme copyWith({
    Color? baseColor,
    Color? cardColor,
    Color? borderColor,
    Color? shadowColor,
    List<BoxShadow>? softShadow,
  }) {
    return AppSurfaceTheme(
      baseColor: baseColor ?? this.baseColor,
      cardColor: cardColor ?? this.cardColor,
      borderColor: borderColor ?? this.borderColor,
      shadowColor: shadowColor ?? this.shadowColor,
      softShadow: softShadow ?? this.softShadow,
    );
  }

  @override
  AppSurfaceTheme lerp(ThemeExtension<AppSurfaceTheme>? other, double t) {
    if (other is! AppSurfaceTheme) {
      return this;
    }

    return AppSurfaceTheme(
      baseColor: Color.lerp(baseColor, other.baseColor, t) ?? baseColor,
      cardColor: Color.lerp(cardColor, other.cardColor, t) ?? cardColor,
      borderColor: Color.lerp(borderColor, other.borderColor, t) ?? borderColor,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t) ?? shadowColor,
      softShadow: BoxShadow.lerpList(softShadow, other.softShadow, t) ?? softShadow,
    );
  }
}
