import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodapi/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Meals DB"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: const <Widget>[
                      Text("Discover"),
                    ],
                  ),
                ),
                Container(
                  child: FutureBuilder(
                    future: Services.getResponse(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if(snapshot.hasData){
                        List a = jsonDecode(snapshot.data)['meals'];
                        return Container(
                          height: 300.0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: a.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 300.0,
                                  child: Column(
                                    children: [
                                      Image(
                                          width: 200.0,
                                          height: 200.0,
                                          image: NetworkImage("${a[index]['strMealThumb']}") ),
                                      Text("${a[index]['strMeal']}"),
                                    ],
                                  ),
                                );
                              }),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                Container(
                  child: FutureBuilder(
                    future: Categories.getResponse(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if(snapshot.hasData){
                        List a = jsonDecode(snapshot.data)['meals'];
                        return Container(
                          height: 300.0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: a.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 300.0,
                                  child: Column(
                                    children: [
                                      Image(
                                          width: 200.0,
                                          height: 200.0,
                                          image: NetworkImage("${a[index]['strMealThumb']}") ),
                                      Text("${a[index]['strMeal']}"),
                                    ],
                                  ),
                                );
                              }),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                Container(
                  child: FutureBuilder(
                    future: SeaFood.getResponse(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if(snapshot.hasData){
                        List a = jsonDecode(snapshot.data)['meals'];
                        return Container(
                          height: 300.0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: a.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 300.0,
                                  child: Column(
                                    children: [
                                      Image(
                                          width: 200.0,
                                          height: 200.0,
                                          image: NetworkImage("${a[index]['strMealThumb']}")),
                                      Text("${a[index]['strMeal']}"),
                                    ],
                                  ),
                                );
                              }),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          )
    )
    );
  }
}
