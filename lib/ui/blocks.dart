import 'package:flutter/material.dart';
import 'package:pub_dev/components/components.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: background,
      padding: ResponsiveValue(context,
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
