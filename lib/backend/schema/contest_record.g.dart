// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contest_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContestRecord> _$contestRecordSerializer =
    new _$ContestRecordSerializer();

class _$ContestRecordSerializer implements StructuredSerializer<ContestRecord> {
  @override
  final Iterable<Type> types = const [ContestRecord, _$ContestRecord];
  @override
  final String wireName = 'ContestRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ContestRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.subject;
    if (value != null) {
      result
        ..add('Subject')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.award;
    if (value != null) {
      result
        ..add('award')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('start_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('end_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.minLike;
    if (value != null) {
      result
        ..add('min_like')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.foto;
    if (value != null) {
      result
        ..add('foto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numOfContestant;
    if (value != null) {
      result
        ..add('num_of_contestant')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.attendies;
    if (value != null) {
      result
        ..add('attendies')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.awardShow;
    if (value != null) {
      result
        ..add('award_show')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.attendiesUsers;
    if (value != null) {
      result
        ..add('attendies_users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.no;
    if (value != null) {
      result
        ..add('no')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  ContestRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContestRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'Subject':
          result.subject = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'award':
          result.award = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'start_date':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'end_date':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'min_like':
          result.minLike = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'foto':
          result.foto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'num_of_contestant':
          result.numOfContestant = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'attendies':
          result.attendies.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'award_show':
          result.awardShow = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'attendies_users':
          result.attendiesUsers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'no':
          result.no = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$ContestRecord extends ContestRecord {
  @override
  final String subject;
  @override
  final String award;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final int minLike;
  @override
  final String foto;
  @override
  final int numOfContestant;
  @override
  final bool status;
  @override
  final BuiltList<DocumentReference<Object>> attendies;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String photoUrl;
  @override
  final String uid;
  @override
  final DateTime createdTime;
  @override
  final bool awardShow;
  @override
  final BuiltList<DocumentReference<Object>> attendiesUsers;
  @override
  final int no;
  @override
  final DocumentReference<Object> reference;

  factory _$ContestRecord([void Function(ContestRecordBuilder) updates]) =>
      (new ContestRecordBuilder()..update(updates)).build();

  _$ContestRecord._(
      {this.subject,
      this.award,
      this.startDate,
      this.endDate,
      this.minLike,
      this.foto,
      this.numOfContestant,
      this.status,
      this.attendies,
      this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.awardShow,
      this.attendiesUsers,
      this.no,
      this.reference})
      : super._();

  @override
  ContestRecord rebuild(void Function(ContestRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContestRecordBuilder toBuilder() => new ContestRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContestRecord &&
        subject == other.subject &&
        award == other.award &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        minLike == other.minLike &&
        foto == other.foto &&
        numOfContestant == other.numOfContestant &&
        status == other.status &&
        attendies == other.attendies &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        awardShow == other.awardShow &&
        attendiesUsers == other.attendiesUsers &&
        no == other.no &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            subject
                                                                                .hashCode),
                                                                        award
                                                                            .hashCode),
                                                                    startDate
                                                                        .hashCode),
                                                                endDate
                                                                    .hashCode),
                                                            minLike.hashCode),
                                                        foto.hashCode),
                                                    numOfContestant.hashCode),
                                                status.hashCode),
                                            attendies.hashCode),
                                        email.hashCode),
                                    displayName.hashCode),
                                photoUrl.hashCode),
                            uid.hashCode),
                        createdTime.hashCode),
                    awardShow.hashCode),
                attendiesUsers.hashCode),
            no.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContestRecord')
          ..add('subject', subject)
          ..add('award', award)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('minLike', minLike)
          ..add('foto', foto)
          ..add('numOfContestant', numOfContestant)
          ..add('status', status)
          ..add('attendies', attendies)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('awardShow', awardShow)
          ..add('attendiesUsers', attendiesUsers)
          ..add('no', no)
          ..add('reference', reference))
        .toString();
  }
}

class ContestRecordBuilder
    implements Builder<ContestRecord, ContestRecordBuilder> {
  _$ContestRecord _$v;

  String _subject;
  String get subject => _$this._subject;
  set subject(String subject) => _$this._subject = subject;

  String _award;
  String get award => _$this._award;
  set award(String award) => _$this._award = award;

  DateTime _startDate;
  DateTime get startDate => _$this._startDate;
  set startDate(DateTime startDate) => _$this._startDate = startDate;

  DateTime _endDate;
  DateTime get endDate => _$this._endDate;
  set endDate(DateTime endDate) => _$this._endDate = endDate;

  int _minLike;
  int get minLike => _$this._minLike;
  set minLike(int minLike) => _$this._minLike = minLike;

  String _foto;
  String get foto => _$this._foto;
  set foto(String foto) => _$this._foto = foto;

  int _numOfContestant;
  int get numOfContestant => _$this._numOfContestant;
  set numOfContestant(int numOfContestant) =>
      _$this._numOfContestant = numOfContestant;

  bool _status;
  bool get status => _$this._status;
  set status(bool status) => _$this._status = status;

  ListBuilder<DocumentReference<Object>> _attendies;
  ListBuilder<DocumentReference<Object>> get attendies =>
      _$this._attendies ??= new ListBuilder<DocumentReference<Object>>();
  set attendies(ListBuilder<DocumentReference<Object>> attendies) =>
      _$this._attendies = attendies;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  bool _awardShow;
  bool get awardShow => _$this._awardShow;
  set awardShow(bool awardShow) => _$this._awardShow = awardShow;

  ListBuilder<DocumentReference<Object>> _attendiesUsers;
  ListBuilder<DocumentReference<Object>> get attendiesUsers =>
      _$this._attendiesUsers ??= new ListBuilder<DocumentReference<Object>>();
  set attendiesUsers(ListBuilder<DocumentReference<Object>> attendiesUsers) =>
      _$this._attendiesUsers = attendiesUsers;

  int _no;
  int get no => _$this._no;
  set no(int no) => _$this._no = no;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ContestRecordBuilder() {
    ContestRecord._initializeBuilder(this);
  }

  ContestRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _subject = $v.subject;
      _award = $v.award;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _minLike = $v.minLike;
      _foto = $v.foto;
      _numOfContestant = $v.numOfContestant;
      _status = $v.status;
      _attendies = $v.attendies?.toBuilder();
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _awardShow = $v.awardShow;
      _attendiesUsers = $v.attendiesUsers?.toBuilder();
      _no = $v.no;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContestRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContestRecord;
  }

  @override
  void update(void Function(ContestRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContestRecord build() {
    _$ContestRecord _$result;
    try {
      _$result = _$v ??
          new _$ContestRecord._(
              subject: subject,
              award: award,
              startDate: startDate,
              endDate: endDate,
              minLike: minLike,
              foto: foto,
              numOfContestant: numOfContestant,
              status: status,
              attendies: _attendies?.build(),
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              awardShow: awardShow,
              attendiesUsers: _attendiesUsers?.build(),
              no: no,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'attendies';
        _attendies?.build();

        _$failedField = 'attendiesUsers';
        _attendiesUsers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ContestRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
