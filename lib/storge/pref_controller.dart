import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia_ui/model/student_moddel.dart';

enum PrefKey {
  id,
  loggedIn,
  name,
  email,
  gender,
  token,
}

class SharedPrefController {
  static final SharedPrefController instance = SharedPrefController._();

  factory SharedPrefController() {
    return instance;
  }

  late SharedPreferences _sharedPreferences;

  SharedPrefController._();

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

//enum PrefKey { id, loggedIn token, }
  Future<void> save({required Student student}) async {
    _sharedPreferences.setString(PrefKey.email.toString(), student.email);
    _sharedPreferences.setString(
        PrefKey.name.toString(), student.fullName);
    _sharedPreferences.setString(
        PrefKey.gender.toString(), student.gender);
    _sharedPreferences.setInt(PrefKey.id.toString(), student.id);
    _sharedPreferences.setBool(PrefKey.loggedIn.toString(), true);
    _sharedPreferences.setString(
        PrefKey.token.toString(), 'Bearer ${student.token}');
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKey.loggedIn.toString()) ?? false;

  String get token =>
      _sharedPreferences.getString(PrefKey.token.toString()) ?? '';

  Future<void> clear() async => await _sharedPreferences.clear();
}
