import 'package:flutter/cupertino.dart';

class UserInfo {
  final String profileImage;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;

 const UserInfo({
    @required this.profileImage,
    @required  this.name,
    @required  this.email,
    @required  this.about,
    @required  this.isDarkMode
  });


}