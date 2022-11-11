// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conutry_infos/src/providers/global_provider.dart';
import 'package:conutry_infos/src/widgets/responsive_center.dart';
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
  // List<String> images =  widget.flag;
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  void setCurrentPageIndex(value) {
    _currentPageIndex + 1;
    setState(() {
      _currentPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appthemProvider = ref.watch(appThemeStateNotifier);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: appthemProvider.isDarkMode
            ? AppColors.primaryDark
            : AppColors.white,
        automaticallyImplyLeading: true,
        title: Text(
          widget.name,
        ),
      ),
      body: ResponsiveCenter(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                              itemCount: 3,
                              pageSnapping: true,
                              controller: _pageController,
                              onPageChanged: setCurrentPageIndex,
                              itemBuilder: (context, pagePosition) {
                                return Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Image.network(
                                    widget.flag,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }),
                        ),
                        Positioned(
                            left: 20,
                            top: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                carouselButton(
                                  icon: Icons.arrow_back_ios,
                                  press: () {
                                    _pageController.previousPage(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.ease);
                                  },
                                ),
                                gapW32,
                              ],
                            )),
                        Positioned(
                            right: 20,
                            top: 100,
                            child: carouselButton(
                              icon: Icons.arrow_forward_ios,
                              press: () {
                                _pageController.nextPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.ease);
                              },
                            )),
                        // TODO: Page index indicator
                        Positioned(
                            bottom: MediaQuery.of(context).size.height / 25,
                            right: MediaQuery.of(context).size.width / 2.6,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  3,
                                  (index) => Container(
                                    margin: const EdgeInsets.all(3),
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: _currentPageIndex == index
                                            ? AppColors.white
                                            : const Color(0xFF999999),
                                        shape: BoxShape.circle),
                                  ),
                                ))),
                      ],
                    )
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
                  property: '${widget.area.toString()} Km2',
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
        ),
      ),
    );
  }
}

class carouselButton extends StatelessWidget {
  const carouselButton({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 194, 189, 189), shape: BoxShape.circle),
      child: Center(
        child: IconButton(
          icon: Icon(
            icon,
            size: 10,
          ),
          onPressed: () {},
        ),
      ),
    );
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: RichText(
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
      ),
    );
  }
}
