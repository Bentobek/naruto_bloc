
import 'package:flutter/material.dart';
import 'package:naruto_bloc/model/akatsuki/akatsuki_model.dart';

class AkatsukiItem extends StatelessWidget {
  final AkatsukiModel item;

  const AkatsukiItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ],
      );
      });
  }
}
