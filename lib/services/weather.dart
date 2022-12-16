import 'package:climat_ipnet/services/location.dart';
import 'package:climat_ipnet/services/networking.dart';

const String apiKey = "ec21610fc3f2330a46ac7c8e2fe062c8";
const String weatherOpenUrl = "https://api.openweathermap.org/data/2.5/weather";

  //Récupérer les données météo avec le nom de la ville
  Future<dynamic> getCityWeather(String cityName) async {
    String url = "$weatherOpenUrl?q=$cityName&appid=$apiKey";
    NetworkHelper networkHelper = NetworkHelper(url: url);
    return await networkHelper.getData();
  }

  //Récupérer les données météo avec la latitude et la longitude
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    location.getCurrentLocation();

    String latitude = location.latitude.toString();
    String longitude = location.longitude.toString();

    String url = "$weatherOpenUrl?lat=$latitude&lon=$longitude&appid=$apiKey";
    NetworkHelper networkHelper = NetworkHelper(url: url);
    return await networkHelper.getData();
  }

class WeatherModel {

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
