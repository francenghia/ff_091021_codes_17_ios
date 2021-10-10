import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'complaints_record.g.dart';

abstract class ComplaintsRecord
    implements Built<ComplaintsRecord, ComplaintsRecordBuilder> {
  static Serializer<ComplaintsRecord> get serializer =>
      _$complaintsRecordSerializer;

  @nullable
  String get action;

  @nullable
  @BuiltValueField(wireName: 'action_time')
  DateTime get actionTime;

  @nullable
  String get cause;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  DocumentReference get user;

  @nullable
  String get username;

  @nullable
  @BuiltValueField(wireName: 'user_email')
  String get userEmail;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ComplaintsRecordBuilder builder) => builder
    ..action = ''
    ..cause = ''
    ..username = ''
    ..userEmail = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('complaints');

  static Stream<ComplaintsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ComplaintsRecord._();
  factory ComplaintsRecord([void Function(ComplaintsRecordBuilder) updates]) =
      _$ComplaintsRecord;

  static ComplaintsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createComplaintsRecordData({
  String action,
  DateTime actionTime,
  String cause,
  DateTime createdTime,
  DocumentReference user,
  String username,
  String userEmail,
}) =>
    serializers.toFirestore(
        ComplaintsRecord.serializer,
        ComplaintsRecord((c) => c
          ..action = action
          ..actionTime = actionTime
          ..cause = cause
          ..createdTime = createdTime
          ..user = user
          ..username = username
          ..userEmail = userEmail));
