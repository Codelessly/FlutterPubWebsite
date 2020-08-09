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
              Padding(padding: EdgeInsets.only(bottom: 12)),
              Align(
                alignment: Alignment.center,
                child: ResponsiveGridView.builder(
                  gridDelegate: ResponsiveGridDelegate(
                      crossAxisExtent: 260,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.37),
                  maxRowCount: 1,
                  itemCount: 10,
                  shrinkWrap: true,
                  padding: EdgeInsets.fromLTRB(4, 8, 0, 8),
                  alignment: Alignment.center,
                  itemBuilder: (context, index) {
                    return PackageCard();
                  },
                ),
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
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveGridView extends StatelessWidget {
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController controller;
  final bool primary;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final ResponsiveGridDelegate gridDelegate;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final int maxRowCount;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double cacheExtent;
  final int semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  ResponsiveGridView.builder({
    Key key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.alignment = Alignment.centerLeft,
    @required this.gridDelegate,
    @required this.itemBuilder,
    this.itemCount,
    this.maxRowCount,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  }) : assert(gridDelegate != null);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      int crossAxisCount;
      int maxItemCount;
      EdgeInsetsGeometry alignmentPadding;
      double crossAxisWidth;
      double crossAxisExtent = constraints.maxWidth - padding.horizontal;
      assert(crossAxisExtent > 0,
          '$padding exceeds layout width (${constraints.maxWidth})');
      if (gridDelegate.crossAxisExtent != null) {
        crossAxisCount = (crossAxisExtent /
                (gridDelegate.crossAxisExtent + gridDelegate.crossAxisSpacing))
            .floor();
        crossAxisWidth = crossAxisCount *
                (gridDelegate.crossAxisExtent + gridDelegate.crossAxisSpacing) +
            padding.horizontal;
      } else if (gridDelegate.maxCrossAxisExtent != null) {
        crossAxisCount = (crossAxisExtent /
                (gridDelegate.maxCrossAxisExtent +
                    gridDelegate.crossAxisSpacing))
            .ceil();
        final double usableCrossAxisExtent = crossAxisExtent -
            gridDelegate.crossAxisSpacing * (crossAxisCount - 1);
        final double childCrossAxisExtent =
            usableCrossAxisExtent / crossAxisCount;
        crossAxisWidth = crossAxisCount *
                (childCrossAxisExtent + gridDelegate.crossAxisSpacing) +
            padding.horizontal;
      } else {
        crossAxisCount = (crossAxisExtent /
                (gridDelegate.minCrossAxisExtent +
                    gridDelegate.crossAxisSpacing))
            .floor();
        final double usableCrossAxisExtent = crossAxisExtent -
            gridDelegate.crossAxisSpacing * (crossAxisCount - 1);
        final double childCrossAxisExtent =
            usableCrossAxisExtent / crossAxisCount;
        crossAxisWidth = crossAxisCount *
                (childCrossAxisExtent + gridDelegate.crossAxisSpacing) +
            padding.horizontal;
      }
      if (alignment == Alignment.centerLeft ||
          alignment == Alignment.topLeft ||
          alignment == Alignment.bottomLeft) {
        alignmentPadding = EdgeInsets.only(left: 0);
      } else if (alignment == Alignment.center ||
          alignment == Alignment.topCenter ||
          alignment == Alignment.bottomCenter) {
        double paddingCalc = constraints.maxWidth - crossAxisWidth;
        if (paddingCalc <= 0) {
          alignmentPadding = EdgeInsets.only(left: 0);
        } else if (paddingCalc > gridDelegate.crossAxisSpacing) {
          alignmentPadding = EdgeInsets.only(
              left: ((constraints.maxWidth -
                          crossAxisWidth -
                          gridDelegate.crossAxisSpacing) /
                      2) +
                  gridDelegate.crossAxisSpacing);
        } else {
          alignmentPadding = EdgeInsets.only(left: paddingCalc);
        }
      } else {
        alignmentPadding =
            EdgeInsets.only(left: constraints.maxWidth - crossAxisWidth);
      }
      if (maxRowCount != null) {
        maxItemCount = maxRowCount * crossAxisCount;
      }
      SliverChildDelegate childrenDelegate = SliverChildBuilderDelegate(
          itemBuilder,
          childCount: maxItemCount ?? itemCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes);
      return Container(
        padding: alignmentPadding,
        child: _ResponsiveGridViewLayout(
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
          gridDelegate: gridDelegate,
          childrenDelegate: childrenDelegate,
          itemBuilder: itemBuilder,
          itemCount: itemCount,
          maxRowCount: maxRowCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
        ),
      );
    });
  }
}

class _ResponsiveGridViewLayout extends BoxScrollView {
  final ResponsiveGridDelegate gridDelegate;
  final SliverChildDelegate childrenDelegate;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final int maxRowCount;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;

  _ResponsiveGridViewLayout({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    @required this.gridDelegate,
    @required this.childrenDelegate,
    @required this.itemBuilder,
    this.itemCount,
    this.maxRowCount,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    double cacheExtent,
    int semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
  })  : assert(gridDelegate != null),
        super(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount ?? itemCount,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
        );

  @override
  Widget buildChildLayout(BuildContext context) {
    return SliverGrid(
      delegate: childrenDelegate,
      gridDelegate: gridDelegate,
    );
  }
}

class ResponsiveGridDelegate extends SliverGridDelegate {
  const ResponsiveGridDelegate({
    this.crossAxisExtent,
    this.maxCrossAxisExtent,
    this.minCrossAxisExtent,
    this.mainAxisSpacing = 0,
    this.crossAxisSpacing = 0,
    this.childAspectRatio = 1,
  })  : assert(
            (crossAxisExtent != null && crossAxisExtent >= 0) ||
                (maxCrossAxisExtent != null && maxCrossAxisExtent >= 0) ||
                (minCrossAxisExtent != null && minCrossAxisExtent >= 0),
            'Must provide a valid cross axis extent.'),
        assert(mainAxisSpacing != null && mainAxisSpacing >= 0),
        assert(crossAxisSpacing != null && crossAxisSpacing >= 0),
        assert(childAspectRatio != null && childAspectRatio > 0);

  final double crossAxisExtent;
  final double maxCrossAxisExtent;
  final double minCrossAxisExtent;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;

  bool _debugAssertIsValid(double crossAxisExtent) {
    assert(crossAxisExtent > 0.0);
    assert(mainAxisSpacing >= 0.0);
    assert(crossAxisSpacing >= 0.0);
    assert(childAspectRatio > 0.0);
    return true;
  }

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    assert(_debugAssertIsValid(constraints.crossAxisExtent));
    int crossAxisCount;
    double mainAxisStride;
    double crossAxisStride;
    double childMainAxisExtent;
    double childCrossAxisExtent;
    if (this.crossAxisExtent != null) {
      crossAxisCount =
          (constraints.crossAxisExtent / (crossAxisExtent + crossAxisSpacing))
              .floor();
      childCrossAxisExtent = crossAxisExtent;
      childMainAxisExtent = childCrossAxisExtent / childAspectRatio;
      mainAxisStride = childMainAxisExtent + mainAxisSpacing;
      crossAxisStride = childCrossAxisExtent + crossAxisSpacing;
    } else if (this.maxCrossAxisExtent != null) {
      crossAxisCount = (constraints.crossAxisExtent /
              (maxCrossAxisExtent + crossAxisSpacing))
          .ceil();
      final double usableCrossAxisExtent =
          constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1);
      childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
      childMainAxisExtent = childCrossAxisExtent / childAspectRatio;
      mainAxisStride = childMainAxisExtent + mainAxisSpacing;
      crossAxisStride = childCrossAxisExtent + crossAxisSpacing;
    } else {
      crossAxisCount = (constraints.crossAxisExtent /
              (minCrossAxisExtent + crossAxisSpacing))
          .floor();
      final double usableCrossAxisExtent =
          constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1);
      childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
      childMainAxisExtent = childCrossAxisExtent / childAspectRatio;
      mainAxisStride = childMainAxisExtent + mainAxisSpacing;
      crossAxisStride = childCrossAxisExtent + crossAxisSpacing;
    }
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: mainAxisStride,
      crossAxisStride: crossAxisStride,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(ResponsiveGridDelegate oldDelegate) {
    return oldDelegate.crossAxisExtent != crossAxisExtent ||
        oldDelegate.maxCrossAxisExtent != maxCrossAxisExtent ||
        oldDelegate.minCrossAxisExtent != minCrossAxisExtent ||
        oldDelegate.mainAxisSpacing != mainAxisSpacing ||
        oldDelegate.crossAxisSpacing != crossAxisSpacing ||
        oldDelegate.childAspectRatio != childAspectRatio;
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
