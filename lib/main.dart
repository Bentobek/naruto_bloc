import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:naruto_bloc/dog_screen/screens/dog_screen.dart';
import 'package:naruto_bloc/screens/home_screen.dart';

import 'model/characters/characters_model.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CharactersModelAdapter());
  Hive.registerAdapter(DebutAdapter());
  Hive.registerAdapter(FamilyAdapter());


    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));
}

