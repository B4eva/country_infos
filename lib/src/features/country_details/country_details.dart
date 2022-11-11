// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conutry_infos/src/providers/global_provider.dart';
import 'package:flutter/material.dart';

import 'package:conutry_infos/src/constants/app_sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme.dart';

class CountryDetailsView extends ConsumerStatefulWidget {
  final String name;
  final String capital;
  final String region;
  final String subregion;
  final String area;
  final String population;
  final String continent;
  final String flag;
  final String coatOfArms;
  final String language;
  final String currency;
  final String timeZone;
  final String carSide;
  const CountryDetailsView(
      {Key? key,
      required this.name,
      required this.capital,
      required this.region,
      required this.subregion,
      required this.area,
      required this.population,
      required this.continent,
      required this.flag,
      required this.coatOfArms,
      this.currency = '',
      this.language = '',
      required this.timeZone,
      required this.carSide})
      : super(key: key);

  @override
  _CountryDetailsViewState createState() => _CountryDetailsViewState();
}

class _CountryDetailsViewState extends ConsumerState<CountryDetailsView> {
  @override
  Widget build(BuildContext context) {
    final appthemProvider = ref.watch(appThemeStateNotifier);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: appthemProvider.isDarkMode
              ? AppColors.primaryDark
              : AppColors.white,
          automaticallyImplyLeading: true,
          title: Text(
            widget.name,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(widget.flag),
                  ],
                ),
                gapH20,
                MyRichText(
                  lable: 'Population',
                  property: widget.population.toString(),
                ),
                gapH8,
                MyRichText(
                  lable: 'Region',
                  property: widget.region.toString(),
                ),
                gapH8,
                MyRichText(
                  lable: 'capital',
                  property: widget.capital,
                ),
                gapH8,
                const MyRichText(
                  lable: 'Moto',
                  property: '',
                ),
                gapH20,
                MyRichText(
                  lable: 'officail Language',
                  property: widget.language.toString(),
                ),
                gapH12,
                MyRichText(
                  lable: 'Ethnic group',
                  property: widget.subregion.toString(),
                ),
                gapH8,
                MyRichText(
                  lable: 'Religion',
                  property: widget.subregion.toString(),
                ),
                gapH8,
                MyRichText(
                  lable: 'Goverment',
                  property: widget.subregion.toString(),
                ),
                gapH20,
                const MyRichText(
                  lable: 'Independence',
                  property: '',
                ),
                gapH8,
                MyRichText(
                  lable: 'Area',
                  property: widget.area.toString(),
                ),
                gapH8,
                const MyRichText(
                  lable: 'Currency',
                  property: '',
                ),
                gapH8,
                const MyRichText(
                  lable: 'GDP',
                  property: '',
                ),
                gapH20,
                MyRichText(
                  lable: 'Time Zone',
                  property: widget.timeZone.toString(),
                ),
                gapH8,
                MyRichText(
                  lable: 'Date Format',
                  property: widget.area.toString(),
                ),
                gapH8,
                const MyRichText(
                  lable: 'Dialing code',
                  property: '',
                ),
                gapH8,
                MyRichText(
                  lable: 'Driving side',
                  property: widget.carSide.toString(),
                ),
              ],
            ),
          ),
        ));
  }
}

class MyRichText extends StatelessWidget {
  final String lable;
  final String property;
  const MyRichText({
    Key? key,
    required this.lable,
    required this.property,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: '$lable : ',
          style: DefaultTextStyle.of(context).style.copyWith(fontSize: 16),
          children: [
            TextSpan(
                text: property,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.subTextColor,
                    fontSize: 16))
          ]),
    );
  }
}
