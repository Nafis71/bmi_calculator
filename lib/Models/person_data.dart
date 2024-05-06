import 'dart:math';

class PersonData {
  final String _gender;
  double _height;
  double _weight;
  final int _age;
  final bool _isFeet, _isKg;

  PersonData(this._gender, this._height, this._weight, this._isFeet, this._isKg,
      this._age);

  get isKg => _isKg;

  bool get isFeet => _isFeet;

  double get weight => _weight;

  int get age => _age;

  double get height => _height;

  String get gender => _gender;

  set setWeight(double value) {
    _weight = value;
  }

  set setHeight(double value) {
    _height = value;
  }

  double calculateBmi() {
    if (isFeet) {
      List<String> heightValue = _height.toString().split(".");
      int feet = int.tryParse(heightValue[0]) ?? 0;
      int inch = int.tryParse(heightValue[0]) ?? 1;
      _height = ((feet * 12) + inch) * 0.0254;
    }
    if (!isKg) {
      _weight = double.parse(_weight.toString()) * 0.45359237;
    }
    return _weight / (pow(_height, 2));
  }
}
