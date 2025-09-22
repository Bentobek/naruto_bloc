import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:naruto_bloc/dog_screen/api/api_service.dart';

part 'dog_state.dart';

class DogCubit extends Cubit<DogState> {
  DogCubit() : super(DogInitial());
  List<String> imageUrl = [];

  void requestDog() async {
    emit(Loading());

    final api = ApiService();
    final response = await api.getDog();

    if(response == 'Failed to load items'){
      emit(Error());
    }else {
      imageUrl.add(response);
      emit(Success(imageUrl: imageUrl)
      );
    }
  }
  void deleteDog(int index){
    imageUrl.removeAt(index);
    emit(Success(imageUrl: imageUrl));
  }
  void updateList(List<String> list){
      imageUrl = list;
      emit(Success(imageUrl: imageUrl));
  }
}
