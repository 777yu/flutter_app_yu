import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _Imageurls=[
    'http://pic1.win4000.com/wallpaper/f/585a18e6a793c.jpg',
    'http://ww1.sinaimg.cn/large/abde6512jw1ez9v8343q8j20zk0k0tg2.jpg',
    'http://img.wan.renren.com/images/2013/0307/thumb_900__1362640348632.jpg',
    'http://images.ccoo.cn/ablum/20110620/20110620102934235.jpg'
  ];
  double  appBarAlpha = 0;
  _onScroll(offset){
    double alpha = offset/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha = 0;
    }else if(alpha>1){
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('轮播组件'),
//      ),
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              context: context,
              removeTop: true, //移除上面的安全区域

              child: NotificationListener(
                onNotification: (scrollNotification){
                  if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth==0){
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                  return true;
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 200,
                      child: Swiper(
                        itemCount: _Imageurls.length,//个数
                        autoplay: true,//自动播放
                        itemBuilder: (BuildContext context,int index){
                          return Image.network(
                              _Imageurls[index],
                              fit: BoxFit.fill
                          );
                        },
                        pagination: SwiperPagination(),//(分页指示器)下面的点
                        duration: 400,//滚动速度
                      ),
                    ),
                    Container(
                      height: 1000,
                      child: ListTile(
                        title: Text('haha'),
                      ),
                    )
                  ],
                ),
              )
          ),
         Opacity(
             opacity: appBarAlpha,
              child: Container(
                height: 80,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('首页'),
                  ),
                ),
              ),
         )
        ],
      )
    );
  }
}
