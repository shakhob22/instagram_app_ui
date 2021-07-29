import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app_ui/model/post_model.dart';
import 'package:instagram_app_ui/model/story_model.dart';
import 'package:fluttericon/linecons_icons.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
  ];

  List<Post> _posts = [
    Post(
        "Brianne",
        "assets/images/user_1.jpeg",
        "assets/images/feed_1.jpeg",
        "Consequatur nihil aliquid omnis consequatur."),
    Post(
        "Henri",
        "assets/images/user_2.jpeg",
        "assets/images/feed_2.jpeg",
        "Consequatur nihil aliquid omnis consequatur."),
    Post(
        "Mariano",
        "assets/images/user_3.jpeg",
        "assets/images/feed_3.jpeg",
        "Consequatur nihil aliquid omnis consequatur."),
  ];

  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),

            // #Stories #WatchAll
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Stories', style: TextStyle(color: Colors.grey, fontSize: 14),),
                  Text('Watch All', style: TextStyle(color: Colors.grey, fontSize: 14),)
                ],
              ),
            ),

            // #Stories
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                children: _stories.map((story) {
                  return _itemOfStory(story);
                }).toList(),
              ),
            ),

            // #PostList
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i) {
                    return _itemOfPost(_posts[i]);
                  }),
            ),

          ],
        ),
      ),
    );
  }

  Widget _itemOfStory(Story story){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              color: Colors.purple,
              width: 3
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                fit: BoxFit.cover,
                height: 70,
                width: 70,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(story.name, style: TextStyle(color: darkMode ? Colors.grey : Colors.black),)
      ],
    );
  }

  Widget _itemOfPost(Post post){
    return Container(
      child: Column(
        children: [
          // #avatar
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(post.username, style: TextStyle(color: darkMode ? Colors.grey : Colors.black),),
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz,color: darkMode ? Colors.grey : Colors.black,),),
              ],
            ),
          ),
          // #postImage
          FadeInImage(
            width: MediaQuery.of(context).size.width,
            placeholder: AssetImage('assets/images/placeholder.png'),
            image: AssetImage(post.postImage),
          ),
          // #buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){},
                      icon: Icon(Linecons.heart, color: darkMode ? Colors.grey : Colors.black,)
                  ),
                  IconButton(onPressed: (){},
                      icon: Icon(Linecons.comment, color: darkMode ? Colors.grey : Colors.black,)
                  ),
                  IconButton(onPressed: (){},
                      icon: Icon(Linecons.paper_plane, color: darkMode ? Colors.grey : Colors.black,)
                  ),
                ],
              ),
              IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bookmark, color: darkMode ? Colors.grey : Colors.black,))
            ],
          ),
          // #tags
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            width: double.infinity,
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Liked By ",
                      style: TextStyle(color: darkMode ? Colors.grey : Colors.black),
                    ),
                    TextSpan(
                      text: "Sigmund,",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: darkMode ? Colors.white : Colors.black),
                    ),
                    TextSpan(
                      text: " Yessenia,",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: darkMode ? Colors.white : Colors.black),
                    ),
                    TextSpan(
                      text: " Dayana",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: darkMode ? Colors.white : Colors.black),
                    ),
                    TextSpan(
                      text: " and",
                      style: TextStyle(
                        color: darkMode ? Colors.grey : Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: " 1263 others",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: darkMode ? Colors.white : Colors.black),
                    ),
                  ]
              ),
            ),
          ),
          // #caption
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: RichText(
              overflow: TextOverflow.visible,
              softWrap: true,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.username,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkMode ? Colors.white : Colors.black),
                  ),
                  TextSpan(
                    text: ' ${post.caption}',
                    style: TextStyle(
                        color: darkMode ? Colors.grey : Colors.black
                    ),
                  )
                ]
              ),
            ),
          ),
          // #postdate
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              'Febuary 2020', style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }

}
























