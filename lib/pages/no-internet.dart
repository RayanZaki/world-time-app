
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.signal_wifi_connected_no_internet_4_rounded,
              size: 50,
              color: Colors.grey[600],
            ),
            SizedBox(
              height: 10,
            ),
            Text('No internet connection',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[600]
                ),
                child: Text(
                  'Reload'
                ))
          ],
        ),
      ),
    );
  }
}
