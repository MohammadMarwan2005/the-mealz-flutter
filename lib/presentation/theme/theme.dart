import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4286862358),
      surfaceTint: Color(4286862358),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294958268),
      onPrimaryContainer: Color(4281079552),
      secondary: Color(4285684290),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294892990),
      onSecondaryContainer: Color(4280883205),
      tertiary: Color(4283917115),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4292536758),
      onTertiaryContainer: Color(4279574273),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294965492),
      onBackground: Color(4280359444),
      surface: Color(4294965492),
      onSurface: Color(4280359444),
      surfaceVariant: Color(4294041552),
      onSurfaceVariant: Color(4283450682),
      outline: Color(4286805352),
      outlineVariant: Color(4292199605),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281806632),
      inverseOnSurface: Color(4294831843),
      inversePrimary: Color(4294687347),
      primaryFixed: Color(4294958268),
      onPrimaryFixed: Color(4281079552),
      primaryFixedDim: Color(4294687347),
      onPrimaryFixedVariant: Color(4285021440),
      secondaryFixed: Color(4294892990),
      onSecondaryFixed: Color(4280883205),
      secondaryFixedDim: Color(4292919715),
      onSecondaryFixedVariant: Color(4283974444),
      tertiaryFixed: Color(4292536758),
      onTertiaryFixed: Color(4279574273),
      tertiaryFixedDim: Color(4290694299),
      onTertiaryFixedVariant: Color(4282338085),
      surfaceDim: Color(4293318860),
      surfaceBright: Color(4294965492),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963687),
      surfaceContainer: Color(4294634464),
      surfaceContainerHigh: Color(4294239962),
      surfaceContainerHighest: Color(4293845205),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4284627200),
      surfaceTint: Color(4286862358),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288571691),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283711272),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287262806),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282074914),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285364815),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294965492),
      onBackground: Color(4280359444),
      surface: Color(4294965492),
      onSurface: Color(4280359444),
      surfaceVariant: Color(4294041552),
      onSurfaceVariant: Color(4283187510),
      outline: Color(4285160785),
      outlineVariant: Color(4287002732),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281806632),
      inverseOnSurface: Color(4294831843),
      inversePrimary: Color(4294687347),
      primaryFixed: Color(4288571691),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4286664980),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287262806),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285487167),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285364815),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283719993),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293318860),
      surfaceBright: Color(4294965492),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963687),
      surfaceContainer: Color(4294634464),
      surfaceContainerHigh: Color(4294239962),
      surfaceContainerHighest: Color(4293845205),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281670656),
      surfaceTint: Color(4286862358),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284627200),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281343755),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283711272),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279969285),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282074914),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294965492),
      onBackground: Color(4280359444),
      surface: Color(4294965492),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4294041552),
      onSurfaceVariant: Color(4281082393),
      outline: Color(4283187510),
      outlineVariant: Color(4283187510),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281806632),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4294687347),
      primaryFixed: Color(4284627200),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282656256),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283711272),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282132756),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282074914),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280692750),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293318860),
      surfaceBright: Color(4294965492),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963687),
      surfaceContainer: Color(4294634464),
      surfaceContainerHigh: Color(4294239962),
      surfaceContainerHighest: Color(4293845205),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294687347),
      surfaceTint: Color(4294687347),
      onPrimary: Color(4282984704),
      primaryContainer: Color(4285021440),
      onPrimaryContainer: Color(4294958268),
      secondary: Color(4292919715),
      onSecondary: Color(4282395928),
      secondaryContainer: Color(4283974444),
      onSecondaryContainer: Color(4294892990),
      tertiary: Color(4290694299),
      onTertiary: Color(4280890385),
      tertiaryContainer: Color(4282338085),
      onTertiaryContainer: Color(4292536758),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279833100),
      onBackground: Color(4293845205),
      surface: Color(4279833100),
      onSurface: Color(4293845205),
      surfaceVariant: Color(4283450682),
      onSurfaceVariant: Color(4292199605),
      outline: Color(4288515713),
      outlineVariant: Color(4283450682),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293845205),
      inverseOnSurface: Color(4281806632),
      inversePrimary: Color(0xff50443A),
      primaryFixed: Color(4294958268),
      onPrimaryFixed: Color(4281079552),
      primaryFixedDim: Color(4294687347),
      onPrimaryFixedVariant: Color(4285021440),
      secondaryFixed: Color(4294892990),
      onSecondaryFixed: Color(4280883205),
      secondaryFixedDim: Color(4292919715),
      onSecondaryFixedVariant: Color(4283974444),
      tertiaryFixed: Color(4292536758),
      onTertiaryFixed: Color(4279574273),
      tertiaryFixedDim: Color(4290694299),
      onTertiaryFixedVariant: Color(4282338085),
      surfaceDim: Color(4279833100),
      surfaceBright: Color(4282398768),
      surfaceContainerLowest: Color(4279438599),
      surfaceContainerLow: Color(4280359444),
      surfaceContainer: Color(4280622615),
      surfaceContainerHigh: Color(4281346337),
      surfaceContainerHighest: Color(4282069804),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294950520),
      surfaceTint: Color(4294687347),
      onPrimary: Color(4280553984),
      primaryContainer: Color(4290676036),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293248423),
      onSecondary: Color(4280488707),
      secondaryContainer: Color(4289236080),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4290957727),
      onTertiary: Color(4279245056),
      tertiaryContainer: Color(4287207017),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279833100),
      onBackground: Color(4293845205),
      surface: Color(4279833100),
      onSurface: Color(4294966008),
      surfaceVariant: Color(4283450682),
      onSurfaceVariant: Color(4292462777),
      outline: Color(4289765522),
      outlineVariant: Color(4287594868),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293845205),
      inverseOnSurface: Color(4281346337),
      inversePrimary: Color(4294687347),
      primaryFixed: Color(4294958268),
      onPrimaryFixed: Color(4280093952),
      primaryFixedDim: Color(4294687347),
      onPrimaryFixedVariant: Color(4283510272),
      secondaryFixed: Color(4294892990),
      onSecondaryFixed: Color(4280094209),
      secondaryFixedDim: Color(4292919715),
      onSecondaryFixedVariant: Color(4282790429),
      tertiaryFixed: Color(4292536758),
      onTertiaryFixed: Color(4278981632),
      tertiaryFixedDim: Color(4290694299),
      onTertiaryFixedVariant: Color(4281285142),
      surfaceDim: Color(4279833100),
      surfaceBright: Color(4282398768),
      surfaceContainerLowest: Color(4279438599),
      surfaceContainerLow: Color(4280359444),
      surfaceContainer: Color(4280622615),
      surfaceContainerHigh: Color(4281346337),
      surfaceContainerHighest: Color(4282069804),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294966008),
      surfaceTint: Color(4294687347),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294950520),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966008),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4293248423),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294377433),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4290957727),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279833100),
      onBackground: Color(4293845205),
      surface: Color(4279833100),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4283450682),
      onSurfaceVariant: Color(4294966008),
      outline: Color(4292462777),
      outlineVariant: Color(4292462777),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293845205),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4294687347),
      primaryFixed: Color(4294959815),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294950520),
      onPrimaryFixedVariant: Color(4280553984),
      secondaryFixed: Color(4294959815),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4293248423),
      onSecondaryFixedVariant: Color(4280488707),
      tertiaryFixed: Color(4292799930),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4290957727),
      onTertiaryFixedVariant: Color(4279245056),
      surfaceDim: Color(4279833100),
      surfaceBright: Color(4282398768),
      surfaceContainerLowest: Color(4279438599),
      surfaceContainerLow: Color(4280359444),
      surfaceContainer: Color(4280622615),
      surfaceContainerHigh: Color(4281346337),
      surfaceContainerHighest: Color(4282069804),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
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

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
