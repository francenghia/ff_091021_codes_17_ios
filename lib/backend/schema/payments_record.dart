import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'payments_record.g.dart';

abstract class PaymentsRecord
    implements Built<PaymentsRecord, PaymentsRecordBuilder> {
  static Serializer<PaymentsRecord> get serializer =>
      _$paymentsRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'take_amount')
  int get takeAmount;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  String get status;

  @nullable
  @BuiltValueField(wireName: 'update_time')
  DateTime get updateTime;

  @nullable
  @BuiltValueField(wireName: 'user_email')
  String get userEmail;

  @nullable
  @BuiltValueField(wireName: 'user_name')
  String get userName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PaymentsRecordBuilder builder) => builder
    ..takeAmount = 0
    ..status = ''
    ..userEmail = ''
    ..userName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PaymentsRecord._();
  factory PaymentsRecord([void Function(PaymentsRecordBuilder) updates]) =
      _$PaymentsRecord;

  static PaymentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPaymentsRecordData({
  DocumentReference user,
  int takeAmount,
  DateTime createdTime,
  String status,
  DateTime updateTime,
  String userEmail,
  String userName,
}) =>
    serializers.toFirestore(
        PaymentsRecord.serializer,
        PaymentsRecord((p) => p
          ..user = user
          ..takeAmount = takeAmount
          ..createdTime = createdTime
          ..status = status
          ..updateTime = updateTime
          ..userEmail = userEmail
          ..userName = userName));
