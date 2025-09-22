import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_bloc/dog_screen/cubit/dog_cubit.dart';

class DogScreen extends StatefulWidget {
  const DogScreen({super.key});

  @override
  State<DogScreen> createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = DogCubit();
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<DogCubit, DogState>(
              bloc: cubit,
              builder: (context, state) {
                if(state is Loading){
                  return Center(child: CircularProgressIndicator());
                }else if (state is Success){
                  return Expanded(
                    child: ReorderableListView.builder(
                      itemBuilder: (context,index) {
                        final item = state.imageUrl[index];
                        return Image.network(
                            item,
                            key: ValueKey(item),
                            fit: BoxFit.fitWidth,
                            height: 100,
                            width: double.infinity);
                      },
                      itemCount: state.imageUrl.length,
                      onReorder: (oldIndex, newIndex){
                        if(oldIndex < newIndex){
                          newIndex -=1;
                        }
                        final updateList = List<String>.from(state.imageUrl);
                        final item = updateList.removeAt(oldIndex);
                        updateList.insert(newIndex, item);
                        cubit.updateList(updateList);
                      },
                    ),

                  );
                }
                return SizedBox(); 
              }
            ),
            ElevatedButton(
                onPressed: (){
                  cubit.requestDog();
                }
                , child: Text('Random Dog'))
          ],
        ),
      ),
    );
  }
}