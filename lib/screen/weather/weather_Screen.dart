import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String apiKey =
      '9a3f4afa747f2a59c63f9f75601a3256'; // Replace with your OpenWeatherMap API key
  String city = 'DHAKA'; // Default city

  String temperature = '';
  String description = '';
  String iconUrl = '';
  String currentTime = '';
  String currentLocation = ''; // To store the current location

  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCurrentLocation(); // Fetch the current location on app startup
    fetchWeatherData(city);
  }

  Future<void> fetchWeatherData(String city) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final temperature = data['main']['temp'].toString() + '°C';
        final description = data['weather'][0]['description'];
        final iconUrl =
            'http://openweathermap.org/img/wn/${data['weather'][0]['icon']}.png';

        // Format the current time to AM/PM format
        final currentTime = DateFormat.jm().format(DateTime.now());

        setState(() {
          this.temperature = temperature;
          this.description = description;
          this.iconUrl = iconUrl;
          this.currentTime = currentTime;
        });
      } else {
        // Handle API request error here
        print('API request failed with status code: ${response.statusCode}');
        // You can display an error message to the user.
      }
    } catch (error) {
      // Handle any other exceptions that may occur
      print('An error occurred: $error');
      // You can display a generic error message to the user.
    }
  }

  void fetchCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        setState(() {
          currentLocation =
              '${placemarks[0].locality}, ${placemarks[0].country}';
        });
      }
    } catch (error) {
      // Handle location retrieval error
      print('Error fetching location: $error');
      // Display an error message or handle the error as needed.
    }
  }

  void updateWeather() {
    setState(() {
      city = cityController.text;
    });
    fetchWeatherData(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 6, 126),
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
      ),
      body: Container(
        color: const Color.fromARGB(255, 3, 107, 244),
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 5,
          color: Color.fromARGB(255, 50, 7, 150),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Weather in $city',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Image.network(
                  iconUrl,
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Temperature: $temperature',
                  style: TextStyle(
                    fontSize: 28,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Description: $description',
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Time: $currentTime',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Location: $currentLocation',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: 'Enter city',
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: updateWeather,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  onSubmitted: (value) {
                    updateWeather();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
