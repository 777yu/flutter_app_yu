import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('菜品介绍')),
        body: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                  child:Container(
                    width: 200,
                    child: leftColumn,
                )
              ),
              Expanded(
                flex: 1,
                  child: Container(
                    width: 100,
                    child: Center(
                      child:  Image.asset('images/haizei.jpg', fit: BoxFit.fill),
                    )
                 )
              )
            ],
          ),
        ));
  }
}

//定义左边的文字布局
Widget leftColumn = Container(
  width: 200,
  padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
  child: Column(
    children: <Widget>[
      titleText, //标题界面
      subTitle, //副标题
      ratings, //投票
      iconList //小图标行
    ],
  ),
);

Widget titleText = Container(
    child: Center(
  child: Text('请你品尝小吃'),
));

Widget subTitle = Container(
  child: Center(
    child: Text('哈回复哈回复哈发货'),
  ),
);

Widget ratings = Container(
  padding: EdgeInsets.all(20.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min, //mainAxisSize，可压缩或伸长行内控件的间距
        children: <Widget>[
          Icon(
            Icons.star,
            color: Colors.black,
          ),
          Icon(
            Icons.star,
            color: Colors.black,
          ),
          Icon(
            Icons.star,
            color: Colors.black,
          ),
          Icon(
            Icons.star,
            color: Colors.black,
          ),
          Icon(
            Icons.star,
            color: Colors.black,
          )
        ],
      ),
      Text(
        '170 Revi',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 10.0),
      )
    ],
  ),
);

Widget iconList = Container(
  padding: EdgeInsets.all(20.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Column(children: <Widget>[
        Icon(
          Icons.kitchen,
          color: Colors.green[500],
        ),
        Text("PREP"),
        Text("25 min")
      ]),
      Column(children: <Widget>[
        Icon(
          Icons.timer,
          color: Colors.green[500],
        ),
        Text("COOK"),
        Text("1  h")
      ]),
      Column(children: <Widget>[
        Icon(
          Icons.restaurant,
          color: Colors.green[500],
        ),
        Text("FEEDS"),
        Text("4-6")
      ])
    ],
  ),
);
