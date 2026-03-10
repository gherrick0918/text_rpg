import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Parchment backgrounds — layered depth
  static const Color parchmentDark = Color(0xFF2C1810);    // Deep leather brown
  static const Color parchmentMid = Color(0xFF5C3D2E);     // Aged leather
  static const Color parchmentLight = Color(0xFFF4E4C1);   // Warm parchment
  static const Color parchmentPale = Color(0xFFFAF3E0);    // Bleached parchment
  static const Color parchmentStain = Color(0xFFE8D5A3);   // Tea-stained parchment

  // Inks
  static const Color inkDark = Color(0xFF1A0F0A);          // Near black ink
  static const Color inkBrown = Color(0xFF3D2314);         // Sepia ink
  static const Color inkFaded = Color(0xFF6B4C35);         // Faded old ink

  // Accents
  static const Color gold = Color(0xFFB8860B);             // Dark gold
  static const Color goldBright = Color(0xFFD4A017);       // Illuminated gold
  static const Color bloodRed = Color(0xFF8B1A1A);         // Deep red accent
  static const Color verdigris = Color(0xFF4A7C6F);        // Aged copper green

  // Combat specific
  static const Color healthRed = Color(0xFF8B1A1A);
  static const Color healthGreen = Color(0xFF2D5A27);
  static const Color apBlue = Color(0xFF1A3A5C);

  // UI surfaces
  static const Color panelBackground = Color(0xFFEDD9A3);  // Panel parchment
  static const Color panelBorder = Color(0xFF8B6914);      // Gold border
  static const Color panelShadow = Color(0xFF2C1810);      // Dark shadow
}

class AppTextStyles {
  // Display — chapter headings, screen titles
  static TextStyle display(BuildContext context) =>
      GoogleFonts.uncialAntiqua(
        fontSize: 32,
        color: AppColors.inkDark,
        letterSpacing: 1.5,
        height: 1.2,
      );

  // Heading — section headers, NPC names
  static TextStyle heading(BuildContext context) =>
      GoogleFonts.cinzelDecorative(
        fontSize: 20,
        color: AppColors.inkBrown,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.0,
      );

  // Subheading — stat labels, category headers
  static TextStyle subheading(BuildContext context) =>
      GoogleFonts.cinzel(
        fontSize: 14,
        color: AppColors.inkBrown,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
      );

  // Body — room descriptions, quest text, narrative
  static TextStyle body(BuildContext context) =>
      GoogleFonts.crimsonText(
        fontSize: 17,
        color: AppColors.inkDark,
        height: 1.6,
        letterSpacing: 0.2,
      );

  // Flavor — atmospheric text, item descriptions
  static TextStyle flavor(BuildContext context) =>
      GoogleFonts.crimsonText(
        fontSize: 16,
        color: AppColors.inkFaded,
        fontStyle: FontStyle.italic,
        height: 1.6,
      );

  // Combat — damage numbers, roll results
  static TextStyle combat(BuildContext context) =>
      GoogleFonts.cinzel(
        fontSize: 15,
        color: AppColors.inkDark,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      );

  // Button — action labels
  static TextStyle button(BuildContext context) =>
      GoogleFonts.cinzel(
        fontSize: 13,
        color: AppColors.parchmentLight,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.5,
      );

  // Stat value — numbers on character sheet
  static TextStyle statValue(BuildContext context) =>
      GoogleFonts.uncialAntiqua(
        fontSize: 22,
        color: AppColors.inkDark,
      );

  // Caption — small labels, tags
  static TextStyle caption(BuildContext context) =>
      GoogleFonts.cinzel(
        fontSize: 11,
        color: AppColors.inkFaded,
        letterSpacing: 1.2,
      );
}

class AppDecorations {
  // Main panel — aged parchment with ornate border
  static BoxDecoration panel() => BoxDecoration(
        color: AppColors.panelBackground,
        border: Border.all(
          color: AppColors.panelBorder,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: AppColors.panelShadow.withOpacity(0.4),
            offset: const Offset(3, 3),
            blurRadius: 6,
          ),
          BoxShadow(
            color: AppColors.goldBright.withOpacity(0.1),
            offset: const Offset(-1, -1),
            blurRadius: 3,
          ),
        ],
      );

  // Inset panel — for text areas and description boxes
  static BoxDecoration insetPanel() => BoxDecoration(
        color: AppColors.parchmentPale,
        border: Border.all(
          color: AppColors.inkFaded.withOpacity(0.4),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: AppColors.inkDark.withOpacity(0.15),
            offset: const Offset(2, 2),
            blurRadius: 4,
            spreadRadius: -1,
          ),
        ],
      );

  // Screen background
  static BoxDecoration screenBackground() => BoxDecoration(
        color: AppColors.parchmentStain,
        image: const DecorationImage(
          image: AssetImage('assets/images/parchment_texture.png'),
          fit: BoxFit.cover,
          opacity: 0.15,
        ),
      );

  // Action button — dark leather
  static BoxDecoration actionButton({bool isEnabled = true}) => BoxDecoration(
        color: isEnabled ? AppColors.parchmentMid : AppColors.inkFaded,
        border: Border.all(
          color: isEnabled ? AppColors.gold : AppColors.inkFaded,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(3),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: AppColors.inkDark.withOpacity(0.5),
                  offset: const Offset(2, 2),
                  blurRadius: 4,
                ),
              ]
            : [],
      );

  // Health bar track
  static BoxDecoration healthBarTrack() => BoxDecoration(
        color: AppColors.inkDark.withOpacity(0.3),
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: AppColors.inkBrown.withOpacity(0.5),
          width: 1,
        ),
      );
}

class AppTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: AppColors.parchmentStain,
        colorScheme: const ColorScheme.light(
          primary: AppColors.parchmentMid,
          secondary: AppColors.gold,
          surface: AppColors.panelBackground,
          error: AppColors.bloodRed,
        ),
        textTheme: GoogleFonts.crimsonTextTextTheme(),
        dividerColor: AppColors.panelBorder.withOpacity(0.5),
        dividerTheme: const DividerThemeData(
          color: AppColors.panelBorder,
          thickness: 1,
        ),
      );
}