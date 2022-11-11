import 'dart:convert';

import 'package:conutry_infos/src/api_calls/country_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../models/countryModel.dart';

class SearchCountryViewModel extends ChangeNotifier {
  final CountryRepository _countryRepository = CountryRepository();
  late List<CountryModel> countryList = _countryRepository.countryList;
}


// void loadList() async {
//   var res = await Dio().get('https://restcountries.com/v3.1/all');
//   if (res.statusCode == 200) {
//     print(res.data);
//   }
// }
