import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_bloc/app_theme/app_colors.dart';
import 'package:naruto_bloc/app_theme/app_dimens.dart';
import 'package:naruto_bloc/app_theme/app_text_style.dart';
import 'package:naruto_bloc/bloc/characters_bloc/characters_bloc.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Success) {
          final list = state.list;
          return ListView.builder(
            padding: const EdgeInsets.all(AppDimens.d16),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];

              return Card(
                margin: EdgeInsets.only(bottom: AppDimens.d16),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.d16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.images.isNotEmpty)
                        Image.network(
                          item.images.first,
                          height: AppDimens.imageHeight,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      else
                        Container(
                          height: AppDimens.imageHeight,
                          width: double.infinity,
                          color: AppColors.grey,
                          child: const Icon(
                              Icons.person,
                              size: AppDimens.d80,
                              color:  AppColors.grey
                          ),
                        ),
                      const SizedBox(height: AppDimens.d12),

                      Text(
                        item.name,
                        style:AppTextStyles.title
                      ),
                      const SizedBox(height: AppDimens.d12),


                      Text('Debut:', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Manga: ${item.debut?.manga}'),
                      Text('Anime: ${item.debut?.anime}'),
                      Text('Novel: ${item.debut?.novel}'),
                      Text('Movie: ${item.debut?.movie}'),
                      Text('Game: ${item.debut?.game}'),
                      Text('OVA: ${item.debut?.ova}'),
                      const SizedBox(height: AppDimens.d12),

                      Text('Jutsu:', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('- ${item.jutsu!.first}'),

                      if (item.family != null) ...[
                        Text('Family:', style: TextStyle(fontWeight: FontWeight.bold)),
                        if (item.family!.father != null) Text('Father: ${item.family!.father}'),
                        if (item.family!.mother != null) Text('Mother: ${item.family!.mother}'),
                        if (item.family!.son != null) Text('Son: ${item.family!.son}'),
                        if (item.family!.daughter != null) Text('Daughter: ${item.family!.daughter}'),
                        if (item.family!.wife != null) Text('Wife: ${item.family!.wife}'),
                        if (item.family!.adoptiveSon != null) Text('Adoptive Son: ${item.family!.adoptiveSon}'),
                        if (item.family!.godfather != null) Text('Godfather: ${item.family!.godfather}'),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is CharactersError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}


