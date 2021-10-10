import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'follows_record.g.dart';

abstract class FollowsRecord
    implements Built<FollowsRecord, FollowsRecordBuilder> {
  static Serializer<FollowsRecord> get serializer => _$followsRecordSerializer;

  @nullable
  DocumentReference get follower;

  @nullable
  DocumentReference get following;

  @nullable
  @BuiltValueField(wireName: 'follower_profile_pic')
  String get followerProfilePic;

  @nullable
  @BuiltValueField(wireName: 'following_profile_pic')
  String get followingProfilePic;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'user_ref')
  DocumentReference get userRef;

  @nullable
  @BuiltValueField(wireName: 'follower_name')
  String get followerName;

  @nullable
  @BuiltValueField(wireName: 'following_name')
  String get followingName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FollowsRecordBuilder builder) => builder
    ..followerProfilePic = ''
    ..followingProfilePic = ''
    ..email = ''
    ..phoneNumber = ''
    ..followerName = ''
    ..followingName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('follows');

  static Stream<FollowsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static FollowsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      FollowsRecord(
        (c) => c
          ..follower = safeGet(() => toRef(snapshot.data['follower']))
          ..following = safeGet(() => toRef(snapshot.data['following']))
          ..followerProfilePic = snapshot.data['follower_profile_pic']
          ..followingProfilePic = snapshot.data['following_profile_pic']
          ..email = snapshot.data['email']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..userRef = safeGet(() => toRef(snapshot.data['user_ref']))
          ..followerName = snapshot.data['follower_name']
          ..followingName = snapshot.data['following_name']
          ..reference = FollowsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<FollowsRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'follows',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  FollowsRecord._();
  factory FollowsRecord([void Function(FollowsRecordBuilder) updates]) =
      _$FollowsRecord;

  static FollowsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createFollowsRecordData({
  DocumentReference follower,
  DocumentReference following,
  String followerProfilePic,
  String followingProfilePic,
  String email,
  DateTime createdTime,
  String phoneNumber,
  DocumentReference userRef,
  String followerName,
  String followingName,
}) =>
    serializers.toFirestore(
        FollowsRecord.serializer,
        FollowsRecord((f) => f
          ..follower = follower
          ..following = following
          ..followerProfilePic = followerProfilePic
          ..followingProfilePic = followingProfilePic
          ..email = email
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..userRef = userRef
          ..followerName = followerName
          ..followingName = followingName));
