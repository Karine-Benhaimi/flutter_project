class User
{
  final String email;
  final String f_name;
  final String isAdmin;


  User(this.email,this.f_name,this.isAdmin);

  factory User.fromJson(Map<String,dynamic> json ){
    return User(
      json['email'],
      json['fullname'],
      json['isAdmin'],
    );
  }
}