// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'touch_location.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TouchLocationEvent extends TouchLocationEvent {
  @override
  final double x;
  @override
  final double y;

  factory _$TouchLocationEvent(
          [void Function(TouchLocationEventBuilder)? updates]) =>
      (new TouchLocationEventBuilder()..update(updates))._build();

  _$TouchLocationEvent._({required this.x, required this.y}) : super._() {
    BuiltValueNullFieldError.checkNotNull(x, r'TouchLocationEvent', 'x');
    BuiltValueNullFieldError.checkNotNull(y, r'TouchLocationEvent', 'y');
  }

  @override
  TouchLocationEvent rebuild(
          void Function(TouchLocationEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TouchLocationEventBuilder toBuilder() =>
      new TouchLocationEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TouchLocationEvent && x == other.x && y == other.y;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TouchLocationEvent')
          ..add('x', x)
          ..add('y', y))
        .toString();
  }
}

class TouchLocationEventBuilder
    implements Builder<TouchLocationEvent, TouchLocationEventBuilder> {
  _$TouchLocationEvent? _$v;

  double? _x;
  double? get x => _$this._x;
  set x(double? x) => _$this._x = x;

  double? _y;
  double? get y => _$this._y;
  set y(double? y) => _$this._y = y;

  TouchLocationEventBuilder();

  TouchLocationEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TouchLocationEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TouchLocationEvent;
  }

  @override
  void update(void Function(TouchLocationEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TouchLocationEvent build() => _build();

  _$TouchLocationEvent _build() {
    final _$result = _$v ??
        new _$TouchLocationEvent._(
            x: BuiltValueNullFieldError.checkNotNull(
                x, r'TouchLocationEvent', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(
                y, r'TouchLocationEvent', 'y'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
