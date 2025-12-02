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

  setInitalData(bool initialData) async {
    final prefs = await _getInstance();
    await prefs.setBool('initialData', initialData);
  }

  setDarkMode(bool darkMode) async {
    final prefs = await _getInstance();
    await prefs.setBool('darkMode', darkMode);
  }

  //getters
  Future<List<String>> getSelectedFields() async {
    final prefs = await _getInstance();
    return prefs.getStringList('fields') ?? ['1'];
  }

  Future<bool> getInitalData() async {
    final prefs = await _getInstance();
    return prefs.getBool('initialData') ?? false;
  }

  Future<bool> getDarkMode() async {
    final prefs = await _getInstance();
    return prefs.getBool('darkMode') ?? false;
  }
}
