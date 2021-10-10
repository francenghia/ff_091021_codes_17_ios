import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'image_url')
  String get imageUrl;

  @nullable
  @BuiltValueField(wireName: 'num_likes')
  int get numLikes;

  @nullable
  DocumentReference get user;

  @nullable
  String get username;

  @nullable
  @BuiltValueField(wireName: 'user_profile_pic')
  String get userProfilePic;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get video;

  @nullable
  @BuiltValueField(wireName: 'foto_show')
  bool get fotoShow;

  @nullable
  @BuiltValueField(wireName: 'video_show')
  bool get videoShow;

  @nullable
  String get info;

  @nullable
  String get location;

  @nullable
  @BuiltValueField(wireName: 'liked_by')
  BuiltList<DocumentReference> get likedBy;

  @nullable
  String get tag;

  @nullable
  @BuiltValueField(wireName: 'attendant_contest')
  BuiltList<DocumentReference> get attendantContest;

  @nullable
  @BuiltValueField(wireName: 'attendance_contest_y')
  BuiltList<String> get attendanceContestY;

  @nullable
  String get ilce;

  @nullable
  String get il;

  @nullable
  String get ulke;

  @nullable
  @BuiltValueField(wireName: 'video_link')
  String get videoLink;

  @nullable
  bool get deleted;

  @nullable
  @BuiltValueField(wireName: 'last_comment')
  String get lastComment;

  @nullable
  @BuiltValueField(wireName: 'last_comment_username')
  String get lastCommentUsername;

  @nullable
  @BuiltValueField(wireName: 'last_comment_user_photo')
  String get lastCommentUserPhoto;

  @nullable
  @BuiltValueField(wireName: 'num_of_comments')
  int get numOfComments;

  @nullable
  @BuiltValueField(wireName: 'last_comment_date')
  DateTime get lastCommentDate;

  @nullable
  bool get winner;

  @nullable
  @BuiltValueField(wireName: 'winner_contest_name')
  String get winnerContestName;

  @nullable
  @BuiltValueField(wireName: 'winner_contest_end_date')
  DateTime get winnerContestEndDate;

  @nullable
  String get objectID;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..imageUrl = ''
    ..numLikes = 0
    ..username = ''
    ..userProfilePic = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..video = ''
    ..fotoShow = false
    ..videoShow = false
    ..info = ''
    ..location = ''
    ..likedBy = ListBuilder()
    ..tag = ''
    ..attendantContest = ListBuilder()
    ..attendanceContestY = ListBuilder()
    ..ilce = ''
    ..il = ''
    ..ulke = ''
    ..videoLink = ''
    ..deleted = false
    ..lastComment = ''
    ..lastCommentUsername = ''
    ..lastCommentUserPhoto = ''
    ..numOfComments = 0
    ..winner = false
    ..winnerContestName = ''
    ..objectID = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static PostsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => PostsRecord(
        (c) => c
          ..imageUrl = snapshot.data['image_url']
          ..numLikes = snapshot.data['num_likes']
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..username = snapshot.data['username']
          ..userProfilePic = snapshot.data['user_profile_pic']
          ..email = snapshot.data['email']
          ..displayName = snapshot.data['display_name']
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..video = snapshot.data['video']
          ..fotoShow = snapshot.data['foto_show']
          ..videoShow = snapshot.data['video_show']
          ..info = snapshot.data['info']
          ..location = snapshot.data['location']
          ..likedBy = safeGet(
              () => ListBuilder(snapshot.data['liked_by'].map((s) => toRef(s))))
          ..tag = snapshot.data['tag']
          ..attendantContest = safeGet(() => ListBuilder(
              snapshot.data['attendant_contest'].map((s) => toRef(s))))
          ..attendanceContestY =
              safeGet(() => ListBuilder(snapshot.data['attendance_contest_y']))
          ..ilce = snapshot.data['ilce']
          ..il = snapshot.data['il']
          ..ulke = snapshot.data['ulke']
          ..videoLink = snapshot.data['video_link']
          ..deleted = snapshot.data['deleted']
          ..lastComment = snapshot.data['last_comment']
          ..lastCommentUsername = snapshot.data['last_comment_username']
          ..lastCommentUserPhoto = snapshot.data['last_comment_user_photo']
          ..numOfComments = snapshot.data['num_of_comments']
          ..lastCommentDate = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['last_comment_date']))
          ..winner = snapshot.data['winner']
          ..winnerContestName = snapshot.data['winner_contest_name']
          ..winnerContestEndDate = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(
                  snapshot.data['winner_contest_end_date']))
          ..objectID = snapshot.data['objectID']
          ..reference = PostsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PostsRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'posts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPostsRecordData({
  String imageUrl,
  int numLikes,
  DocumentReference user,
  String username,
  String userProfilePic,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String video,
  bool fotoShow,
  bool videoShow,
  String info,
  String location,
  String tag,
  String ilce,
  String il,
  String ulke,
  String videoLink,
  bool deleted,
  String lastComment,
  String lastCommentUsername,
  String lastCommentUserPhoto,
  int numOfComments,
  DateTime lastCommentDate,
  bool winner,
  String winnerContestName,
  DateTime winnerContestEndDate,
  String objectID,
}) =>
    serializers.toFirestore(
        PostsRecord.serializer,
        PostsRecord((p) => p
          ..imageUrl = imageUrl
          ..numLikes = numLikes
          ..user = user
          ..username = username
          ..userProfilePic = userProfilePic
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..video = video
          ..fotoShow = fotoShow
          ..videoShow = videoShow
          ..info = info
          ..location = location
          ..likedBy = null
          ..tag = tag
          ..attendantContest = null
          ..attendanceContestY = null
          ..ilce = ilce
          ..il = il
          ..ulke = ulke
          ..videoLink = videoLink
          ..deleted = deleted
          ..lastComment = lastComment
          ..lastCommentUsername = lastCommentUsername
          ..lastCommentUserPhoto = lastCommentUserPhoto
          ..numOfComments = numOfComments
          ..lastCommentDate = lastCommentDate
          ..winner = winner
          ..winnerContestName = winnerContestName
          ..winnerContestEndDate = winnerContestEndDate
          ..objectID = objectID));
