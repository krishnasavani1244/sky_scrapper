class Weather{
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;

  Weather({
    required this.cityName,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.feels_like,
    required this.pressure,
});



  Weather.fromJson(Map<String,dynamic> json){
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
  }
}