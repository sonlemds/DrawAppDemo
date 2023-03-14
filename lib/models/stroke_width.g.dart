// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke_width.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StrokeWidthChangeEvent extends StrokeWidthChangeEvent {
  @override
  final double width;

  factory _$StrokeWidthChangeEvent(
          [void Function(StrokeWidthChangeEventBuilder)? updates]) =>
      (new StrokeWidthChangeEventBuilder()..update(updates))._build();

  _$StrokeWidthChangeEvent._({required this.width}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        width, r'StrokeWidthChangeEvent', 'width');
  }

  @override
  StrokeWidthChangeEvent rebuild(
          void Function(StrokeWidthChangeEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StrokeWidthChangeEventBuilder toBuilder() =>
      new StrokeWidthChangeEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StrokeWidthChangeEvent && width == other.width;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, width.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StrokeWidthChangeEvent')
          ..add('width', width))
        .toString();
  }
}

class StrokeWidthChangeEventBuilder
    implements Builder<StrokeWidthChangeEvent, StrokeWidthChangeEventBuilder> {
  _$StrokeWidthChangeEvent? _$v;

  double? _width;
  double? get width => _$this._width;
  set width(double? width) => _$this._width = width;

  StrokeWidthChangeEventBuilder();

  StrokeWidthChangeEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _width = $v.width;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StrokeWidthChangeEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StrokeWidthChangeEvent;
  }

  @override
  void update(void Function(StrokeWidthChangeEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StrokeWidthChangeEvent build() => _build();

  _$StrokeWidthChangeEvent _build() {
    final _$result = _$v ??
        new _$StrokeWidthChangeEvent._(
            width: BuiltValueNullFieldError.checkNotNull(
                width, r'StrokeWidthChangeEvent', 'width'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
