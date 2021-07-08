import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gamebutton{
  final id;
  String text;
  Color bg;
  bool enable;
  Gamebutton({required this.id,this.text="",this.bg= Colors.grey, this.enable=true});

}