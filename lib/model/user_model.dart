class User{
  String? email;
  String? parol;

   User({this.email,this.parol});

   User.fromJson(Map json){  // json = {"email":"husan@gmail.com","parol":"husan2005"}
    email = json['email'];
    parol = json['parol'];
   }

   Map toMap(){
   return {
     "email":email,
     "parol":parol
   };
   }

}