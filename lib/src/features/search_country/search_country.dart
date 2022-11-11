import 'package:conutry_infos/src/api_calls/country_repository.dart';
import 'package:conutry_infos/src/constants/app_sizes.dart';
import 'package:conutry_infos/src/features/country_details/country_details.dart';
import 'package:conutry_infos/src/providers/app_theme_state.dart';
import 'package:conutry_infos/src/providers/global_provider.dart';
import 'package:conutry_infos/src/theme.dart';
import 'package:conutry_infos/src/widgets/dark_mode_switch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/search_bar.dart';

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
    // final provider = ref.watch(searchCountryNotifier);
  }

  @override
  Widget build(BuildContext context) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    ScrollController controller = ScrollController();
    return Scaffold(
      body: SingleChildScrollView(
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
                    color: appThemeState.isDarkMode
                        ? AppColors.primaryDark
                        : AppColors.white),
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
                                                            ExpantionTileSample(),
                                                            ExpantionTileSample()
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
                            icon: const Icon(Icons.filter)),
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
                          child: const Center(
                              child: Text('No Country For the Moment')),
                        );
                      }
                      if (snapshot.hasData) {
                        return ListView.separated(
                            separatorBuilder: (context, index) => const Padding(
                                  padding: EdgeInsets.only(bottom: 15),
                                ),
                            controller: controller,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 25),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        final data = snapshot.data![index];
                                        return CountryDetailsView(
                                            flag: snapshot.data![index].flagPng,
                                            name: snapshot
                                                .data![index].nameCommon,
                                            population:
                                                snapshot.data![index].capital,
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
                                        name: snapshot.data![index].nameCommon,
                                        capital: snapshot.data![index].capital,
                                        imgUrl: snapshot.data![index].flagPng),
                                  ),
                                ));
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
    );
  }
}

class ExpantionTileSample extends StatelessWidget {
  const ExpantionTileSample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ExpansionTile(
        title: Text(
          'continent',
          style: DefaultTextStyle.of(context).style,
        ),
        children: [
          for (var i = 0; i <= 10; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Africa',
                  style: DefaultTextStyle.of(context).style,
                ),
                Checkbox(value: false, onChanged: (value) {})
              ],
            )
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
