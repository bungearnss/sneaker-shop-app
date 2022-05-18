import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/mockdata.dart';
import '../models/modelindex.dart';

class UserController with ChangeNotifier {
  Users? loadedUser;

  Future<void> fetchAndSetUserProfile() async {
    loadedUser = Users(
      profilename: userInfo.profilename,
      profilepic: userInfo.profilepic,
      type: userInfo.type,
      status: userInfo.status,
    );
    notifyListeners();
  }
}
