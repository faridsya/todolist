library config.globals;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


String gPesanEror = "Terjadi Kesalahan";


String vTokenJwt="";
InputBorder gsetBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color:  Colors.black12,
    ),
  );
}
