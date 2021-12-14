import 'package:flutter/material.dart';
import 'ProviderMethods/home_screen_consumer.dart';
import 'ProviderMethods/home_screen_context.dart';
import 'ProviderMethods/home_screen_provider_of.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List waysToCallProvider = [
      {
        "name": "Consumer method",
        "value": const HomeConsumeScreen(),
      },
      {
        "name": "Context method",
        "value": const HomeContextScreen(),
      },
      {
        "name": "Provider of method",
        "value": const HomeProviderOfScreen(),
      }
    ];
    return Material(
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Center(
              child: Text(
            "Ways to use provider",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )),
          Center(
            child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (newcontext, index) {
                  return const SizedBox(
                    height: 50,
                  );
                },
                itemCount: waysToCallProvider.length,
                itemBuilder: (newcontext, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return waysToCallProvider[index]['value'];
                            },
                          ),
                        );
                      },
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 15),
                          Text(
                            waysToCallProvider[index]['name'].toString(),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      color: Colors.blue,
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
