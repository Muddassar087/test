class ThemeModel {
  bool _light = true;

  bool get light => _light;

  set light(bool light) {
    _light = light;
  }

  factory ThemeModel() => _this ??= ThemeModel._();
  ThemeModel._();
  static ThemeModel? _this;

  toggle() {
    _light = !_light;
  }
}
