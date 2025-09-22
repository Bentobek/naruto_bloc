import 'package:cached_network_image/cached_network_image.dart';
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

  Widget _buildImage({required String item,required GlobalKey dragKey}) {
    return LongPressDraggable<String>(
      data: item,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingListItem(
        dragKey: dragKey,
        child: Image.network(item,fit: BoxFit.fitWidth,
            height: 100,
            width: double.infinity),
      ),
      child: Image.network(item,fit: BoxFit.fitWidth,
          height: 100,
          width: double.infinity)
    );
  }
}
class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    super.key,
    required this.dragKey,
    required this.child,
  });

  final GlobalKey dragKey;
  final Widget child ;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Opacity(
            opacity: 0.85,
            child: child,
          ),
        ),
      ),
    );
  }
}

