import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/countryModel.dart';

class CountryRepository {
  final String _baseUrl = "https://restcountries.com/v3.1/all";
  List<CountryModel> countryList = [];

  Future<List<CountryModel>?> getCountries() async {
    final response = await http.get(Uri.parse(_baseUrl));
    try {
      if (response.statusCode == 200) {
        var jsonList = jsonDecode(response.body) as List;

        for (var element in jsonList) {
          countryList.add(CountryModel.fromJson(element));
        }
        print(countryList);
        return countryList;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
    return null;
  }
}
