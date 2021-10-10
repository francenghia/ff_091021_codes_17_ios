// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follows_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FollowsRecord> _$followsRecordSerializer =
    new _$FollowsRecordSerializer();

class _$FollowsRecordSerializer implements StructuredSerializer<FollowsRecord> {
  @override
  final Iterable<Type> types = const [FollowsRecord, _$FollowsRecord];
  @override
  final String wireName = 'FollowsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, FollowsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.follower;
    if (value != null) {
      result
        ..add('follower')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.following;
    if (value != null) {
      result
        ..add('following')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.followerProfilePic;
    if (value != null) {
      result
        ..add('follower_profile_pic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.followingProfilePic;
    if (value != null) {
      result
        ..add('following_profile_pic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
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
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.followerName;
    if (value != null) {
      result
        ..add('follower_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.followingName;
    if (value != null) {
      result
        ..add('following_name')
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
  FollowsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FollowsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'follower':
          result.follower = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'following':
          result.following = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'follower_profile_pic':
          result.followerProfilePic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'following_profile_pic':
          result.followingProfilePic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'follower_name':
          result.followerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'following_name':
          result.followingName = serializers.deserialize(value,
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

class _$FollowsRecord extends FollowsRecord {
  @override
  final DocumentReference<Object> follower;
  @override
  final DocumentReference<Object> following;
  @override
  final String followerProfilePic;
  @override
  final String followingProfilePic;
  @override
  final String email;
  @override
  final DateTime createdTime;
  @override
  final String phoneNumber;
  @override
  final DocumentReference<Object> userRef;
  @override
  final String followerName;
  @override
  final String followingName;
  @override
  final DocumentReference<Object> reference;

  factory _$FollowsRecord([void Function(FollowsRecordBuilder) updates]) =>
      (new FollowsRecordBuilder()..update(updates)).build();

  _$FollowsRecord._(
      {this.follower,
      this.following,
      this.followerProfilePic,
      this.followingProfilePic,
      this.email,
      this.createdTime,
      this.phoneNumber,
      this.userRef,
      this.followerName,
      this.followingName,
      this.reference})
      : super._();

  @override
  FollowsRecord rebuild(void Function(FollowsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FollowsRecordBuilder toBuilder() => new FollowsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FollowsRecord &&
        follower == other.follower &&
        following == other.following &&
        followerProfilePic == other.followerProfilePic &&
        followingProfilePic == other.followingProfilePic &&
        email == other.email &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        userRef == other.userRef &&
        followerName == other.followerName &&
        followingName == other.followingName &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, follower.hashCode),
                                            following.hashCode),
                                        followerProfilePic.hashCode),
                                    followingProfilePic.hashCode),
                                email.hashCode),
                            createdTime.hashCode),
                        phoneNumber.hashCode),
                    userRef.hashCode),
                followerName.hashCode),
            followingName.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FollowsRecord')
          ..add('follower', follower)
          ..add('following', following)
          ..add('followerProfilePic', followerProfilePic)
          ..add('followingProfilePic', followingProfilePic)
          ..add('email', email)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('userRef', userRef)
          ..add('followerName', followerName)
          ..add('followingName', followingName)
          ..add('reference', reference))
        .toString();
  }
}

class FollowsRecordBuilder
    implements Builder<FollowsRecord, FollowsRecordBuilder> {
  _$FollowsRecord _$v;

  DocumentReference<Object> _follower;
  DocumentReference<Object> get follower => _$this._follower;
  set follower(DocumentReference<Object> follower) =>
      _$this._follower = follower;

  DocumentReference<Object> _following;
  DocumentReference<Object> get following => _$this._following;
  set following(DocumentReference<Object> following) =>
      _$this._following = following;

  String _followerProfilePic;
  String get followerProfilePic => _$this._followerProfilePic;
  set followerProfilePic(String followerProfilePic) =>
      _$this._followerProfilePic = followerProfilePic;

  String _followingProfilePic;
  String get followingProfilePic => _$this._followingProfilePic;
  set followingProfilePic(String followingProfilePic) =>
      _$this._followingProfilePic = followingProfilePic;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  String _followerName;
  String get followerName => _$this._followerName;
  set followerName(String followerName) => _$this._followerName = followerName;

  String _followingName;
  String get followingName => _$this._followingName;
  set followingName(String followingName) =>
      _$this._followingName = followingName;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  FollowsRecordBuilder() {
    FollowsRecord._initializeBuilder(this);
  }

  FollowsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _follower = $v.follower;
      _following = $v.following;
      _followerProfilePic = $v.followerProfilePic;
      _followingProfilePic = $v.followingProfilePic;
      _email = $v.email;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _userRef = $v.userRef;
      _followerName = $v.followerName;
      _followingName = $v.followingName;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FollowsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FollowsRecord;
  }

  @override
  void update(void Function(FollowsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FollowsRecord build() {
    final _$result = _$v ??
        new _$FollowsRecord._(
            follower: follower,
            following: following,
            followerProfilePic: followerProfilePic,
            followingProfilePic: followingProfilePic,
            email: email,
            createdTime: createdTime,
            phoneNumber: phoneNumber,
            userRef: userRef,
            followerName: followerName,
            followingName: followingName,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
