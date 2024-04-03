class weatherModel {
  final String cityNmae;
  final String date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  weatherModel({
    required this.cityNmae,
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory weatherModel.fromjson(data) {
    //var jsonDate = data['forecast']['forecastday'][0]['day'];

    return weatherModel(
      image: data['forecast']['forecastday'][0]['day']['condition']['icon'],
      cityNmae: data['location']['name'],
      date: data['current']['last_updated'],
      temp: data['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: data['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition:  data['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
