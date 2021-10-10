import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'app_rules_record.g.dart';

abstract class AppRulesRecord
    implements Built<AppRulesRecord, AppRulesRecordBuilder> {
  static Serializer<AppRulesRecord> get serializer =>
      _$appRulesRecordSerializer;

  @nullable
  int get no;

  @nullable
  String get rule;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AppRulesRecordBuilder builder) => builder
    ..no = 0
    ..rule = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_rules');

  static Stream<AppRulesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AppRulesRecord._();
  factory AppRulesRecord([void Function(AppRulesRecordBuilder) updates]) =
      _$AppRulesRecord;

  static AppRulesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAppRulesRecordData({
  int no,
  String rule,
}) =>
    serializers.toFirestore(
        AppRulesRecord.serializer,
        AppRulesRecord((a) => a
          ..no = no
          ..rule = rule));
