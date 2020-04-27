// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Tyles(),
    );
  }
}

class Tyles extends StatefulWidget {
  @override
  TylesState createState() => TylesState();
  
}


class TylesState extends State<Tyles> {
  static final _boxSize = const Size(100.0, 100.0);
  final _boxes = [
    1,
    1,
    4,
    4,
    4,
    4,
    1,
    1,
  ];

  final _scaleFactor = 1 / sqrt((1 + sqrt(5)) / 2);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _boxes.length,
        itemBuilder: (_, i) {
          return (_boxes[i] == 1)? Row(
            children: <Widget>[
              Box(width: _boxSize.width, height: _boxSize.height,),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ) : 
          Box4(width: _boxSize.width * _scaleFactor, height: _boxSize.height * _scaleFactor,);
        },
        addAutomaticKeepAlives: true,
      ),
    
    );
  }



}

class Box extends StatefulWidget {
  double _width, _height;
  Box({width, height}) {
    _width = width;
    _height = height;
  }
  BoxState createState() => BoxState();
}

class BoxState extends State<Box>  with AutomaticKeepAliveClientMixin{
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => _active = !_active),
      child: Container(
        width: widget._width, 
          height: widget._height, 
          decoration: BoxDecoration(
            border: Border.all(
              width: 3.0,
              color: Colors.green,
            ), 
            borderRadius: BorderRadius.all(Radius.circular(5.0)), 
            color: _active ? Colors.green : null,
            
          ),
          margin: const EdgeInsets.all(3.0),
        ),
    );
  }

  @override
  bool get wantKeepAlive => true;
  
}

class Box4 extends StatefulWidget {
  double _width, _height;
  Box4({width, height}) {
    _width = width;
    _height = height;
  }
  Box4State createState() => Box4State();
}

class Box4State extends State<Box4> {
  @override
  Widget build(BuildContext context) => Row(
    children: <Widget>[
      Column(
        children: <Widget>[
          Box(width: widget._width, height: widget._height,),
          Box(width: widget._width, height: widget._height,),
        ],
      ),
      Column(
        children: <Widget>[
          Box(width: widget._width, height: widget._height,),
          Box(width: widget._width, height: widget._height,),
        ],
      ),
    ],
    mainAxisAlignment: MainAxisAlignment.center,
  );

    
  
}