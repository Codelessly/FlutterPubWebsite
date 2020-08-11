import 'package:flutter/material.dart';
import 'package:pub_dev/ui/blocks.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart packages',
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget),
        defaultScale: true,
        minWidth: 360,
        defaultName: MOBILE,
        breakpoints: [
          ResponsiveBreakpoint.resize(360),
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.resize(640, name: "MOBILE_LARGE"),
          ResponsiveBreakpoint.resize(850, name: TABLET),
          ResponsiveBreakpoint.resize(1080, name: DESKTOP),
        ],
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              MenuBar(),
              Header(),
              FlutterFavorites(),
              // Background squares image container.
              Container(
                constraints: BoxConstraints(maxWidth: 1440, minWidth: 1440),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg_squares.png'),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.center)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MostPopular(),
                    TopFlutter(),
                    TopDart(),
                    Container(height: 92),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
