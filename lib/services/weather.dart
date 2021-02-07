import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:geolocator/geolocator.dart';

const String apiKey = 'b0bb24b8c5d52617946ff32e0f597ef6';
const String openWeatherMapURL =
    'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String newCityName) async {
    var url = '$openWeatherMapURL?q=$newCityName&appid=$apiKey&units=imperial';

    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    // create a new Location object
    Location location = Location();
    Position position;

    // get the current location
    position = await location.getCurrentLocation();

    // use the current location to get the weather data for that location
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=imperial');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

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
    if (temp > 85) {
      return 'It\'s 🍦 time';
    } else if (temp > 70) {
      return 'Time for shorts and 👕';
    } else if (temp < 40) {
      return 'You\'ll need 🧣 🎩 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
