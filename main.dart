import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      home: new MyHomePage(),
    );
  }
}

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
      appBar: new AppBar(
        title: new Text('Title'),
      ),
      body: Container(
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
      )
    );
  }
}
