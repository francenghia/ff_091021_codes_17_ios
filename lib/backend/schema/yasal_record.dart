import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'yasal_record.g.dart';

abstract class YasalRecord implements Built<YasalRecord, YasalRecordBuilder> {
  static Serializer<YasalRecord> get serializer => _$yasalRecordSerializer;

  @nullable
  int get no;

  @nullable
  String get metin;

  @nullable
  String get baslik;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(YasalRecordBuilder builder) => builder
    ..no = 0
    ..metin = ''
    ..baslik = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('yasal');

  static Stream<YasalRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  YasalRecord._();
  factory YasalRecord([void Function(YasalRecordBuilder) updates]) =
      _$YasalRecord;

  static YasalRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createYasalRecordData({
  int no,
  String metin,
  String baslik,
}) =>
    serializers.toFirestore(
        YasalRecord.serializer,
        YasalRecord((y) => y
          ..no = no
          ..metin = metin
          ..baslik = baslik));
