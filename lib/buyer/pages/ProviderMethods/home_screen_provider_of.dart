import 'package:flutter/material.dart';
import 'package:flutter_provider/shop/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeProviderOfScreen extends StatelessWidget {
  const HomeProviderOfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerOfContextWatch = Provider.of<HomeScreenProvider>(context);
    var providerOfContextRead =
        Provider.of<HomeScreenProvider>(context, listen: false);
    return Material(
        child: SafeArea(
            child: Container(
      color: providerOfContextRead.isEligible == true
          ? Colors.green.shade400
          : Colors.red.shade400,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              '${providerOfContextRead.eligibleMessage}',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (value) {
                if (value.isEmpty) return;
                int age = int.tryParse(value) ?? 0;
                providerOfContextWatch.checkEligiblity(age);
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Enter your age"),
            ),
          )
        ],
      ),
    )));
  }
}
