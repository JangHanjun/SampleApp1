import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'example.dart';



final List<String> imgList = [
  'https://cdn.pixabay.com/photo/2020/01/16/17/21/pantheon-4771206_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/06/28/16/04/alpine-5349811_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/06/14/10/50/prague-5297386_960_720.jpg',
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // 이거 없으면 drawer 위에 흰색 칸이 남음. 그러니 패딩으로 없애자
          children: <Widget>[
            DrawerHeader(
              child: Text('HeadTitle'),
              decoration: BoxDecoration( // Drawer 헤드 색상 지정
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ExamplePage()
                  )
                );
                //Navigator.pop(context);
                //를 넣으면 네비게이션이 닫히면서 위에 기능이 나옴
              },
            ),
            ListTile(
                title: Text('Item 2'),
                onTap:(){

                }
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text('Title'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(), //팅기는 효과

        children: <Widget>[
          Container(
            height: 280,
            child: Padding(
              padding: EdgeInsets.all(10),

              child: Swiper(
                autoplay: true, //이미지 자동으로 스와이프
                scale: 0.85, //양 옆의 이미지 보이는 크기  0.8이하는 잘 안보임
                viewportFraction: 0.8, //카메라 포인트 = 이미지 크기, 이 이상 넘어가면 너무 큼
                pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter
                ),
                // control: SwiperControl(), //이미지 컨트롤을 위한 버튼
                itemCount: imgList.length, //이미지 갯수를 받아와야함
                itemBuilder: (BuildContext context, int index){
                  return Image.network(imgList[index]);
                },
              ),
            ),
          ),

          Container(
            height: 300,
            color: Colors.blue,
            margin: EdgeInsets.all(15),
            //padding: EdgeInsets.all(20),
          ),
          Container(
            height: 300,
            color: Colors.redAccent,
            margin: EdgeInsets.all(15),
            //padding: EdgeInsets.all(20),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.apps),
              title: new Text('카테고리'),
            ),

            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: new Text('홈'),
            ),

            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              title: new Text('내 정보'),
            ),
          ]

      ),
    );
  }
}