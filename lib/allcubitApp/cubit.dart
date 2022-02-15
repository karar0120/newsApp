
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newssapp/allcubitApp/state.dart';
import 'package:newssapp/shared/remote/sharedPref/sheredperf.dart';
class Allappcubit extends Cubit<allappstate>{
  Allappcubit() : super(initialState());

  static Allappcubit get(context)=>BlocProvider.of(context);


  bool isdark=false;
  void changemodae({bool? formshared}){

    if (formshared!=null){
      isdark=formshared;
      emit(changemodastate());
    }
    else {
      isdark=!isdark;
      sharedpref.putshered(Key: "IsDark", value: isdark).then((value){
        emit(changemodastate());
      });
    }



  }
}