// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:xml2json/xml2json.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//   Future<Map<String, dynamic>> getBus() async {
//     Uri uri = Uri.parse(
//         "https://apis.data.go.kr/6410000/busarrivalservice/getBusArrivalList?"
//         "serviceKey=%2FCX1Je8srsa%2BN1XFaGPVbiGNqbqECXBdN5MYLSf682mak8Po3%2BewTQAuuqybgT6HGAbdv3RLl0%2FqMi32J%2BPbvg%3D%3D"
//         "&stationId=212000138");
//     // 요청하기
//     final Response response = await http.get(uri);
//
//     // 요청 성공하면 리턴
//     if (response.statusCode == 200) {
//       final getXmlData = response.body; //xml 데이터를 받아온다.
//       //  print(getXmlData); //xml데이터를 잘 받아왔는지 확인.
//       final Xml2JsonData = Xml2Json()..parse(getXmlData); //json으로 변환
//       final jsonData = Xml2JsonData.toParker(); //그냥 령식 옵션
//       // print(jsonData); //json데이터로 잘 변환되었나 확인.
//
//       return json.decode(jsonData);
//     } else {
//       throw Exception('Failed to load post');
//     }
//   }
//
//   List<Widget> widgets = [Container()];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ListView(
//         children: [
//           CupertinoButton(
//             child: Text("새로고침"),
//             onPressed: () async {
//               Map map = await getBus();
//               //print(map);
//               List list = map['response']['msgBody']['busArrivalList'];
//               widgets = [Container()];
//               for (Map map in list) {
//                 print(map);
//                 widgets.add(CardView(map: map));
//               }
//               setState(() {});
//             },
//           ),
//           Center(
//             child: Text(
//               '도당사거리,도당중학교 부천역 방면',
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//           ...widgets,
//           CupertinoButton(
//             child: Text("새로고침"),
//             onPressed: () async {
//               Map map = await getBus();
//               //print(map);
//               List list = map['response']['msgBody']['busArrivalList'];
//               widgets = [Container()];
//               for (Map map in list) {
//                 print(map);
//                 widgets.add(CardView(map: map));
//               }
//               setState(() {});
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<Map<String, dynamic>> get() async {
//     Uri uri = Uri.parse(
//         "https://apis.data.go.kr/6410000/busrouteservice/getBusRouteInfoItem?serviceKey=%2FCX1Je8srsa%2BN1XFaGPVbiGNqbqECXBdN5MYLSf682mak8Po3%2BewTQAuuqybgT6HGAbdv3RLl0%2FqMi32J%2BPbvg%3D%3D&routeId=200000085");
//     // 요청하기
//     final Response response = await http.get(uri);
//
//     // 요청 성공하면 리턴
//     if (response.statusCode == 200) {
//       final getXmlData = response.body; //xml 데이터를 받아온다.
//       print(getXmlData); //xml데이터를 잘 받아왔는지 확인.
//       final Xml2JsonData = Xml2Json()..parse(getXmlData); //json으로 변환
//       final jsonData = Xml2JsonData.toParker(); //그냥 령식 옵션
//       print(jsonData); //json데이터로 잘 변환되었나 확인.
//
//       return json.decode(jsonData);
//     } else {
//       throw Exception('Failed to load post');
//     }
//   }
// }
//
// class CardView extends StatelessWidget {
//   CardView({Key? key, required this.map}) : super(key: key);
//
//   Map map;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           // Row(
//           //   children: [
//           //     //Text('노선 id:'),
//           //     Text(map['routeId']),
//           //   ],
//           // ),
//           Row(
//             children: [
//               Text('${dodangNumber[map['routeId']] ?? 'null'}'),
//             ],
//           ),
//           Row(
//             children: [
//               Text('${map['predictTime1'] ?? 'null'}분 '),
//               Text('(${map['locationNo1'] ?? 'null'}정류장), '),
//               Text('${map['predictTime2'] ?? 'null'}분 '),
//               Text('(${map['locationNo2'] ?? 'null'}정류장)'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// Map dodangNumber = {
//   null: 'null',
//   '210000027': '12',
//   '210000001': '50',
//   '210000003': '50-1',
//   '210000042': '59',
//   '210000069': '59-1',
//   '210000043': '60',
//   '210000034': '70',
//   '210000012': '70-2',
// };
