import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  String get username;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'profile_pic_url')
  String get profilePicUrl;

  @nullable
  String get bio;

  @nullable
  String get website;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'atendant_contest')
  BuiltList<String> get atendantContest;

  @nullable
  @BuiltValueField(wireName: 'total_follow')
  int get totalFollow;

  @nullable
  @BuiltValueField(wireName: 'total_follower')
  int get totalFollower;

  @nullable
  @BuiltValueField(wireName: 'total_like')
  int get totalLike;

  @nullable
  @BuiltValueField(wireName: 'total_sp')
  int get totalSp;

  @nullable
  @BuiltValueField(wireName: 'total_posts')
  int get totalPosts;

  @nullable
  @BuiltValueField(wireName: 'follow_list')
  BuiltList<DocumentReference> get followList;

  @nullable
  @BuiltValueField(wireName: 'follow_list_ref')
  BuiltList<DocumentReference> get followListRef;

  @nullable
  @BuiltValueField(wireName: 'follow_list_me')
  BuiltList<DocumentReference> get followListMe;

  @nullable
  @BuiltValueField(wireName: 'contest_refs')
  BuiltList<DocumentReference> get contestRefs;

  @nullable
  @BuiltValueField(wireName: 'video_link')
  String get videoLink;

  @nullable
  @BuiltValueField(wireName: 'total_tl')
  int get totalTl;

  @nullable
  @BuiltValueField(wireName: 'IBAN_no')
  String get iBANNo;

  @nullable
  @BuiltValueField(wireName: 'alici_ad_soyad')
  String get aliciAdSoyad;

  @nullable
  @BuiltValueField(wireName: 'IBAN_ok')
  bool get iBANOk;

  @nullable
  @BuiltValueField(wireName: 'payment_check')
  int get paymentCheck;

  @nullable
  @BuiltValueField(wireName: 'video_upload_loading')
  bool get videoUploadLoading;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..username = ''
    ..displayName = ''
    ..profilePicUrl = ''
    ..bio = ''
    ..website = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..atendantContest = ListBuilder()
    ..totalFollow = 0
    ..totalFollower = 0
    ..totalLike = 0
    ..totalSp = 0
    ..totalPosts = 0
    ..followList = ListBuilder()
    ..followListRef = ListBuilder()
    ..followListMe = ListBuilder()
    ..contestRefs = ListBuilder()
    ..videoLink = ''
    ..totalTl = 0
    ..iBANNo = ''
    ..aliciAdSoyad = ''
    ..iBANOk = false
    ..paymentCheck = 0
    ..videoUploadLoading = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => UsersRecord(
        (c) => c
          ..email = snapshot.data['email']
          ..username = snapshot.data['username']
          ..displayName = snapshot.data['display_name']
          ..profilePicUrl = snapshot.data['profile_pic_url']
          ..bio = snapshot.data['bio']
          ..website = snapshot.data['website']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..phoneNumber = snapshot.data['phone_number']
          ..atendantContest =
              safeGet(() => ListBuilder(snapshot.data['atendant_contest']))
          ..totalFollow = snapshot.data['total_follow']
          ..totalFollower = snapshot.data['total_follower']
          ..totalLike = snapshot.data['total_like']
          ..totalSp = snapshot.data['total_sp']
          ..totalPosts = snapshot.data['total_posts']
          ..followList = safeGet(() =>
              ListBuilder(snapshot.data['follow_list'].map((s) => toRef(s))))
          ..followListRef = safeGet(() => ListBuilder(
              snapshot.data['follow_list_ref'].map((s) => toRef(s))))
          ..followListMe = safeGet(() =>
              ListBuilder(snapshot.data['follow_list_me'].map((s) => toRef(s))))
          ..contestRefs = safeGet(() =>
              ListBuilder(snapshot.data['contest_refs'].map((s) => toRef(s))))
          ..videoLink = snapshot.data['video_link']
          ..totalTl = snapshot.data['total_tl']
          ..iBANNo = snapshot.data['IBAN_no']
          ..aliciAdSoyad = snapshot.data['alici_ad_soyad']
          ..iBANOk = snapshot.data['IBAN_ok']
          ..paymentCheck = snapshot.data['payment_check']
          ..videoUploadLoading = snapshot.data['video_upload_loading']
          ..reference = UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String username,
  String displayName,
  String profilePicUrl,
  String bio,
  String website,
  DateTime createdTime,
  String photoUrl,
  String uid,
  String phoneNumber,
  int totalFollow,
  int totalFollower,
  int totalLike,
  int totalSp,
  int totalPosts,
  String videoLink,
  int totalTl,
  String iBANNo,
  String aliciAdSoyad,
  bool iBANOk,
  int paymentCheck,
  bool videoUploadLoading,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..username = username
          ..displayName = displayName
          ..profilePicUrl = profilePicUrl
          ..bio = bio
          ..website = website
          ..createdTime = createdTime
          ..photoUrl = photoUrl
          ..uid = uid
          ..phoneNumber = phoneNumber
          ..atendantContest = null
          ..totalFollow = totalFollow
          ..totalFollower = totalFollower
          ..totalLike = totalLike
          ..totalSp = totalSp
          ..totalPosts = totalPosts
          ..followList = null
          ..followListRef = null
          ..followListMe = null
          ..contestRefs = null
          ..videoLink = videoLink
          ..totalTl = totalTl
          ..iBANNo = iBANNo
          ..aliciAdSoyad = aliciAdSoyad
          ..iBANOk = iBANOk
          ..paymentCheck = paymentCheck
          ..videoUploadLoading = videoUploadLoading));
