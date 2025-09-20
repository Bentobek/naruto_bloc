import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_bloc/api/api_characters/api_service_characters.dart';
import 'package:naruto_bloc/app_theme/app_dimens.dart';
import 'package:naruto_bloc/app_theme/app_text_style.dart';
import 'package:naruto_bloc/bloc/characters_bloc/characters_bloc.dart';
import 'package:naruto_bloc/storage/hive/hive_helper.dart';

import 'widget/characters_item.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersBloc(
        hiveHelper: HiveHelper(),
        apiService: ApiServiceCharacters(),
      )..add(GetCharactersEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Characters')),
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(AppDimens.d8),
                child: Text(
                  'Characters List',
                  style: AppTextStyles.body,
                ),
              ),
              const Expanded(
                child: CharacterItem(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



