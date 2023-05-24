

import 'package:flutter/material.dart';
import 'package:sky_scrapper/view/screen/home_page.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => home_page(),
      },
    ),
  );
}



