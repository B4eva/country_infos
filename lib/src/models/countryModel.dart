class CountryModel {
  const CountryModel({
    required this.nameCommon,
    required this.nameOfficial,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.area,
    required this.population,
    required this.continents,
    required this.flagPng,
    required this.coatOfArms,

    // required this.currency,
    required this.timeZone,
    this.unGrouped = 'All Countries',
    this.carSide = 'left',
  });

  final String nameCommon;
  final String nameOfficial;
  final String capital;
  final String region;
  final String subregion;
  final double area;
  final int population;
  final String continents;
  final String flagPng;
  final String unGrouped;
  final String carSide;
  final String coatOfArms;

  // final String language;
  // final String currency;
  final String timeZone;

  @override
  List<Object?> get props => [
        nameCommon,
        nameOfficial,
        capital,
        region,
        subregion,
        area,
        population,
        continents,
        flagPng,
      ];

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    // var capitalsFromJson = json['capital'];
    // List<String> capitalsList =
    //     List<String>.from(capitalsFromJson).map((e) => e).toList();

    return CountryModel(
      nameCommon: json["name"]["common"],
      nameOfficial: json["name"]["official"],
      capital: List<String>.from(
              json["capital"]?.map((cap) => cap) ?? ['No Capital'])
          .toString()
          .replaceAll(']', '')
          .replaceAll('[', ''),
      region: json["region"],
      subregion: json["subregion"] ?? 'No Subregion',
      area: json["area"],
      population: json["population"],
      continents: json["continents"][0],
      flagPng: json["flags"]["png"],
      carSide: json['car']['side'],
      coatOfArms: json['coatOfArms']['png'] ?? '',
      // currency: json['currencies']['BBD'],
      timeZone: json['timezones'][0],
      // language: json['languages']['eng'] ?? ''
    );
  }
}


// class Language { 
// String 

// }