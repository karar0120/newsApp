

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newssapp/allcubitApp/cubit.dart';
import 'package:newssapp/componats/fild.dart';
import 'package:newssapp/cubit/cubit.dart';
import 'package:newssapp/cubit/states.dart';
import 'package:newssapp/shearch/shearch.dart';

class newsApplayout extends StatelessWidget {
  @override

 // var cubit =newscubit.get();
  Widget build(BuildContext context) {
    return BlocConsumer<newscubit,newsappState>(
      listener: (context,state){},
      builder:(context,state){
        var cubit =newscubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.Appbartitle[cubit.currnetindex]),
            actions: [
              IconButton(
                  onPressed:(){
                    navigatto(context,SearchScrean());
                  },
                  icon: (Icon(Icons.search)),
              ),
              IconButton(
                  onPressed: (){
                    Allappcubit.get(context).changemodae();
                  },
                  icon: Icon(Icons.brightness_4_outlined))
            ],
          ),
          body:cubit.Body[cubit.currnetindex] ,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:cubit.currnetindex ,
            onTap: (index){
              cubit.changenumber(index);
            },
            items: [
              BottomNavigationBarItem(
                icon:Icon(Icons.business),
                label: "Business",
              ),
              BottomNavigationBarItem(

                icon:Icon(Icons.sports),
                label: "Sports",
              ),
              BottomNavigationBarItem(
                icon:Icon(Icons.science),
                label: "Science",
              ),
            ],
          ),

        );
      } ,
    );

  }
}

