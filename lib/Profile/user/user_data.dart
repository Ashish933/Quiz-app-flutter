import 'dart:convert';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    image:
    "https://upload.wikimedia.org/wikipedia/en/0/0b/Darth_Vader_in_The_Empire_Strikes_Back.jpg",
    name: 'Test Test',
    email: 'test.test@gmail.com',
    phone: '(208) 206-5039',
    aboutMeDescription:
    'Hii,My name is Ashish, I was born and bought up in Rewa Madhya Pradesh, '
        ' Now coming to my education qualification,I am completed my BSc IT at from M.G.C.G.V.Satna '
        ' I am pursuing MCA at from  TIT&S collage Bhopal '
        ' I am a Flutter developer as a Fresher.'
        ' My hobbies are listening to music, wall painting, drawing, dancing '
        'That is all about me...',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}