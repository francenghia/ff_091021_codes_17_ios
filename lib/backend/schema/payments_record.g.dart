// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaymentsRecord> _$paymentsRecordSerializer =
    new _$PaymentsRecordSerializer();

class _$PaymentsRecordSerializer
    implements StructuredSerializer<PaymentsRecord> {
  @override
  final Iterable<Type> types = const [PaymentsRecord, _$PaymentsRecord];
  @override
  final String wireName = 'PaymentsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PaymentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.takeAmount;
    if (value != null) {
      result
        ..add('take_amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updateTime;
    if (value != null) {
      result
        ..add('update_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userEmail;
    if (value != null) {
      result
        ..add('user_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
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
  PaymentsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaymentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'take_amount':
          result.takeAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'update_time':
          result.updateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'user_email':
          result.userEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_name':
          result.userName = serializers.deserialize(value,
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

class _$PaymentsRecord extends PaymentsRecord {
  @override
  final DocumentReference<Object> user;
  @override
  final int takeAmount;
  @override
  final DateTime createdTime;
  @override
  final String status;
  @override
  final DateTime updateTime;
  @override
  final String userEmail;
  @override
  final String userName;
  @override
  final DocumentReference<Object> reference;

  factory _$PaymentsRecord([void Function(PaymentsRecordBuilder) updates]) =>
      (new PaymentsRecordBuilder()..update(updates)).build();

  _$PaymentsRecord._(
      {this.user,
      this.takeAmount,
      this.createdTime,
      this.status,
      this.updateTime,
      this.userEmail,
      this.userName,
      this.reference})
      : super._();

  @override
  PaymentsRecord rebuild(void Function(PaymentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentsRecordBuilder toBuilder() =>
      new PaymentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentsRecord &&
        user == other.user &&
        takeAmount == other.takeAmount &&
        createdTime == other.createdTime &&
        status == other.status &&
        updateTime == other.updateTime &&
        userEmail == other.userEmail &&
        userName == other.userName &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, user.hashCode), takeAmount.hashCode),
                            createdTime.hashCode),
                        status.hashCode),
                    updateTime.hashCode),
                userEmail.hashCode),
            userName.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PaymentsRecord')
          ..add('user', user)
          ..add('takeAmount', takeAmount)
          ..add('createdTime', createdTime)
          ..add('status', status)
          ..add('updateTime', updateTime)
          ..add('userEmail', userEmail)
          ..add('userName', userName)
          ..add('reference', reference))
        .toString();
  }
}

class PaymentsRecordBuilder
    implements Builder<PaymentsRecord, PaymentsRecordBuilder> {
  _$PaymentsRecord _$v;

  DocumentReference<Object> _user;
  DocumentReference<Object> get user => _$this._user;
  set user(DocumentReference<Object> user) => _$this._user = user;

  int _takeAmount;
  int get takeAmount => _$this._takeAmount;
  set takeAmount(int takeAmount) => _$this._takeAmount = takeAmount;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  DateTime _updateTime;
  DateTime get updateTime => _$this._updateTime;
  set updateTime(DateTime updateTime) => _$this._updateTime = updateTime;

  String _userEmail;
  String get userEmail => _$this._userEmail;
  set userEmail(String userEmail) => _$this._userEmail = userEmail;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PaymentsRecordBuilder() {
    PaymentsRecord._initializeBuilder(this);
  }

  PaymentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _takeAmount = $v.takeAmount;
      _createdTime = $v.createdTime;
      _status = $v.status;
      _updateTime = $v.updateTime;
      _userEmail = $v.userEmail;
      _userName = $v.userName;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaymentsRecord;
  }

  @override
  void update(void Function(PaymentsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PaymentsRecord build() {
    final _$result = _$v ??
        new _$PaymentsRecord._(
            user: user,
            takeAmount: takeAmount,
            createdTime: createdTime,
            status: status,
            updateTime: updateTime,
            userEmail: userEmail,
            userName: userName,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
