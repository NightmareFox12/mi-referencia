import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  //private functions
  Future<SharedPreferences> _getInstance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  //setters
  setSelectedFields(List<String> res) async {
    final prefs = await _getInstance();
    await prefs.setStringList('fields', res);
  }

  //getters
  Future<List<String>> getSelectedFields() async {
    final prefs = await _getInstance();
    return prefs.getStringList('fields') ?? ['1'];
  }
}
