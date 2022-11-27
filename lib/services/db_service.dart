import 'package:hive_flutter/hive_flutter.dart';

import '../model/user_model.dart';

class HiveDB{
var box = Hive.box("nem_nig");

void saveUser(User user){
  box.put("user", user.toMap());
}

User getUser(){
   return User.fromJson(box.get("user"));
}

void delateUser(){
  box.delete('user');
}


}