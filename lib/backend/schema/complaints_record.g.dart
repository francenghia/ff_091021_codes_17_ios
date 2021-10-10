// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaints_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ComplaintsRecord> _$complaintsRecordSerializer =
    new _$ComplaintsRecordSerializer();

class _$ComplaintsRecordSerializer
    implements StructuredSerializer<ComplaintsRecord> {
  @override
  final Iterable<Type> types = const [ComplaintsRecord, _$ComplaintsRecord];
  @override
  final String wireName = 'ComplaintsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ComplaintsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.action;
    if (value != null) {
      result
        ..add('action')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.actionTime;
    if (value != null) {
      result
        ..add('action_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.cause;
    if (value != null) {
      result
        ..add('cause')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userEmail;
    if (value != null) {
      result
        ..add('user_email')
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
  ComplaintsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ComplaintsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'action':
          result.action = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'action_time':
          result.actionTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'cause':
          result.cause = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_email':
          result.userEmail = serializers.deserialize(value,
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

class _$ComplaintsRecord extends ComplaintsRecord {
  @override
  final String action;
  @override
  final DateTime actionTime;
  @override
  final String cause;
  @override
  final DateTime createdTime;
  @override
  final DocumentReference<Object> user;
  @override
  final String username;
  @override
  final String userEmail;
  @override
  final DocumentReference<Object> reference;

  factory _$ComplaintsRecord(
          [void Function(ComplaintsRecordBuilder) updates]) =>
      (new ComplaintsRecordBuilder()..update(updates)).build();

  _$ComplaintsRecord._(
      {this.action,
      this.actionTime,
      this.cause,
      this.createdTime,
      this.user,
      this.username,
      this.userEmail,
      this.reference})
      : super._();

  @override
  ComplaintsRecord rebuild(void Function(ComplaintsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ComplaintsRecordBuilder toBuilder() =>
      new ComplaintsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ComplaintsRecord &&
        action == other.action &&
        actionTime == other.actionTime &&
        cause == other.cause &&
        createdTime == other.createdTime &&
        user == other.user &&
        username == other.username &&
        userEmail == other.userEmail &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, action.hashCode), actionTime.hashCode),
                            cause.hashCode),
                        createdTime.hashCode),
                    user.hashCode),
                username.hashCode),
            userEmail.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ComplaintsRecord')
          ..add('action', action)
          ..add('actionTime', actionTime)
          ..add('cause', cause)
          ..add('createdTime', createdTime)
          ..add('user', user)
          ..add('username', username)
          ..add('userEmail', userEmail)
          ..add('reference', reference))
        .toString();
  }
}

class ComplaintsRecordBuilder
    implements Builder<ComplaintsRecord, ComplaintsRecordBuilder> {
  _$ComplaintsRecord _$v;

  String _action;
  String get action => _$this._action;
  set action(String action) => _$this._action = action;

  DateTime _actionTime;
  DateTime get actionTime => _$this._actionTime;
  set actionTime(DateTime actionTime) => _$this._actionTime = actionTime;

  String _cause;
  String get cause => _$this._cause;
  set cause(String cause) => _$this._cause = cause;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  DocumentReference<Object> _user;
  DocumentReference<Object> get user => _$this._user;
  set user(DocumentReference<Object> user) => _$this._user = user;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _userEmail;
  String get userEmail => _$this._userEmail;
  set userEmail(String userEmail) => _$this._userEmail = userEmail;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ComplaintsRecordBuilder() {
    ComplaintsRecord._initializeBuilder(this);
  }

  ComplaintsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _action = $v.action;
      _actionTime = $v.actionTime;
      _cause = $v.cause;
      _createdTime = $v.createdTime;
      _user = $v.user;
      _username = $v.username;
      _userEmail = $v.userEmail;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ComplaintsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ComplaintsRecord;
  }

  @override
  void update(void Function(ComplaintsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ComplaintsRecord build() {
    final _$result = _$v ??
        new _$ComplaintsRecord._(
            action: action,
            actionTime: actionTime,
            cause: cause,
            createdTime: createdTime,
            user: user,
            username: username,
            userEmail: userEmail,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
