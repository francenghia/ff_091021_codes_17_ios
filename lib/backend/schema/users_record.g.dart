// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.profilePicUrl;
    if (value != null) {
      result
        ..add('profile_pic_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.website;
    if (value != null) {
      result
        ..add('website')
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
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.atendantContest;
    if (value != null) {
      result
        ..add('atendant_contest')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.totalFollow;
    if (value != null) {
      result
        ..add('total_follow')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalFollower;
    if (value != null) {
      result
        ..add('total_follower')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalLike;
    if (value != null) {
      result
        ..add('total_like')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalSp;
    if (value != null) {
      result
        ..add('total_sp')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalPosts;
    if (value != null) {
      result
        ..add('total_posts')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.followList;
    if (value != null) {
      result
        ..add('follow_list')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.followListRef;
    if (value != null) {
      result
        ..add('follow_list_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.followListMe;
    if (value != null) {
      result
        ..add('follow_list_me')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.contestRefs;
    if (value != null) {
      result
        ..add('contest_refs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.videoLink;
    if (value != null) {
      result
        ..add('video_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalTl;
    if (value != null) {
      result
        ..add('total_tl')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.iBANNo;
    if (value != null) {
      result
        ..add('IBAN_no')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.aliciAdSoyad;
    if (value != null) {
      result
        ..add('alici_ad_soyad')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.iBANOk;
    if (value != null) {
      result
        ..add('IBAN_ok')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.paymentCheck;
    if (value != null) {
      result
        ..add('payment_check')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.videoUploadLoading;
    if (value != null) {
      result
        ..add('video_upload_loading')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'profile_pic_url':
          result.profilePicUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'atendant_contest':
          result.atendantContest.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'total_follow':
          result.totalFollow = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_follower':
          result.totalFollower = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_like':
          result.totalLike = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_sp':
          result.totalSp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_posts':
          result.totalPosts = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'follow_list':
          result.followList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'follow_list_ref':
          result.followListRef.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'follow_list_me':
          result.followListMe.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'contest_refs':
          result.contestRefs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'video_link':
          result.videoLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'total_tl':
          result.totalTl = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'IBAN_no':
          result.iBANNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'alici_ad_soyad':
          result.aliciAdSoyad = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'IBAN_ok':
          result.iBANOk = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'payment_check':
          result.paymentCheck = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'video_upload_loading':
          result.videoUploadLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$UsersRecord extends UsersRecord {
  @override
  final String email;
  @override
  final String username;
  @override
  final String displayName;
  @override
  final String profilePicUrl;
  @override
  final String bio;
  @override
  final String website;
  @override
  final DateTime createdTime;
  @override
  final String photoUrl;
  @override
  final String uid;
  @override
  final String phoneNumber;
  @override
  final BuiltList<String> atendantContest;
  @override
  final int totalFollow;
  @override
  final int totalFollower;
  @override
  final int totalLike;
  @override
  final int totalSp;
  @override
  final int totalPosts;
  @override
  final BuiltList<DocumentReference<Object>> followList;
  @override
  final BuiltList<DocumentReference<Object>> followListRef;
  @override
  final BuiltList<DocumentReference<Object>> followListMe;
  @override
  final BuiltList<DocumentReference<Object>> contestRefs;
  @override
  final String videoLink;
  @override
  final int totalTl;
  @override
  final String iBANNo;
  @override
  final String aliciAdSoyad;
  @override
  final bool iBANOk;
  @override
  final int paymentCheck;
  @override
  final bool videoUploadLoading;
  @override
  final DocumentReference<Object> reference;

  factory _$UsersRecord([void Function(UsersRecordBuilder) updates]) =>
      (new UsersRecordBuilder()..update(updates)).build();

  _$UsersRecord._(
      {this.email,
      this.username,
      this.displayName,
      this.profilePicUrl,
      this.bio,
      this.website,
      this.createdTime,
      this.photoUrl,
      this.uid,
      this.phoneNumber,
      this.atendantContest,
      this.totalFollow,
      this.totalFollower,
      this.totalLike,
      this.totalSp,
      this.totalPosts,
      this.followList,
      this.followListRef,
      this.followListMe,
      this.contestRefs,
      this.videoLink,
      this.totalTl,
      this.iBANNo,
      this.aliciAdSoyad,
      this.iBANOk,
      this.paymentCheck,
      this.videoUploadLoading,
      this.reference})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        username == other.username &&
        displayName == other.displayName &&
        profilePicUrl == other.profilePicUrl &&
        bio == other.bio &&
        website == other.website &&
        createdTime == other.createdTime &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        phoneNumber == other.phoneNumber &&
        atendantContest == other.atendantContest &&
        totalFollow == other.totalFollow &&
        totalFollower == other.totalFollower &&
        totalLike == other.totalLike &&
        totalSp == other.totalSp &&
        totalPosts == other.totalPosts &&
        followList == other.followList &&
        followListRef == other.followListRef &&
        followListMe == other.followListMe &&
        contestRefs == other.contestRefs &&
        videoLink == other.videoLink &&
        totalTl == other.totalTl &&
        iBANNo == other.iBANNo &&
        aliciAdSoyad == other.aliciAdSoyad &&
        iBANOk == other.iBANOk &&
        paymentCheck == other.paymentCheck &&
        videoUploadLoading == other.videoUploadLoading &&
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
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, email.hashCode), username.hashCode), displayName.hashCode), profilePicUrl.hashCode), bio.hashCode), website.hashCode), createdTime.hashCode), photoUrl.hashCode), uid.hashCode),
                                                                                phoneNumber.hashCode),
                                                                            atendantContest.hashCode),
                                                                        totalFollow.hashCode),
                                                                    totalFollower.hashCode),
                                                                totalLike.hashCode),
                                                            totalSp.hashCode),
                                                        totalPosts.hashCode),
                                                    followList.hashCode),
                                                followListRef.hashCode),
                                            followListMe.hashCode),
                                        contestRefs.hashCode),
                                    videoLink.hashCode),
                                totalTl.hashCode),
                            iBANNo.hashCode),
                        aliciAdSoyad.hashCode),
                    iBANOk.hashCode),
                paymentCheck.hashCode),
            videoUploadLoading.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsersRecord')
          ..add('email', email)
          ..add('username', username)
          ..add('displayName', displayName)
          ..add('profilePicUrl', profilePicUrl)
          ..add('bio', bio)
          ..add('website', website)
          ..add('createdTime', createdTime)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('phoneNumber', phoneNumber)
          ..add('atendantContest', atendantContest)
          ..add('totalFollow', totalFollow)
          ..add('totalFollower', totalFollower)
          ..add('totalLike', totalLike)
          ..add('totalSp', totalSp)
          ..add('totalPosts', totalPosts)
          ..add('followList', followList)
          ..add('followListRef', followListRef)
          ..add('followListMe', followListMe)
          ..add('contestRefs', contestRefs)
          ..add('videoLink', videoLink)
          ..add('totalTl', totalTl)
          ..add('iBANNo', iBANNo)
          ..add('aliciAdSoyad', aliciAdSoyad)
          ..add('iBANOk', iBANOk)
          ..add('paymentCheck', paymentCheck)
          ..add('videoUploadLoading', videoUploadLoading)
          ..add('reference', reference))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _profilePicUrl;
  String get profilePicUrl => _$this._profilePicUrl;
  set profilePicUrl(String profilePicUrl) =>
      _$this._profilePicUrl = profilePicUrl;

  String _bio;
  String get bio => _$this._bio;
  set bio(String bio) => _$this._bio = bio;

  String _website;
  String get website => _$this._website;
  set website(String website) => _$this._website = website;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  ListBuilder<String> _atendantContest;
  ListBuilder<String> get atendantContest =>
      _$this._atendantContest ??= new ListBuilder<String>();
  set atendantContest(ListBuilder<String> atendantContest) =>
      _$this._atendantContest = atendantContest;

  int _totalFollow;
  int get totalFollow => _$this._totalFollow;
  set totalFollow(int totalFollow) => _$this._totalFollow = totalFollow;

  int _totalFollower;
  int get totalFollower => _$this._totalFollower;
  set totalFollower(int totalFollower) => _$this._totalFollower = totalFollower;

  int _totalLike;
  int get totalLike => _$this._totalLike;
  set totalLike(int totalLike) => _$this._totalLike = totalLike;

  int _totalSp;
  int get totalSp => _$this._totalSp;
  set totalSp(int totalSp) => _$this._totalSp = totalSp;

  int _totalPosts;
  int get totalPosts => _$this._totalPosts;
  set totalPosts(int totalPosts) => _$this._totalPosts = totalPosts;

  ListBuilder<DocumentReference<Object>> _followList;
  ListBuilder<DocumentReference<Object>> get followList =>
      _$this._followList ??= new ListBuilder<DocumentReference<Object>>();
  set followList(ListBuilder<DocumentReference<Object>> followList) =>
      _$this._followList = followList;

  ListBuilder<DocumentReference<Object>> _followListRef;
  ListBuilder<DocumentReference<Object>> get followListRef =>
      _$this._followListRef ??= new ListBuilder<DocumentReference<Object>>();
  set followListRef(ListBuilder<DocumentReference<Object>> followListRef) =>
      _$this._followListRef = followListRef;

  ListBuilder<DocumentReference<Object>> _followListMe;
  ListBuilder<DocumentReference<Object>> get followListMe =>
      _$this._followListMe ??= new ListBuilder<DocumentReference<Object>>();
  set followListMe(ListBuilder<DocumentReference<Object>> followListMe) =>
      _$this._followListMe = followListMe;

  ListBuilder<DocumentReference<Object>> _contestRefs;
  ListBuilder<DocumentReference<Object>> get contestRefs =>
      _$this._contestRefs ??= new ListBuilder<DocumentReference<Object>>();
  set contestRefs(ListBuilder<DocumentReference<Object>> contestRefs) =>
      _$this._contestRefs = contestRefs;

  String _videoLink;
  String get videoLink => _$this._videoLink;
  set videoLink(String videoLink) => _$this._videoLink = videoLink;

  int _totalTl;
  int get totalTl => _$this._totalTl;
  set totalTl(int totalTl) => _$this._totalTl = totalTl;

  String _iBANNo;
  String get iBANNo => _$this._iBANNo;
  set iBANNo(String iBANNo) => _$this._iBANNo = iBANNo;

  String _aliciAdSoyad;
  String get aliciAdSoyad => _$this._aliciAdSoyad;
  set aliciAdSoyad(String aliciAdSoyad) => _$this._aliciAdSoyad = aliciAdSoyad;

  bool _iBANOk;
  bool get iBANOk => _$this._iBANOk;
  set iBANOk(bool iBANOk) => _$this._iBANOk = iBANOk;

  int _paymentCheck;
  int get paymentCheck => _$this._paymentCheck;
  set paymentCheck(int paymentCheck) => _$this._paymentCheck = paymentCheck;

  bool _videoUploadLoading;
  bool get videoUploadLoading => _$this._videoUploadLoading;
  set videoUploadLoading(bool videoUploadLoading) =>
      _$this._videoUploadLoading = videoUploadLoading;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _username = $v.username;
      _displayName = $v.displayName;
      _profilePicUrl = $v.profilePicUrl;
      _bio = $v.bio;
      _website = $v.website;
      _createdTime = $v.createdTime;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _phoneNumber = $v.phoneNumber;
      _atendantContest = $v.atendantContest?.toBuilder();
      _totalFollow = $v.totalFollow;
      _totalFollower = $v.totalFollower;
      _totalLike = $v.totalLike;
      _totalSp = $v.totalSp;
      _totalPosts = $v.totalPosts;
      _followList = $v.followList?.toBuilder();
      _followListRef = $v.followListRef?.toBuilder();
      _followListMe = $v.followListMe?.toBuilder();
      _contestRefs = $v.contestRefs?.toBuilder();
      _videoLink = $v.videoLink;
      _totalTl = $v.totalTl;
      _iBANNo = $v.iBANNo;
      _aliciAdSoyad = $v.aliciAdSoyad;
      _iBANOk = $v.iBANOk;
      _paymentCheck = $v.paymentCheck;
      _videoUploadLoading = $v.videoUploadLoading;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsersRecord build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              username: username,
              displayName: displayName,
              profilePicUrl: profilePicUrl,
              bio: bio,
              website: website,
              createdTime: createdTime,
              photoUrl: photoUrl,
              uid: uid,
              phoneNumber: phoneNumber,
              atendantContest: _atendantContest?.build(),
              totalFollow: totalFollow,
              totalFollower: totalFollower,
              totalLike: totalLike,
              totalSp: totalSp,
              totalPosts: totalPosts,
              followList: _followList?.build(),
              followListRef: _followListRef?.build(),
              followListMe: _followListMe?.build(),
              contestRefs: _contestRefs?.build(),
              videoLink: videoLink,
              totalTl: totalTl,
              iBANNo: iBANNo,
              aliciAdSoyad: aliciAdSoyad,
              iBANOk: iBANOk,
              paymentCheck: paymentCheck,
              videoUploadLoading: videoUploadLoading,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'atendantContest';
        _atendantContest?.build();

        _$failedField = 'followList';
        _followList?.build();
        _$failedField = 'followListRef';
        _followListRef?.build();
        _$failedField = 'followListMe';
        _followListMe?.build();
        _$failedField = 'contestRefs';
        _contestRefs?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
