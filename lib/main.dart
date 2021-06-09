import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(SlivertinoHome());
}

class SlivertinoHome extends StatelessWidget {
  const SlivertinoHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Slivertino",
      home: _SlivertinoApp(),
    );
  }
}

class _SlivertinoApp extends StatefulWidget {
  const _SlivertinoApp({Key key}) : super(key: key);

  @override
  __SlivertinoAppState createState() => __SlivertinoAppState();
}

class __SlivertinoAppState extends State<_SlivertinoApp> {
  SliverPersistentHeader makeHeader(String headerText, String assetFile) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: _SliverAppBarDelegate(
            minHeight: 60.0,
            maxHeight: 100.0,
            child: Stack(alignment: Alignment.center, children: <Widget>[
              // SizedBox.expand(
              //     child: Image.asset(assetFile, fit: BoxFit.cover,)),
              Container(
                foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(assetFile),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.darken))),
              ),
              Opacity(
                opacity: 0.5,
                child: Text(headerText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Main(context),
      endDrawer: Drawer(),
    );
  }

  Widget Main(BuildContext ctx) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[Body()],
      ),
    );
  }

  Widget Body() {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text('Slivertino'),
            backgroundColor: Colors.red,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/img/index.jpg',
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: Text('Test App'),
            ),
          ),
          makeHeader('Header Section 1', 'assets/img/2.jpg'),
          SliverGrid.count(
            crossAxisCount: 3,
            children: <Widget>[
              Container(color: Colors.red, height: 150.0),
              Container(color: Colors.purple, height: 150.0),
              Container(color: Colors.green, height: 150.0),
              Container(color: Colors.orange, height: 150.0),
              Container(color: Colors.yellow, height: 150.0),
              Container(color: Colors.pink, height: 150.0),
              Container(color: Colors.cyan, height: 150.0),
              Container(color: Colors.indigo, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
            ],
          ),
          makeHeader('Header Section 2', 'assets/img/3.jpg'),
          SliverGrid.count(
            crossAxisCount: 3,
            children: <Widget>[
              Container(color: Colors.red, height: 150.0),
              Container(color: Colors.purple, height: 150.0),
              Container(color: Colors.green, height: 150.0),
              Container(color: Colors.orange, height: 150.0),
              Container(color: Colors.yellow, height: 150.0),
              Container(color: Colors.pink, height: 150.0),
              Container(color: Colors.cyan, height: 150.0),
              Container(color: Colors.indigo, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
            ],
          ),
          makeHeader('Header Section 3', 'assets/img/4.jpg'),
          SliverGrid.count(
            crossAxisCount: 3,
            children: <Widget>[
              Container(color: Colors.red, height: 150.0),
              Container(color: Colors.purple, height: 150.0),
              Container(color: Colors.green, height: 150.0),
              Container(color: Colors.orange, height: 150.0),
              Container(color: Colors.yellow, height: 150.0),
              Container(color: Colors.pink, height: 150.0),
              Container(color: Colors.cyan, height: 150.0),
              Container(color: Colors.indigo, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
            ],
          ),
          makeHeader('Header Section 4', 'assets/img/5.jpg'),
          SliverGrid.count(
            crossAxisCount: 3,
            children: <Widget>[
              Container(color: Colors.red, height: 150.0),
              Container(color: Colors.purple, height: 150.0),
              Container(color: Colors.green, height: 150.0),
              Container(color: Colors.orange, height: 150.0),
              Container(color: Colors.yellow, height: 150.0),
              Container(color: Colors.pink, height: 150.0),
              Container(color: Colors.cyan, height: 150.0),
              Container(color: Colors.indigo, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
            ],
          ),
          makeHeader('Header Section 5', 'assets/img/6.jpg'),
          SliverGrid.count(
            crossAxisCount: 3,
            children: <Widget>[
              Container(color: Colors.red, height: 150.0),
              Container(color: Colors.purple, height: 150.0),
              Container(color: Colors.green, height: 150.0),
              Container(color: Colors.orange, height: 150.0),
              Container(color: Colors.yellow, height: 150.0),
              Container(color: Colors.pink, height: 150.0),
              Container(color: Colors.cyan, height: 150.0),
              Container(color: Colors.indigo, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
            ],
          )
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return minHeight != oldDelegate.minHeight ||
        maxHeight != oldDelegate.maxHeight ||
        child != oldDelegate.child;
  }
}
