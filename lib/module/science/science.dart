

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newssapp/componats/fild.dart';
import 'package:newssapp/cubit/cubit.dart';
import 'package:newssapp/cubit/states.dart';

class science extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscubit,newsappState>(
      listener:(context,state){} ,
      builder: (context,state){
        var cubit =newscubit.get(context);
        var list =cubit.Science;
        return NewsItem(list,context);
      },
    );
  }
}