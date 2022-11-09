import 'package:conutry_infos/src/widgets/dark_mode_switch.dart';

import 'package:flutter/material.dart';

class SearchCountryView extends StatefulWidget {
  const SearchCountryView({super.key});

  @override
  State<SearchCountryView> createState() => _SearchCountryViewState();
}

class _SearchCountryViewState extends State<SearchCountryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: const [
                    Expanded(flex: 3, child: Text('Explore')),
                    DarkModeSwitch()
                    // Expanded(
                    //   flex: 1,
                    //   child: IconButton(
                    //       onPressed: () {},
                    //       icon: const Icon(Icons.wb_sunny_outlined)),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
