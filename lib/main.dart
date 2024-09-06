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
      builder: (context, widget) => ResponsiveBreakpoints.builder(
          child: ClampingScrollWrapper.builder(context, widget!),
          breakpoints: [
            const Breakpoint(start: 0, end: 480, name: MOBILE),
            const Breakpoint(start: 481, end: 640, name: 'MOBILE_LARGE'),
            const Breakpoint(start: 641, end: 1080, name: TABLET),
            const Breakpoint(start: 1081, end: double.infinity, name: DESKTOP),
          ]),
      home: Scaffold(
        body: Listener(
          onPointerDown: (event) {
            // Clear Header search TextField focus.
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: ListView.builder(
              itemCount: blocks.length,
              itemBuilder: (context, index) {
                return blocks[index];
              }),
        ),
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

List<Widget> blocks = [
  const MenuHeader(),
  const Header(),
  const FlutterFavorites(),
  // Background squares image container.
  Container(
    constraints: const BoxConstraints(maxWidth: 1440, minWidth: 1440),
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
];
