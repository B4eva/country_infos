import 'package:conutry_infos/src/providers/global_provider.dart';
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
      value: appThemeState.isDarkModeEnabled,
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

// https://medium.com/@borankayaalp96/flutter-country-app-bloc-rest-countries-api-ccb82c6f200