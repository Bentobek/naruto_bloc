import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:naruto_bloc/api/api_akatsuki/api_service.dart';
import 'package:naruto_bloc/model/akatsuki/akatsuki_model.dart';
import 'package:naruto_bloc/storage/shared_pref/pref_helper.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<GetAkatsukiEvent>((event, emit) async {
      emit(Loading());
      final response = await ApiService().getAkatsuki();
      if (response.isNotEmpty){
        emit(Success(akatsukiList: response) );
      }
    });
    on<GetDataStorage>((event, emit) async {
      emit(Loading());
      final response = await PrefHelper().loadMyObject();
      if (response.isNotEmpty){
        emit(Success(akatsukiList: response) );
      }
    });
  }
}
