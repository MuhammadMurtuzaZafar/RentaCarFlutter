class CatModel{
  String? _iconPath;
  String? _iconName;
  int? _iconId;


  CatModel(this._iconName, this._iconPath, this._iconId);

  String get iconPath => _iconPath??"";

  set iconPath(String value) {
    _iconPath = value;
  }

  String get iconName => _iconName??"";

  int get iconId => _iconId??0;

  set iconId(int value) {
    _iconId = value;
  }

  set iconName(String value) {
    _iconName = value;
  }
}