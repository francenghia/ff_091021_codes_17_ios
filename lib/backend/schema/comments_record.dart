import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comments_record.g.dart';

abstract class CommentsRecord
    implements Built<CommentsRecord, CommentsRecordBuilder> {
  static Serializer<CommentsRecord> get serializer =>
      _$commentsRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  String get comment;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'user_photo')
  String get userPhoto;

  @nullable
  String get username;

  @nullable
  DocumentReference get postid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CommentsRecordBuilder builder) => builder
    ..comment = ''
    ..userPhoto = ''
    ..username = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CommentsRecord._();
  factory CommentsRecord([void Function(CommentsRecordBuilder) updates]) =
      _$CommentsRecord;

  static CommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference user,
  String comment,
  DateTime createdTime,
  String userPhoto,
  String username,
  DocumentReference postid,
}) =>
    serializers.toFirestore(
        CommentsRecord.serializer,
        CommentsRecord((c) => c
          ..user = user
          ..comment = comment
          ..createdTime = createdTime
          ..userPhoto = userPhoto
          ..username = username
          ..postid = postid));
