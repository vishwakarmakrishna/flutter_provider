import 'package:flutter/material.dart';
import 'package:flutter_provider/shop/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeConsumeScreen extends StatelessWidget {
  const HomeConsumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(child: SafeArea(child: Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        return Container(
          color: provider.isEligible == true
              ? Colors.green.shade400
              : Colors.red.shade400,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  '${provider.eligibleMessage}',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  onChanged: (value) {
                    if (value.isEmpty) return;
                    int age = int.tryParse(value) ?? 0;
                    provider.checkEligiblity(age);
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Enter your age"),
                ),
              )
            ],
          ),
        );
      },
    )));
  }
}
