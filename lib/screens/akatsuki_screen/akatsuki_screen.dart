import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_bloc/app_theme/app_colors.dart';
import 'package:naruto_bloc/app_theme/app_dimens.dart';
import 'package:naruto_bloc/app_theme/app_text_style.dart';
import 'package:naruto_bloc/bloc/akatsuki_bloc/api_bloc.dart';

class AkatsukiScreen extends StatelessWidget {
  const AkatsukiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = ApiBloc()..add(GetAkatsukiEvent());

    return Scaffold(
        body: SafeArea(
          child: BlocBuilder<ApiBloc,ApiState>(
            bloc: bloc,
            builder: (context,state){
              if(state is Success){
                final list =  state.akatsukiList;
                return Padding(
                  padding: const EdgeInsets.all(AppDimens.d8),
                  child: ListView.separated(
                    itemBuilder: (context,index){
                      final item = list[index];
                    return Column(
                      children: [
                        Text(
                          item.name,
                          style: AppTextStyles.body,
                        ),
                          Column(
                          children:
                          listImages(item.images),
                          )
                      ],
                    );
                  },itemCount: list.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(thickness: AppDimens.d4,color: AppColors.red,);
                  },
                  ),
                );
              }else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          )
      ),
    );
  }
  List<Widget> listImages (List<String> images) {
    final list = images.map((url) {
      return Image.network(url);
    });
    return list.toList();
  }
}