// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ColorChangeEvent extends ColorChangeEvent {
  @override
  final int red;
  @override
  final int green;
  @override
  final int blue;

  factory _$ColorChangeEvent(
          [void Function(ColorChangeEventBuilder)? updates]) =>
      (new ColorChangeEventBuilder()..update(updates))._build();

  _$ColorChangeEvent._(
      {required this.red, required this.green, required this.blue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(red, r'ColorChangeEvent', 'red');
    BuiltValueNullFieldError.checkNotNull(green, r'ColorChangeEvent', 'green');
    BuiltValueNullFieldError.checkNotNull(blue, r'ColorChangeEvent', 'blue');
  }

  @override
  ColorChangeEvent rebuild(void Function(ColorChangeEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ColorChangeEventBuilder toBuilder() =>
      new ColorChangeEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ColorChangeEvent &&
        red == other.red &&
        green == other.green &&
        blue == other.blue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, red.hashCode);
    _$hash = $jc(_$hash, green.hashCode);
    _$hash = $jc(_$hash, blue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ColorChangeEvent')
          ..add('red', red)
          ..add('green', green)
          ..add('blue', blue))
        .toString();
  }
}

class ColorChangeEventBuilder
    implements Builder<ColorChangeEvent, ColorChangeEventBuilder> {
  _$ColorChangeEvent? _$v;

  int? _red;
  int? get red => _$this._red;
  set red(int? red) => _$this._red = red;

  int? _green;
  int? get green => _$this._green;
  set green(int? green) => _$this._green = green;

  int? _blue;
  int? get blue => _$this._blue;
  set blue(int? blue) => _$this._blue = blue;

  ColorChangeEventBuilder();

  ColorChangeEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _red = $v.red;
      _green = $v.green;
      _blue = $v.blue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ColorChangeEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ColorChangeEvent;
  }

  @override
  void update(void Function(ColorChangeEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ColorChangeEvent build() => _build();

  _$ColorChangeEvent _build() {
    final _$result = _$v ??
        new _$ColorChangeEvent._(
            red: BuiltValueNullFieldError.checkNotNull(
                red, r'ColorChangeEvent', 'red'),
            green: BuiltValueNullFieldError.checkNotNull(
                green, r'ColorChangeEvent', 'green'),
            blue: BuiltValueNullFieldError.checkNotNull(
                blue, r'ColorChangeEvent', 'blue'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
