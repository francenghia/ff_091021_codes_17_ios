import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'contest_record.g.dart';

abstract class ContestRecord
    implements Built<ContestRecord, ContestRecordBuilder> {
  static Serializer<ContestRecord> get serializer => _$contestRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Subject')
  String get subject;

  @nullable
  String get award;

  @nullable
  @BuiltValueField(wireName: 'start_date')
  DateTime get startDate;

  @nullable
  @BuiltValueField(wireName: 'end_date')
  DateTime get endDate;

  @nullable
  @BuiltValueField(wireName: 'min_like')
  int get minLike;

  @nullable
  String get foto;

  @nullable
  @BuiltValueField(wireName: 'num_of_contestant')
  int get numOfContestant;

  @nullable
  bool get status;

  @nullable
  BuiltList<DocumentReference> get attendies;

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
  @BuiltValueField(wireName: 'award_show')
  bool get awardShow;

  @nullable
  @BuiltValueField(wireName: 'attendies_users')
  BuiltList<DocumentReference> get attendiesUsers;

  @nullable
  int get no;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ContestRecordBuilder builder) => builder
    ..subject = ''
    ..award = ''
    ..minLike = 0
    ..foto = ''
    ..numOfContestant = 0
    ..status = false
    ..attendies = ListBuilder()
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..awardShow = false
    ..attendiesUsers = ListBuilder()
    ..no = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contest');

  static Stream<ContestRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ContestRecord._();
  factory ContestRecord([void Function(ContestRecordBuilder) updates]) =
      _$ContestRecord;

  static ContestRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createContestRecordData({
  String subject,
  String award,
  DateTime startDate,
  DateTime endDate,
  int minLike,
  String foto,
  int numOfContestant,
  bool status,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  bool awardShow,
  int no,
}) =>
    serializers.toFirestore(
        ContestRecord.serializer,
        ContestRecord((c) => c
          ..subject = subject
          ..award = award
          ..startDate = startDate
          ..endDate = endDate
          ..minLike = minLike
          ..foto = foto
          ..numOfContestant = numOfContestant
          ..status = status
          ..attendies = null
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..awardShow = awardShow
          ..attendiesUsers = null
          ..no = no));
