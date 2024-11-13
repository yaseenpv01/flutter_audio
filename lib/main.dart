import 'package:flutter/material.dart';
import 'package:flutter_audio_app/bloc/audio_bloc.dart';
import 'package:flutter_audio_app/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Music Player',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => AudioBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
 