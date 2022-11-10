// Theme
import 'package:conutry_infos/src/features/search_country/search_country_viewmodel.dart';
import 'package:conutry_infos/src/providers/app_theme_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeStateNotifier = ChangeNotifierProvider((ref) => AppThemeState());
final searchCountryNotifier =
    ChangeNotifierProvider((ref) => SearchCountryViewModel());
