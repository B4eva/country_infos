import 'package:conutry_infos/src/api_calls/country_repository.dart';
import 'package:conutry_infos/src/constants/app_sizes.dart';
import 'package:conutry_infos/src/providers/app_theme_state.dart';
import 'package:conutry_infos/src/providers/global_provider.dart';
import 'package:conutry_infos/src/theme.dart';
import 'package:conutry_infos/src/widgets/dark_mode_switch.dart';
import 'package:conutry_infos/src/widgets/responsive_center.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../models/countryModel.dart';
import '../../widgets/search_bar.dart';
import '../country_details/country_details.dart';

List<String> continents = [
  'Africa',
  'Asia',
  'Europe',
  'South America',
  'North America',
  ''
];

class SearchCountryView extends ConsumerStatefulWidget {
  const SearchCountryView({
    super.key,
  });

  @override
  _SearchCountryViewState createState() => _SearchCountryViewState();
}

class _SearchCountryViewState extends ConsumerState<SearchCountryView> {
  @override
  void initState() {
    super.initState();
  }

  List<CountryModel> allCountries = [];

  void searchCountry(String query) {
    final suggestions = CountryRepository().countryList.where((country) {
      final countryName = country.nameCommon.toLowerCase();
      return countryName.contains(query);
    }).toList();

    setState(() {
      allCountries = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('all countries $allCountries');
    final appThemeState = ref.watch(appThemeStateNotifier);
    final appThemeStat = ref.watch(searchCountryNotifier);
    ScrollController controller = ScrollController();
    return Scaffold(
        body: ResponsiveCenter(
      child: SingleChildScrollView(
        controller: controller,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 23,
                      width: 90,
                      color: appThemeState.isDarkMode
                          ? AppColors.white
                          : AppColors.primaryDark,
                    ),
                    const BrightnessToggle()
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: SearchBox(
                    textChanged: (p0) => searchCountry,
                    color: appThemeState.isDarkMode
                        ? AppColors.primaryDark
                        : AppColors.gray),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 25, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 73,
                      height: 40,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.borders, width: 0.5)),
                      child: Row(children: [
                        IconButton(
                            onPressed: () {
                              _showBottomSheet(context, appThemeState);
                            },
                            icon: const Icon(
                              Icons.language,
                            )),
                        const Text(
                          'EN',
                          style: TextStyle(fontSize: 10),
                        )
                      ]),
                    ),
                    Container(
                      width: 73,
                      height: 40,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.borders, width: 0.5)),
                      child: Row(children: [
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Container(
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.001),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: DraggableScrollableSheet(
                                          expand: false,
                                          initialChildSize: 0.4,
                                          minChildSize: 0.2,
                                          maxChildSize: 0.75,
                                          builder: (_, controller) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                //TODO: change the color depending on themeMode
                                                color: appThemeState.isDarkMode
                                                    ? AppColors.primaryDark
                                                    : AppColors.white,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(25.0),
                                                  topRight:
                                                      Radius.circular(25.0),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  Icon(
                                                    Icons.remove,
                                                    color: Colors.grey[600],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20,
                                                            top: 5),
                                                    child: SizedBox(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text('Filter'),
                                                          IconButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              icon: const Icon(
                                                                  Icons.cancel))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        child: ListView(
                                                          controller:
                                                              controller,
                                                          children: const [
                                                            ExpantionTileSample(
                                                              title:
                                                                  'Continent',
                                                            ),
                                                            ExpantionTileSample(
                                                              title:
                                                                  'Time Zone',
                                                            )
                                                          ],
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.filter_alt_sharp)),
                        const Text(
                          'Filter',
                          style: TextStyle(fontSize: 10),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              gapH20,
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: FutureBuilder(
                    future: CountryRepository().getCountries(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Container(
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.refresh)),
                              const Center(
                                child: Text('No Country At  the Moment'),
                              ),
                            ],
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        return GroupedListView(
                          elements: snapshot.data!,
                          groupBy: ((element) => element.nameOfficial),
                          groupComparator: (value1, value2) =>
                              value2.compareTo(value1),
                          itemComparator: (item1, item2) =>
                              item1.nameOfficial.compareTo(item2.nameOfficial),
                          useStickyGroupSeparators: false,
                          order: GroupedListOrder.DESC,
                          groupSeparatorBuilder: ((value) => Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(value
                                    .trim()
                                    .split('')
                                    .map((e) => e[0])
                                    .take(1)
                                    .join()),
                              )),
                          itemBuilder: (context, element) => Padding(
                            padding: const EdgeInsets.only(left: 20, right: 25),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  final data = element;
                                  return CountryDetailsView(
                                      flag: data.flagPng,
                                      name: data.nameOfficial,
                                      population: data.population.toString(),
                                      area: data.area.toString(),
                                      capital: data.capital,
                                      coatOfArms: data.coatOfArms,
                                      continent: data.continents,
                                      region: data.region,
                                      subregion: data.subregion,
                                      // language: data.language,
                                      timeZone: data.timeZone,
                                      carSide: data.carSide);
                                }));
                              },
                              child: CountryHolder(
                                  name: element.nameOfficial,
                                  capital: element.capital,
                                  imgUrl: element.flagPng),
                            ),
                          ),
                        );
                      }
                      return Container(
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}

class ExpantionTileSample extends StatefulWidget {
  final String? title;
  const ExpantionTileSample({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ExpantionTileSample> createState() => _ExpantionTileSampleState();
}

class _ExpantionTileSampleState extends State<ExpantionTileSample> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ExpansionTile(
        title: Text(
          widget.title!,
          style: DefaultTextStyle.of(context).style,
        ),
        children: [
          Column(
            children: List.generate(
              6,
              ((index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          continents[index],
                          style: DefaultTextStyle.of(context).style,
                        ),
                        gapW32,
                        Checkbox(
                            value: false,
                            onChanged: (value) {
                              setState(() {
                                value = true;
                              });
                            }),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class CountryHolder extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String capital;
  const CountryHolder({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.capital,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                ),
              ),
              gapW20,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    Text(capital,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.subTextColor,
                            fontSize: 14))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, AppThemeState appThemeState) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          color: const Color.fromRGBO(0, 0, 0, 0.001),
          child: GestureDetector(
            onTap: () {},
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.4,
              minChildSize: 0.2,
              maxChildSize: 0.75,
              builder: (_, controller) {
                return Container(
                  decoration: BoxDecoration(
                    //TODO: change the color depending on themeMode
                    color: appThemeState.isDarkMode
                        ? AppColors.primaryDark
                        : AppColors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.remove,
                        color: Colors.grey[600],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 5),
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Languages'),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.cancel))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.builder(
                              controller: controller,
                              itemCount: 20,
                              itemBuilder: (_, index) {
                                return Card(
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Element at index($index)"),
                                        Radio(
                                            value: 0,
                                            groupValue: 1,
                                            onChanged: (value) {})
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
