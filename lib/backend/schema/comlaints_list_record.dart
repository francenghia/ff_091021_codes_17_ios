import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comlaints_list_record.g.dart';

abstract class ComlaintsListRecord
    implements Built<ComlaintsListRecord, ComlaintsListRecordBuilder> {
  static Serializer<ComlaintsListRecord> get serializer =>
      _$comlaintsListRecordSerializer;

  @nullable
  String get reason;

  @nullable
  int get no;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ComlaintsListRecordBuilder builder) => builder
    ..reason = ''
    ..no = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comlaints_list');

  static Stream<ComlaintsListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ComlaintsListRecord._();
  factory ComlaintsListRecord(
          [void Function(ComlaintsListRecordBuilder) updates]) =
      _$ComlaintsListRecord;

  static ComlaintsListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createComlaintsListRecordData({
  String reason,
  int no,
}) =>
    serializers.toFirestore(
        ComlaintsListRecord.serializer,
        ComlaintsListRecord((c) => c
          ..reason = reason
          ..no = no));
