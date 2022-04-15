import 'dart:ui';

import 'package:flavorsmoduleexample/common/constants.dart';
import 'package:flavorsmoduleexample/models/songs_model.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  bool? isPaidMember;
  HomePage({Key? key, required this.isPaidMember}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey _one = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ShowCaseWidget.of(context)?.startShowCase([_one]);
    });
  }

  List<SongsModel> songList = [
    SongsModel(
        name: "Shape of you",
        desc: "Shape of you...",
        image: "assets/thumbnail1.jpg",
        isFav: false),
    SongsModel(
        name: "Girls like you",
        desc: "Girls like you...",
        image: "assets/thumbnail3.jpg",
        isFav: false),
    SongsModel(
        name: "Havan",
        desc: "Havana, ooh na-na...",
        image: "assets/thumbnail2.jpg",
        isFav: false),
    SongsModel(
        name: "Swalla",
        desc: "Love in a thousand...",
        image: "assets/thumbnail4.jpg",
        isFav: false),
    SongsModel(
        name: "I don't wanna love...",
        desc: "I used to love these...",
        image: "assets/thumbnail5.jpg",
        isFav: false),
    SongsModel(
        name: "What do you mean",
        desc: "What do you mean...",
        image: "assets/thumbnail6.jpg",
        isFav: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: headerBody(),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFF1E2F3D),
                    const Color(0xFF5B166F),
                    const Color(0xFF83237F),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 0.7, 1.0],
                  tileMode: TileMode.decal),
            ),
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height / 3,
            child: ListView.builder(
                itemCount: songList.length,
                itemBuilder: (context, index) {
                  return songListTile(index);
                }),
          )
        ],
      ),
    );
  }

  Widget headerBody() {
    return Stack(
      children: [
        Image.asset(
          HOME_HEADER_IMAGE,
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                HOME_HEADING,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              Text(
                HOME_SUB_HEADING,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.play_circle,
                      color: Colors.red,
                      size: 45,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget songListTile(int index) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 18, left: 18),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  songList[index].image.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    songList[index].name.toString(),
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      Icon(Icons.closed_caption, color: Colors.grey),
                      Text(
                        songList[index].desc.toString(),
                        softWrap: true,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.thumb_up_outlined,
                color: Colors.white,
                semanticLabel: SEMANTIC_FAV_LABEL,
              ),
            ),
            Showcase(
              key: _one,
              description: widget.isPaidMember as bool
                  ? HOME_PAID_DESCRIPTION
                  : HOME_UNPAID_DESCRIPTION,
              child: Icon(
                Icons.download_outlined,
                color: Colors.white
                    .withOpacity(widget.isPaidMember as bool ? 1 : 0.2),
                semanticLabel: SEMANTIC_DOWNLOAD_LABEL,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  semanticLabel: SEMANTIC_MORE_LABEL,
                )),
          ],
        ),
      ),
    );
  }
}
