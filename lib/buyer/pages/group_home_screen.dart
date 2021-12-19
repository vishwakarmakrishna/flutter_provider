import 'package:flutter/material.dart';
import 'package:flutter_provider/buyer/pages/tab.dart';
import 'package:flutter_provider/shop/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';
import 'ProviderMethods/home_screen_consumer.dart';
import 'ProviderMethods/home_screen_context.dart';
import 'ProviderMethods/home_screen_provider_of.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List waysToCallProvider = [
      {
        "name": "Consumer\nmethod",
        "value": const HomeConsumeScreen(),
      },
      {
        "name": "Context\nmethod",
        "value": const HomeContextScreen(),
      },
      {
        "name": "Provider of\nmethod",
        "value": const HomeProviderOfScreen(),
      }
    ];
    return Material(
      child: SafeArea(
        child: DefaultTabController(
          length: waysToCallProvider.length,
          child: NestedScrollView(
            headerSliverBuilder: (newcontext, value) {
              return [
                SliverAppBar(
                  expandedHeight: 100,
                  pinned: true,
                  floating: true,
                  elevation: 50,
                  flexibleSpace: FlexibleSpaceBar(
                    background: InkWell(
                      onTap: () {},
                      child: CustomTabBar(
                        tabDecoration: BoxDecoration(
                          color: Colors.grey[50],
                        ),
                        height: screenSize.height * 0.080,
                        radius: 10.0,
                        bottonwidthSize: screenSize.height * 0.100,
                        bottonheightSize: screenSize.height * 0.080,
                        labelSpacing: screenSize.width * 0.2,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.0525),
                        buttonMargin: EdgeInsets.symmetric(
                            vertical: screenSize.height * 0.015,
                            horizontal: screenSize.width * 0.025),
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: newcontext
                                        .watch<HomeScreenProvider>()
                                        .isEligible ==
                                    true
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Montserrat'),
                        unselectedLabelStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Montserrat'),
                        unselectedDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[50],
                          border: Border.all(
                            color: const Color(0xFFE0E5D4),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        tabs: List.generate(
                          waysToCallProvider.length,
                          (index) => Tab(
                            text: waysToCallProvider[index]['name'],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children:
                  List<Widget>.generate(waysToCallProvider.length, (int index) {
                return waysToCallProvider[index]["value"];
              }),
            ),
          ),
        ),
      ),
    );
  }
}
