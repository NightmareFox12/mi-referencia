import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  //private functions
  Future<SharedPreferences> _getInstance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  setSelectedFields() async {
    final prefs = await _getInstance();

    await prefs.setStringList('fields', <String>['1']);
  }
}
