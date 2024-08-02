import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/screens/api_screen.dart';
import 'package:flutter_bloc_demo/screens/colors_screen.dart';
import 'package:flutter_bloc_demo/screens/counter_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            TextButton(
              child: const Text(
                "Counter",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CounterScreen();
                }));
              },
            ),
            TextButton(
              child: const Text(
                "Colors",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ColorsScreen();
                }));
              },
            ),
            TextButton(
              child: const Text(
                "Api Test",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const UserScreen();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
