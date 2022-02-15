import 'package:shared_preferences/shared_preferences.dart';

class sharedpref{
  static SharedPreferences? sharedPreferences;
  static init() async{
    return sharedPreferences= await SharedPreferences.getInstance();
  }

  static Future<bool> putshered({
  required Key,
    required value,}) async {
   return await sharedPreferences!.setBool(Key, value);
  }

  static bool? getshered({
    required Key})  {
    return  sharedPreferences!.getBool(Key);
  }

}