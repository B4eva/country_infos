import 'package:conutry_infos/src/providers/global_provider.dart';
import 'package:conutry_infos/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkModeSwitch extends ConsumerWidget {
  const DarkModeSwitch({super.key});
  // final void Function(bool)? onChanged;
  // final bool value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return Switch(
      value: appThemeState.isDarkMode,
      onChanged: (enabled) {
        if (enabled) {
          appThemeState.setDarkTheme();
        } else {
          appThemeState.setLightTheme();
        }
      },
    );
  }
}

class BrightnessToggle extends ConsumerWidget {
  const BrightnessToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isDark = Theme.of(context).brightness == Brightness.dark;
    final appThemeState = ref.watch(appThemeStateNotifier);
    return IconButton(
      icon: appThemeState.isDarkMode
          ? const Icon(
              Icons.brightness_3,
              color: AppColors.gray,
            )
          : const Icon(
              Icons.brightness_7,
              color: AppColors.graywarm,
            ),
      onPressed: () {
        appThemeState.setLightTheme();

        // final themeProvider = ThemeProvider.of(context);
        // final settings = themeProvider.settings.value;
        // final newSettings = ThemeSettings(
        //   sourceColor: settings.sourceColor,
        //   themeMode: isDark ? ThemeMode.light : ThemeMode.dark,
        // );
        // ThemeSettingChange(settings: newSettings).dispatch(context);
      },
    );
  }
}


// https://medium.com/@borankayaalp96/flutter-country-app-bloc-rest-countries-api-ccb82c6f200