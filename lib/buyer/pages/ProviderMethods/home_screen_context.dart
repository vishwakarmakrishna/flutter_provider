import 'package:flutter/material.dart';
import 'package:flutter_provider/shop/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeContextScreen extends StatelessWidget {
  const HomeContextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      child: Container(
        color: context.watch<HomeScreenProvider>().isEligible == true
            ? Colors.green.shade400
            : Colors.red.shade400,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                '${context.watch<HomeScreenProvider>().eligibleMessage}',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                initialValue:
                    context.watch<HomeScreenProvider>().getage.toString(),
                onChanged: (value) {
                  if (value.isEmpty) return;
                  int age = int.tryParse(value) ?? 0;
                  context.read<HomeScreenProvider>().checkEligiblity(age);
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Enter your age"),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
