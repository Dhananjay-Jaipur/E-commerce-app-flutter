
class user{
  static String Username = "user";
  static String email = "some@email.com";
  static String password = "12345678";
  static String phone_number = "8912345678";
  static String profile_picture = "https://avatar.iran.liara.run/public/boy?username=Ash";


  toJson(){
    return{
      'Username': Username,
      'email': email,
      'password': password,
      'phone_number': phone_number,
      'profile_picture': profile_picture,
    };
  }

}