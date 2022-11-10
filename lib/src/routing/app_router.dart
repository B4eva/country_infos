import 'package:conutry_infos/src/features/country_details/country_details.dart';
import 'package:conutry_infos/src/features/search_country/search_country.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final goRouter =
    GoRouter(initialLocation: '/', debugLogDiagnostics: true, routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SearchCountryView(),
    routes: const [
      // GoRoute(
      //   path: 'details',
      //   pageBuilder: (context, state) => MaterialPage(
      //       key: state.pageKey,
      //       fullscreenDialog: true,
      //       child: const CountryDetailsView()),
      // ),
    ],
  ),
]);
