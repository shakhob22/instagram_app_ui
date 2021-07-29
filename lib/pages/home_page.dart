import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'feed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  int currentPage = 0;
  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: darkMode ? Colors.black : Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.camera_alt_outlined, color: darkMode ? Colors.grey :Colors.black,),
        ),
         title: Text('Instagram', style: TextStyle(color: darkMode ? Colors.grey :Colors.black),),

        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.live_tv, color: darkMode ? Colors.grey :Colors.black,),
          ),

          IconButton(
            onPressed: (){},
            icon: Icon(Linecons.paper_plane, color: darkMode ? Colors.grey :Colors.black,),
          ),
        ],
      ),

      body: _pages[currentPage],

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentPage,
        onTap: (i){
          setState(() {
            currentPage = i;
          });
        },

        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Upload'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Likes'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Account'
          ),
        ],
      ),
    );
  }
}
