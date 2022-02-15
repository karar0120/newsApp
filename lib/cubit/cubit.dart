

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newssapp/cubit/states.dart';
import 'package:newssapp/module/business/business.dart';
import 'package:newssapp/module/science/science.dart';
import 'package:newssapp/module/sport/sports.dart';
import 'package:newssapp/shared/remote/dio.dart';


class newscubit extends Cubit<newsappState>{
  newscubit() : super(initialState());

  static newscubit get(context)=>BlocProvider.of(context);


  List <String>Appbartitle=[
    "Business",
    "Sport",
    "Science",
  ] ;
    List<Widget>Body=[
      business(),
      sports(),
      science(),
    ];
  int currnetindex=0;
  void changenumber(index){
      currnetindex=index;
      emit(changebottonnavigationbar());
    }

    List<dynamic>Business=[];
  void getbesinessNews(){
    emit(NewsGetbusinesloadingstatue());
    DioHelper.getdate(
        url:"v2/top-headlines",//
        Quires:{'country':'us',
          'category':'business',
          "apiKey":"5d7709efd89f43389f692a07a9a3be1a"}).then(
            (value){
              Business=value.data['articles'];
              print (Business[0]['title']);
              emit(NewsGetbusinesSuccessstatue());
            }).catchError((error){
       print (error.toString());
       emit(NewsGetbusinesErrorstatue(error));
    });
  }
  List<dynamic>Sport=[];
  void getdateSport(){
    emit (NewsGetSportsloadingstatue());
    DioHelper.getdate(
        url:"v2/top-headlines",
        Quires: {'country':'us',
          'category':'sports',
          "apiKey":"5d7709efd89f43389f692a07a9a3be1a"}
    ).then((value){
      Sport=value.data['articles'];
      //print (date)
      emit (NewsGetSportsSuccessstatue());
    }).catchError((error){
      print (error.toString());
      emit(NewsGetSportsErrorstatue(error));
    });
  }
  List<dynamic>Science=[];
  void getdateScience() {
    emit(NewsGetScienceloadingstatue());
    DioHelper.getdate(
        url: "v2/top-headlines",
        Quires: {'country': 'us',
          'category': 'science',
          "apiKey": "5d7709efd89f43389f692a07a9a3be1a"}
    ).then((value) {
      Science = value.data['articles'];
      //print (date)
      emit(NewsGetScienceSuccessstatue());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorstatue(error));
    });
  }

  List<dynamic>Search=[];
  void getdateSearch(String value) {
    emit(NewsGetSearchloadingstatue());
    //Search=[];
    DioHelper.getdate(
        url: "v2/everything",
        Quires: {
          'q': '$value',
          "apiKey": "5d7709efd89f43389f692a07a9a3be1a"}
    ).then((value) {
      Search = value.data['articles'];
      //print (date)
      emit(NewsGetSearchSuccessstatue());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorstatue(error));
    });
  }

}
//https://newsapi.org/?q=tesla&from=2022-01-13&sortBy=publishedAt&apiKey=5d7709efd89f43389f692a07a9a3be1a