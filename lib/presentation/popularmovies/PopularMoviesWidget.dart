import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PopularMoviesPage extends StatefulWidget {
  @override
  PopularMoviesWidget createState() {
    return new PopularMoviesWidget();
  }
}

class PopularMoviesWidget extends State<PopularMoviesPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: new Theme(
            data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: Colors.white,
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(caption: new TextStyle(color: Colors.black))),
            child: BottomNavigationBar(
              currentIndex: 1,
              items: [
                BottomNavigationBarItem(
                    title: Text("test"), icon: Icon(Icons.add)),
                BottomNavigationBarItem(
                    title: Text("test"), icon: Icon(Icons.add))
              ],
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.redAccent,
            )));
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
