import 'package:flutter/material.dart';
import 'package:pub_dev/ui/blocks.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart packages',
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        defaultScale: true,
        minWidth: 360,
        defaultName: MOBILE,
        breakpoints: [
          const ResponsiveBreakpoint.resize(360),
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.resize(640, name: 'MOBILE_LARGE'),
          const ResponsiveBreakpoint.resize(850, name: TABLET),
          const ResponsiveBreakpoint.resize(1080, name: DESKTOP),
        ],
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Listener(
            onPointerDown: (event) {
              // Clear Header search TextField focus.
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              children: <Widget>[
                const MenuBar(),
                const Header(),
                const FlutterFavorites(),
                // Background squares image container.
                Container(
                  constraints:
                      const BoxConstraints(maxWidth: 1440, minWidth: 1440),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/bg_squares.png'),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const MostPopular(),
                      const TopFlutter(),
                      const TopDart(),
                      Container(height: 92),
                    ],
                  ),
                ),
                const Footer(),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
