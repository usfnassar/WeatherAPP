class WeatherModel{
  final String city;
  final DateTime date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String condition;

  WeatherModel({required this.city, required this.date, required this.image, required this.temp, required this.maxTemp, required this.minTemp, required this.condition});
  factory WeatherModel.fromJson(json)
  {
    var city=json['location'];
    var date=json['current'];
    var weather=json['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        city: city['name'],
        date: DateTime.parse(date['last_updated']),
        temp: weather['avgtemp_c'],
        maxTemp: weather['maxtemp_c'],
        minTemp: weather['mintemp_c'],
        condition: weather['condition']['text'],
        image: weather['condition']['icon'],
    );
  }

}