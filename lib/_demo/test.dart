// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:xml2json/xml2json.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const Test(title: 'Flutter Test Page'),
//     );
//   }
// }
//
//
// class Test extends StatefulWidget {
//   const Test({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//
//
//
//   String text = '';
//
//   List<String> st=[];
//
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
//               Map map = await get();
//
//
//
//               text = map.toString();
//               setState(() {});
//             },
//           ),
//           Text(text),
//         ],
//       ),
//     );
//   }
//
//   Future<Map<String, dynamic>> get() async {
//     Uri uri = Uri.parse(
//         "http://apis.data.go.kr/6410000/busrouteservice/getBusRouteInfoItem"
//             "?serviceKey=%2FCX1Je8srsa%2BN1XFaGPVbiGNqbqECXBdN5MYLSf682mak8Po3%2BewTQAuuqybgT6HGAbdv3RLl0%2FqMi32J%2BPbvg%3D%3D"
//             "&routeId=200000085");
//     // 요청하기
//     final Response response = await http.get(uri);
//
//     // 요청 성공하면 리턴
//     if (response.statusCode == 200) {
//       final getXmlData = response.body; //xml 데이터를 받아온다.
//       final Xml2JsonData = Xml2Json()..parse(getXmlData); //json으로 변환
//       final jsonData = Xml2JsonData.toParker(); //그냥 령식 옵션
//
//       return json.decode(jsonData);
//     } else {
//       throw Exception('Failed to load post');
//     }
//   }
// }
