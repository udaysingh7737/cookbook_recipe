
class UserDetail{

  final String email;
  final String uid;
  UserDetail({this.uid,this.email});

  Future UserData()async{
    print(email);
    print(uid);
  }
}