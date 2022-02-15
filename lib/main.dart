import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newssapp/allcubitApp/cubit.dart';
import 'package:newssapp/allcubitApp/state.dart';
import 'package:newssapp/cubit/cubit.dart';
import 'package:newssapp/cubit/states.dart';
import 'package:newssapp/layout/home%20layout.dart';
import 'package:newssapp/shared/remote/dio.dart';
import 'package:newssapp/shared/remote/sharedPref/sheredperf.dart';
import 'componats/Bloc.observer.dart';
void main() async{
  BlocOverrides.runZoned(
        () async {
          WidgetsFlutterBinding.ensureInitialized();
          DioHelper.init();
          await sharedpref.init();
          bool? isDark=sharedpref.getshered(Key: 'IsDark');
          runApp(MyApp(isDark));

    },
    blocObserver:MyBlocObserver() ,
  );
}
class MyApp extends StatelessWidget {

  final bool ?isDark;
  MyApp(this.isDark);
  // ignore: non_constant_identifier_names
  //a MyApp({Key? key, this.isDark}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=>newscubit()..getbesinessNews()..getdateSport()..getdateScience()),
        BlocProvider(create: (context)=>Allappcubit()..changemodae(formshared: isDark)),
      ],
      child: BlocConsumer<Allappcubit,allappstate>(
      listener: (context,state){},
        builder: (context,state){
        var cubit=Allappcubit.get(context);
        return MaterialApp(
      //title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorLight: Colors.deepOrange,
        //backgroundColor: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor:Colors.white,
        appBarTheme: AppBarTheme(
          // notifacation colors//
          // ignore: deprecated_member_use
            backwardsCompatibility: false,
            titleSpacing: 20.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            )
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type:BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            elevation: 20.0,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: HexColor('333739')),
        ),
      ),
      darkTheme: ThemeData(
          primaryColor: Colors.deepOrange,
          scaffoldBackgroundColor:HexColor("333739"),
          appBarTheme: AppBarTheme(
            // notifacation colors//
            // ignore: deprecated_member_use
              backwardsCompatibility: false,
              titleSpacing: 20.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: HexColor("333739"),
                statusBarIconBrightness: Brightness.light,
              ),
              backgroundColor: HexColor("333739"),
              elevation: 0.0,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              )
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type:BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              elevation: 20.0,
              backgroundColor: HexColor("333739"),
              unselectedItemColor: Colors.grey
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepOrange
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        primaryColorDark: Colors.deepOrange
      ),
      themeMode: cubit.isdark?ThemeMode.dark:ThemeMode.light,
      home:newsApplayout(),
        );
        },
      ),
    );
  }
}
