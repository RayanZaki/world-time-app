import 'package:http/http.dart' ;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location = ''; // location name for the UI
  String time = '';     // The time in that location
  String flag = '';     // Url to the flag asset endpoint
  String url = '';      // the location url for API endpoint
  bool day = false;             // To tell if at day time or night time

  WorldTime({required this.location , required this.flag , required this.url });

  Future<bool> getDate() async {
    try {
      // make the request
      Response res = await get(
          Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      // Parse the data
      Map data = jsonDecode(res.body);
      String date = data['datetime'];
      String offset = data['utc_offset'];
      DateTime now = DateTime.parse(date);
      now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));
      time = now.toString(); // set the time property
      time = DateFormat.jm().format(now);
      day = now.hour > 6 && now.hour < 20 ? true : false;
      return true;
    } catch (e) {
      print('caught error $e');
      time = 'internet error';
      return false;

    }
  }
}