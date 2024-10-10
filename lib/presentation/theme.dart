import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282605201),
      surfaceTint: Color(4282605201),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292338431),
      onPrimaryContainer: Color(4278196800),
      secondary: Color(4280837002),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291487487),
      onSecondaryContainer: Color(4278197808),
      tertiary: Color(4281363011),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289917375),
      onTertiaryContainer: Color(4278198541),
      error: Color(4287646278),
      onError: Color(4294967295),
      errorContainer: Color(4294957783),
      onErrorContainer: Color(4282059017),
      surface: Color(4294572543),
      onSurface: Color(4279900960),
      onSurfaceVariant: Color(4282664783),
      outline: Color(4285822847),
      outlineVariant: Color(4291086032),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282614),
      inversePrimary: Color(4289513471),
      primaryFixed: Color(4292338431),
      onPrimaryFixed: Color(4278196800),
      primaryFixedDim: Color(4289513471),
      onPrimaryFixedVariant: Color(4280960632),
      secondaryFixed: Color(4291487487),
      onSecondaryFixed: Color(4278197808),
      secondaryFixedDim: Color(4288072952),
      onSecondaryFixedVariant: Color(4278209392),
      tertiaryFixed: Color(4289917375),
      onTertiaryFixed: Color(4278198541),
      tertiaryFixedDim: Color(4288140709),
      onTertiaryFixedVariant: Color(4279521581),
      surfaceDim: Color(4292467168),
      surfaceBright: Color(4294572543),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177786),
      surfaceContainer: Color(4293783028),
      surfaceContainerHigh: Color(4293453806),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280697459),
      surfaceTint: Color(4282605201),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284118185),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278208363),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282546850),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279192873),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282876247),
      onTertiaryContainer: Color(4294967295),
      error: Color(4285411116),
      onError: Color(4294967295),
      errorContainer: Color(4289355611),
      onErrorContainer: Color(4294967295),
      surface: Color(4294572543),
      onSurface: Color(4279900960),
      onSurfaceVariant: Color(4282401611),
      outline: Color(4284243815),
      outlineVariant: Color(4286085763),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282614),
      inversePrimary: Color(4289513471),
      primaryFixed: Color(4284118185),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282473614),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282546850),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280639879),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282876247),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281165632),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292467168),
      surfaceBright: Color(4294572543),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177786),
      surfaceContainer: Color(4293783028),
      surfaceContainerHigh: Color(4293453806),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278198605),
      surfaceTint: Color(4282605201),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280697459),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278199610),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278208363),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200593),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4279192873),
      onTertiaryContainer: Color(4294967295),
      error: Color(4282650383),
      onError: Color(4294967295),
      errorContainer: Color(4285411116),
      onErrorContainer: Color(4294967295),
      surface: Color(4294572543),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280362027),
      outline: Color(4282401611),
      outlineVariant: Color(4282401611),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282614),
      inversePrimary: Color(4293324031),
      primaryFixed: Color(4280697459),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278791004),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278208363),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278202442),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4279192873),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203672),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292467168),
      surfaceBright: Color(4294572543),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177786),
      surfaceContainer: Color(4293783028),
      surfaceContainerHigh: Color(4293453806),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289513471),
      surfaceTint: Color(4289513471),
      onPrimary: Color(4279185248),
      primaryContainer: Color(4280960632),
      onPrimaryContainer: Color(4292338431),
      secondary: Color(4288072952),
      onSecondary: Color(4278203471),
      secondaryContainer: Color(4278209392),
      onSecondaryContainer: Color(4291487487),
      tertiary: Color(4288140709),
      onTertiary: Color(4278204698),
      tertiaryContainer: Color(4279521581),
      onTertiaryContainer: Color(4289917375),
      error: Color(4294947758),
      onError: Color(4283899420),
      errorContainer: Color(4285739824),
      onErrorContainer: Color(4294957783),
      surface: Color(4279309080),
      onSurface: Color(4293059305),
      onSurfaceVariant: Color(4291086032),
      outline: Color(4287533209),
      outlineVariant: Color(4282664783),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inversePrimary: Color(4282605201),
      primaryFixed: Color(4292338431),
      onPrimaryFixed: Color(4278196800),
      primaryFixedDim: Color(4289513471),
      onPrimaryFixedVariant: Color(4280960632),
      secondaryFixed: Color(4291487487),
      onSecondaryFixed: Color(4278197808),
      secondaryFixedDim: Color(4288072952),
      onSecondaryFixedVariant: Color(4278209392),
      tertiaryFixed: Color(4289917375),
      onTertiaryFixed: Color(4278198541),
      tertiaryFixedDim: Color(4288140709),
      onTertiaryFixedVariant: Color(4279521581),
      surfaceDim: Color(4279309080),
      surfaceBright: Color(4281809214),
      surfaceContainerLowest: Color(4278980115),
      surfaceContainerLow: Color(4279900960),
      surfaceContainer: Color(4280164389),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281546042),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289973247),
      surfaceTint: Color(4289513471),
      onPrimary: Color(4278195510),
      primaryContainer: Color(4285960647),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4288401917),
      onSecondary: Color(4278196264),
      secondaryContainer: Color(4284520127),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4288403881),
      onTertiary: Color(4278197001),
      tertiaryContainer: Color(4284718706),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949300),
      onError: Color(4281533445),
      errorContainer: Color(4291525493),
      onErrorContainer: Color(4278190080),
      surface: Color(4279309080),
      onSurface: Color(4294703871),
      onSurfaceVariant: Color(4291414740),
      outline: Color(4288717484),
      outlineVariant: Color(4286677900),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inversePrimary: Color(4281026425),
      primaryFixed: Color(4292338431),
      onPrimaryFixed: Color(4278194221),
      primaryFixedDim: Color(4289513471),
      onPrimaryFixedVariant: Color(4279711078),
      secondaryFixed: Color(4291487487),
      onSecondaryFixed: Color(4278194976),
      secondaryFixedDim: Color(4288072952),
      onSecondaryFixedVariant: Color(4278205016),
      tertiaryFixed: Color(4289917375),
      onTertiaryFixed: Color(4278195463),
      tertiaryFixedDim: Color(4288140709),
      onTertiaryFixedVariant: Color(4278206238),
      surfaceDim: Color(4279309080),
      surfaceBright: Color(4281809214),
      surfaceContainerLowest: Color(4278980115),
      surfaceContainerLow: Color(4279900960),
      surfaceContainer: Color(4280164389),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281546042),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294703871),
      surfaceTint: Color(4289513471),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289973247),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294573055),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4288401917),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293918702),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4288403881),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949300),
      onErrorContainer: Color(4278190080),
      surface: Color(4279309080),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294703871),
      outline: Color(4291414740),
      outlineVariant: Color(4291414740),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inversePrimary: Color(4278528345),
      primaryFixed: Color(4292798463),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4289973247),
      onPrimaryFixedVariant: Color(4278195510),
      secondaryFixed: Color(4292078335),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4288401917),
      onSecondaryFixedVariant: Color(4278196264),
      tertiaryFixed: Color(4290246340),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4288403881),
      onTertiaryFixedVariant: Color(4278197001),
      surfaceDim: Color(4279309080),
      surfaceBright: Color(4281809214),
      surfaceContainerLowest: Color(4278980115),
      surfaceContainerLow: Color(4279900960),
      surfaceContainer: Color(4280164389),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281546042),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
