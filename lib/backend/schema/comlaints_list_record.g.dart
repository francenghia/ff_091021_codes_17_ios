// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comlaints_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ComlaintsListRecord> _$comlaintsListRecordSerializer =
    new _$ComlaintsListRecordSerializer();

class _$ComlaintsListRecordSerializer
    implements StructuredSerializer<ComlaintsListRecord> {
  @override
  final Iterable<Type> types = const [
    ComlaintsListRecord,
    _$ComlaintsListRecord
  ];
  @override
  final String wireName = 'ComlaintsListRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ComlaintsListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.reason;
    if (value != null) {
      result
        ..add('reason')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.no;
    if (value != null) {
      result
        ..add('no')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ComlaintsListRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ComlaintsListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'reason':
          result.reason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'no':
          result.no = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$ComlaintsListRecord extends ComlaintsListRecord {
  @override
  final String reason;
  @override
  final int no;
  @override
  final DocumentReference<Object> reference;

  factory _$ComlaintsListRecord(
          [void Function(ComlaintsListRecordBuilder) updates]) =>
      (new ComlaintsListRecordBuilder()..update(updates)).build();

  _$ComlaintsListRecord._({this.reason, this.no, this.reference}) : super._();

  @override
  ComlaintsListRecord rebuild(
          void Function(ComlaintsListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ComlaintsListRecordBuilder toBuilder() =>
      new ComlaintsListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ComlaintsListRecord &&
        reason == other.reason &&
        no == other.no &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, reason.hashCode), no.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ComlaintsListRecord')
          ..add('reason', reason)
          ..add('no', no)
          ..add('reference', reference))
        .toString();
  }
}

class ComlaintsListRecordBuilder
    implements Builder<ComlaintsListRecord, ComlaintsListRecordBuilder> {
  _$ComlaintsListRecord _$v;

  String _reason;
  String get reason => _$this._reason;
  set reason(String reason) => _$this._reason = reason;

  int _no;
  int get no => _$this._no;
  set no(int no) => _$this._no = no;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ComlaintsListRecordBuilder() {
    ComlaintsListRecord._initializeBuilder(this);
  }

  ComlaintsListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reason = $v.reason;
      _no = $v.no;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ComlaintsListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ComlaintsListRecord;
  }

  @override
  void update(void Function(ComlaintsListRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ComlaintsListRecord build() {
    final _$result = _$v ??
        new _$ComlaintsListRecord._(
            reason: reason, no: no, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
