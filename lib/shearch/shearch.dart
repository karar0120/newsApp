import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newssapp/componats/fild.dart';
import 'package:newssapp/cubit/cubit.dart';
import 'package:newssapp/cubit/states.dart';

class SearchScrean extends StatelessWidget {
   @override
   var searchcontroller=TextEditingController();
   Widget build(BuildContext context) {
     return BlocConsumer<newscubit,newsappState>(
       listener: (context,state){},
       builder: (context, state){
         var cubit=newscubit.get(context).Search;
         return Scaffold(
           appBar: AppBar(),
           body: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: formfild(
                     inChange: (value){
                      newscubit.get(context).getdateSearch(value);
                     },
                     controller: searchcontroller,
                     Text: "Search",
                     valudat: (value){
                       if (value.isEmpty){
                         return "Search must be not empty";
                       }
                       return null;
                     },
                     Iconsss:Icons.search,
                     Keybord: TextInputType.text),
               ),
               Expanded(child: NewsItem(cubit,context)),
             ],
           ),
         );
       },
     );
   }
 }
