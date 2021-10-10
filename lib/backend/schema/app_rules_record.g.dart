// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_rules_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppRulesRecord> _$appRulesRecordSerializer =
    new _$AppRulesRecordSerializer();

class _$AppRulesRecordSerializer
    implements StructuredSerializer<AppRulesRecord> {
  @override
  final Iterable<Type> types = const [AppRulesRecord, _$AppRulesRecord];
  @override
  final String wireName = 'AppRulesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, AppRulesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.no;
    if (value != null) {
      result
        ..add('no')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rule;
    if (value != null) {
      result
        ..add('rule')
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
  AppRulesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppRulesRecordBuilder();

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
        case 'rule':
          result.rule = serializers.deserialize(value,
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

class _$AppRulesRecord extends AppRulesRecord {
  @override
  final int no;
  @override
  final String rule;
  @override
  final DocumentReference<Object> reference;

  factory _$AppRulesRecord([void Function(AppRulesRecordBuilder) updates]) =>
      (new AppRulesRecordBuilder()..update(updates)).build();

  _$AppRulesRecord._({this.no, this.rule, this.reference}) : super._();

  @override
  AppRulesRecord rebuild(void Function(AppRulesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppRulesRecordBuilder toBuilder() =>
      new AppRulesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppRulesRecord &&
        no == other.no &&
        rule == other.rule &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, no.hashCode), rule.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppRulesRecord')
          ..add('no', no)
          ..add('rule', rule)
          ..add('reference', reference))
        .toString();
  }
}

class AppRulesRecordBuilder
    implements Builder<AppRulesRecord, AppRulesRecordBuilder> {
  _$AppRulesRecord _$v;

  int _no;
  int get no => _$this._no;
  set no(int no) => _$this._no = no;

  String _rule;
  String get rule => _$this._rule;
  set rule(String rule) => _$this._rule = rule;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  AppRulesRecordBuilder() {
    AppRulesRecord._initializeBuilder(this);
  }

  AppRulesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _no = $v.no;
      _rule = $v.rule;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppRulesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppRulesRecord;
  }

  @override
  void update(void Function(AppRulesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppRulesRecord build() {
    final _$result =
        _$v ?? new _$AppRulesRecord._(no: no, rule: rule, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
