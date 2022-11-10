import 'package:conutry_infos/src/constants/app_sizes.dart';
import 'package:conutry_infos/src/providers/global_provider.dart';
import 'package:conutry_infos/src/theme.dart';
import 'package:conutry_infos/src/widgets/dark_mode_switch.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/search_bar.dart';

class SearchCountryView extends HookConsumerWidget {
  const SearchCountryView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
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
                        color: appThemeState.isDarkModeEnabled
                            ? AppColors.white
                            : AppColors.primaryDark,
                      ),
                      const DarkModeSwitch()
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: SearchBox(),
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
                            border: Border.all(
                                color: AppColors.borders, width: 0.5)),
                        child: Row(children: [
                          IconButton(
                              onPressed: () {
                                _showBottomSheet(
                                  context,
                                );
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
                            border: Border.all(
                                color: AppColors.borders, width: 0.5)),
                        child: Row(children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.filter)),
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
                  height: double.maxFinite,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (context, index) => const Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 25, top: 10),
                            child: CountryHolder(),
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CountryHolder extends StatelessWidget {
  const CountryHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/logo.png',
                height: 30,
                width: 30,
              ),
              gapW20,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [Text('Afganistan'), Text('Kabul')],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
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
                  decoration: const BoxDecoration(
                    //TODO: change the color depending on themeMode
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
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

void loadList() async {
  var res = await Dio().get('https://restcountries.com/v3.1/all');
  if (res.statusCode == 200) {
    print(res.data);
  }
}
