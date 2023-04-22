import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String load = 'Loading...';
  bool reload = false;
  void setupWorldTime() async {
      WorldTime instance = WorldTime(
          location: 'Berlin', flag: 'Berlin.png', url: '/Europe/Berlin');
      bool got_data = await instance.getDate();
      if ( !got_data ) {
        await Navigator.pushNamed(context, '/no_internet');
        Navigator.pushReplacementNamed(context, '/');
        return;
      }
      setState(() {
        load = instance.time;
      });
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "location": instance.location,
        "time": instance.time,
        "flag": instance.flag,
        "day": instance.day
      });

  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: SpinKitRing(
          color: Colors.blue,
          size: 50.0,
        ),
      )
    );
  }
}
