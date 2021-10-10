// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yasal_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<YasalRecord> _$yasalRecordSerializer = new _$YasalRecordSerializer();

class _$YasalRecordSerializer implements StructuredSerializer<YasalRecord> {
  @override
  final Iterable<Type> types = const [YasalRecord, _$YasalRecord];
  @override
  final String wireName = 'YasalRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, YasalRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.no;
    if (value != null) {
      result
        ..add('no')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.metin;
    if (value != null) {
      result
        ..add('metin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.baslik;
    if (value != null) {
      result
        ..add('baslik')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  YasalRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new YasalRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'no':
          result.no = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'metin':
          result.metin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'baslik':
          result.baslik = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$YasalRecord extends YasalRecord {
  @override
  final int no;
  @override
  final String metin;
  @override
  final String baslik;
  @override
  final DocumentReference<Object> reference;

  factory _$YasalRecord([void Function(YasalRecordBuilder) updates]) =>
      (new YasalRecordBuilder()..update(updates)).build();

  _$YasalRecord._({this.no, this.metin, this.baslik, this.reference})
      : super._();

  @override
  YasalRecord rebuild(void Function(YasalRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  YasalRecordBuilder toBuilder() => new YasalRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is YasalRecord &&
        no == other.no &&
        metin == other.metin &&
        baslik == other.baslik &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, no.hashCode), metin.hashCode), baslik.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('YasalRecord')
          ..add('no', no)
          ..add('metin', metin)
          ..add('baslik', baslik)
          ..add('reference', reference))
        .toString();
  }
}

class YasalRecordBuilder implements Builder<YasalRecord, YasalRecordBuilder> {
  _$YasalRecord _$v;

  int _no;
  int get no => _$this._no;
  set no(int no) => _$this._no = no;

  String _metin;
  String get metin => _$this._metin;
  set metin(String metin) => _$this._metin = metin;

  String _baslik;
  String get baslik => _$this._baslik;
  set baslik(String baslik) => _$this._baslik = baslik;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  YasalRecordBuilder() {
    YasalRecord._initializeBuilder(this);
  }

  YasalRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _no = $v.no;
      _metin = $v.metin;
      _baslik = $v.baslik;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(YasalRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$YasalRecord;
  }

  @override
  void update(void Function(YasalRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$YasalRecord build() {
    final _$result = _$v ??
        new _$YasalRecord._(
            no: no, metin: metin, baslik: baslik, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
