import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesWidget.dart';
import 'package:logopeds_movies/presentation/main/topratedmovies/TopRatedMoviesWidget.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenNavigator createState() {
    return new MainScreenNavigator();
  }
}

class MainScreenNavigator extends State<MainScreen> {
  final List<Widget> _children = [
    PopularMoviesPage(),
    TopRatedMoviesPage(),
  ];

  final List<String> _titles = [
    "Popular",
    "Top Rated",
  ];

  int _tabSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_tabSelected]),
      ),
      body: _children[_tabSelected],
      bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.black))),
          child: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _tabSelected,
            items: [
              BottomNavigationBarItem(
                  title: Text("Popular"), icon: Icon(Icons.cake)),
              BottomNavigationBarItem(
                  title: Text("Top Rated"), icon: Icon(Icons.grade))
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
