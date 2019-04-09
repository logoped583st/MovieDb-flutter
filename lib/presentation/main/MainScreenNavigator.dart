import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logopeds_movies/presentation/authorization/AuthWidget.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesWidget.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenNavigator createState() {
    return new MainScreenNavigator();
  }
}

class MainScreenNavigator extends State<MainScreen> {
  final List<Widget> _children = [
    PopularMoviesPage(),
    MyHomePage(),
  ];

  int _tabSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _children[_tabSelected],
      bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.black))),
          child: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _tabSelected,
            items: [
              BottomNavigationBarItem(
                  title: Text("test"), icon: Icon(Icons.add)),
              BottomNavigationBarItem(
                  title: Text("test"), icon: Icon(Icons.add))
            ],
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.redAccent,
          )),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _tabSelected = index;
      debugPrint("TAB: $_tabSelected");
    });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
