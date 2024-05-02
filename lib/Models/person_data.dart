class PersonData {
  final String _gender;
  double _height;
  int _weight;
  final bool _isFeet, _isKg;

  PersonData(
      this._gender, this._height, this._weight, this._isFeet, this._isKg);

  get isKg => _isKg;

  bool get isFeet => _isFeet;

  int get weight => _weight;

  double get height => _height;

  String get gender => _gender;

  set setWeight(int value) {
    _weight = value;
  }

  set setHeight(double value) {
    _height = value;
  }
}
