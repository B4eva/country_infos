import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CountryDetailsView extends StatefulWidget {
  const CountryDetailsView({super.key});

  @override
  State<CountryDetailsView> createState() => _CountryDetailsViewState();
}

class _CountryDetailsViewState extends State<CountryDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Country name',
          ),
        ),
        body: Container());
  }
}
