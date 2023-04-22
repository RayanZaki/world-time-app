import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map arguments = {};
  @override
  Widget build(BuildContext context) {
    arguments =  arguments.isNotEmpty ? arguments : ModalRoute.of(context)?.settings.arguments as Map;

    String bgImage =  arguments['day'] ? 'day.png' : 'night.png';
    Color? bgColor =  arguments['day'] ? Colors.blue[100] : Colors.blue[900];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/$bgImage',
              ),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async {
                     dynamic result = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       arguments = {
                         "time": result['time'],
                         "location": result['location'],
                         "day": result['day'],
                         "flag": result['flag']
                       };
                     });result;
                    },
                    icon: Icon(Icons.edit_location, color: Colors.grey[300],),
                    label: Text('Edit Locations', style: TextStyle(color: Colors.grey[300]),), ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(arguments['location'],
                    style:  TextStyle(
                      color: Colors.grey[300],
                      fontSize: 28,
                      letterSpacing: 2
                    ),)
                  ],
                ),
                SizedBox(height: 30,),
                Text(arguments['time'],
                style: TextStyle(
                  fontSize: 66,
                  color: Colors.grey[300]
                ),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
