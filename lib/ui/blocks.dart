import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pub_dev/components/components.dart';
import 'package:pub_dev/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: backgroundColor,
      padding: ResponsiveValue<EdgeInsets>(context,
          defaultValue: EdgeInsets.symmetric(
            horizontal: 35,
          ),
          valueWhen: [
            Condition.smallerThan(
                name: TABLET, value: EdgeInsets.symmetric(horizontal: 0))
          ]).value,
      child: Row(
        children: [
          ResponsiveVisibility(
            visible: true,
            hiddenWhen: [Condition.smallerThan(name: TABLET)],
            child: Expanded(
              child: Container(),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: [Condition.smallerThan(name: TABLET)],
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Color(0xFFF8F9FA), size: 24),
            ),
          ),
          ResponsiveVisibility(
            visible: true,
            hiddenWhen: [Condition.smallerThan(name: TABLET)],
            child: FlatButton(
              onPressed: () {},
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Text(
                'Sign in',
                style: TextStyle(fontSize: 14, color: Color(0xFFF8F9FA)),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: true,
            hiddenWhen: [Condition.smallerThan(name: TABLET)],
            child: FlatButton(
              onPressed: () {},
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Help',
                    style: TextStyle(fontSize: 14, color: Color(0xFFF8F9FA)),
                  ),
                  Icon(Icons.keyboard_arrow_down,
                      color: Color(0xFF757575), size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_header.jpg'),
              fit: BoxFit.cover)),
      padding: EdgeInsets.symmetric(vertical: 110),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/pub_dev_logo.png', height: 70),
          Padding(padding: EdgeInsets.only(bottom: 28)),
          Container(
            constraints: BoxConstraints(maxWidth: 880),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Color(0xFF34404D),
            ),
            margin: EdgeInsets.symmetric(horizontal: 48, vertical: 20),
            child: TextField(
              style: TextStyle(color: Colors.white, fontSize: 24),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Color(0xFF888888)),
                  icon: Padding(
                    padding: EdgeInsets.only(left: 35),
                    child:
                        Icon(Icons.search, color: Color(0xFF888888), size: 24),
                  ),
                  hintText: 'Search packages',
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(0, 20, 35, 20)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: RichText(
              text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  children: [
                    TextSpan(text: 'Find and use packages to build '),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            openUrl("https://dart.dev");
                          },
                        text: 'Dart',
                        style: TextStyle(color: linkDarkBackgroundColor)),
                    TextSpan(text: ' and '),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            openUrl(
                                "https://gallery.codelessly.com/flutterwebsites/flutterwebsite");
                          },
                        text: 'Flutter',
                        style: TextStyle(color: linkDarkBackgroundColor)),
                    TextSpan(text: ' apps.'),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

class FlutterFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFFF5F5F7),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1110),
          padding: EdgeInsets.fromLTRB(0, 44, 0, 32),
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Flutter Favorites', style: titleTextStyle),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: textPrimaryColor, fontSize: 18, height: 1.6),
                  children: [
                    TextSpan(
                      text: 'Packages that demonstrate the ',
                    ),
                    TextSpan(
                        text: 'highest levels of quality',
                        style: TextStyle(color: linkColor)),
                    TextSpan(
                        text: ', selected by the Flutter Ecosystem Committee'),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ResponsiveGridView.builder(
                gridDelegate: ResponsiveGridDelegate(
                    crossAxisExtent: 260,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.37),
                maxRowCount: 1,
                itemCount: 4,
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(4, 8, 0, 8),
                alignment: Alignment.center,
                itemBuilder: (context, index) {
                  return PackageCard();
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text('VIEW ALL',
                      style: TextStyle(
                          color: linkColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MostPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 280),
              child: Image.asset('assets/images/image_packages_1.png',
                  fit: BoxFit.contain),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 24)),
              Text('Most popular packages', style: titleTextStyle),
              Text('The most downloaded packages over the past 60 days',
                  style: TextStyle(
                      color: textPrimaryColor, fontSize: 18, height: 1.6)),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Container(
                constraints: BoxConstraints(maxWidth: 834),
                child: ResponsiveGridView.builder(
                  gridDelegate: ResponsiveGridDelegate(
                      crossAxisExtent: 260,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.37),
                  maxRowCount: 2,
                  itemCount: 6,
                  shrinkWrap: true,
                  padding: EdgeInsets.fromLTRB(4, 8, 0, 16),
                  alignment: Alignment.center,
                  itemBuilder: (context, index) {
                    return PackageCard();
                  },
                ),
              ),
              // TODO: Alignment isn't working due to Flutter issue.
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text('VIEW ALL',
                      style: TextStyle(
                          color: linkColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 24)),
              Text('Top Flutter packages', style: titleTextStyle),
              Text('Top packages that extend Flutter with new features',
                  style: TextStyle(
                      color: textPrimaryColor, fontSize: 18, height: 1.6)),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Container(
                constraints: BoxConstraints(maxWidth: 834),
                child: ResponsiveGridView.builder(
                  gridDelegate: ResponsiveGridDelegate(
                      crossAxisExtent: 260,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.37),
                  maxRowCount: 2,
                  itemCount: 6,
                  shrinkWrap: true,
                  padding: EdgeInsets.fromLTRB(4, 8, 0, 16),
                  alignment: Alignment.center,
                  itemBuilder: (context, index) {
                    return PackageCard();
                  },
                ),
              ),
              // TODO: Alignment isn't working due to Flutter issue.
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text('VIEW ALL',
                      style: TextStyle(
                          color: linkColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 60),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 280),
                child: Image.asset('assets/images/image_packages_2.png',
                    fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 60),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 280),
                child: Image.asset('assets/images/image_packages_3.png',
                    fit: BoxFit.contain),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 24)),
              Text('Top Flutter packages', style: titleTextStyle),
              Text('Top packages that extend Flutter with new features',
                  style: TextStyle(
                      color: textPrimaryColor, fontSize: 18, height: 1.6)),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Container(
                constraints: BoxConstraints(maxWidth: 834),
                child: ResponsiveGridView.builder(
                  gridDelegate: ResponsiveGridDelegate(
                      crossAxisExtent: 260,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.37),
                  maxRowCount: 2,
                  itemCount: 6,
                  shrinkWrap: true,
                  padding: EdgeInsets.fromLTRB(4, 8, 0, 16),
                  alignment: Alignment.center,
                  itemBuilder: (context, index) {
                    return PackageCard();
                  },
                ),
              ),
              // TODO: Alignment isn't working due to Flutter issue.
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text('VIEW ALL',
                      style: TextStyle(
                          color: linkColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 24, 30, 24),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0x4D000000), offset: Offset(0, 2), blurRadius: 5),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('responsive_framework', style: linkTitleTextStyle),
          Text(
              'Easily make Flutter apps responsive. Automatically adapt UI to different screen sizes. Responsiveness made simple.',
              style:
                  TextStyle(color: textPrimaryColor, fontSize: 14, height: 1.6),
              maxLines: 3,
              overflow: TextOverflow.clip),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/icon_verified_publisher.png',
                  width: 14, height: 16),
              Padding(padding: EdgeInsets.only(right: 4)),
              GestureDetector(
                onTap: () => openUrl('https://codelessly.com'),
                child: Text('codelessly.com',
                    style: TextStyle(color: linkColor, fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
