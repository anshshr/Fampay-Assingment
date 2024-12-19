import 'package:fam_assingment/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Fampay assignment',
    home:  HomePage()
  ));
}
