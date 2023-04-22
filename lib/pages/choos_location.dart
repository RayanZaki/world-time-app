import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    child: Card(
                      child: ListTile(
                        onTap: () async {
                          bool received = await locations[index].getDate();
                          if ( !received ) {
                            await Navigator.pushNamed(context, '/no_internet');
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(context, '/');
                            return;
                          }
                          Navigator.pop(context, {
                            "location": locations[index].location,
                            "time": locations[index].time,
                            "flag": locations[index].flag,
                            "day": locations[index].day
                          });

                        },
                        title: Text(locations[index].location),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/${locations[index].flag}'
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
          ),

      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
