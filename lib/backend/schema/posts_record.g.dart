// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostsRecord> _$postsRecordSerializer = new _$PostsRecordSerializer();

class _$PostsRecordSerializer implements StructuredSerializer<PostsRecord> {
  @override
  final Iterable<Type> types = const [PostsRecord, _$PostsRecord];
  @override
  final String wireName = 'PostsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PostsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('image_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numLikes;
    if (value != null) {
      result
        ..add('num_likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userProfilePic;
    if (value != null) {
      result
        ..add('user_profile_pic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fotoShow;
    if (value != null) {
      result
        ..add('foto_show')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.videoShow;
    if (value != null) {
      result
        ..add('video_show')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.info;
    if (value != null) {
      result
        ..add('info')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.likedBy;
    if (value != null) {
      result
        ..add('liked_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.tag;
    if (value != null) {
      result
        ..add('tag')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.attendantContest;
    if (value != null) {
      result
        ..add('attendant_contest')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.attendanceContestY;
    if (value != null) {
      result
        ..add('attendance_contest_y')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.ilce;
    if (value != null) {
      result
        ..add('ilce')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.il;
    if (value != null) {
      result
        ..add('il')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ulke;
    if (value != null) {
      result
        ..add('ulke')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.videoLink;
    if (value != null) {
      result
        ..add('video_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deleted;
    if (value != null) {
      result
        ..add('deleted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.lastComment;
    if (value != null) {
      result
        ..add('last_comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastCommentUsername;
    if (value != null) {
      result
        ..add('last_comment_username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastCommentUserPhoto;
    if (value != null) {
      result
        ..add('last_comment_user_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numOfComments;
    if (value != null) {
      result
        ..add('num_of_comments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lastCommentDate;
    if (value != null) {
      result
        ..add('last_comment_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.winner;
    if (value != null) {
      result
        ..add('winner')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.winnerContestName;
    if (value != null) {
      result
        ..add('winner_contest_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.winnerContestEndDate;
    if (value != null) {
      result
        ..add('winner_contest_end_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.objectID;
    if (value != null) {
      result
        ..add('objectID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  PostsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'image_url':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'num_likes':
          result.numLikes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_profile_pic':
          result.userProfilePic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'foto_show':
          result.fotoShow = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'video_show':
          result.videoShow = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'info':
          result.info = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'liked_by':
          result.likedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'tag':
          result.tag = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'attendant_contest':
          result.attendantContest.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'attendance_contest_y':
          result.attendanceContestY.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'ilce':
          result.ilce = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'il':
          result.il = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ulke':
          result.ulke = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video_link':
          result.videoLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deleted':
          result.deleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'last_comment':
          result.lastComment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_comment_username':
          result.lastCommentUsername = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_comment_user_photo':
          result.lastCommentUserPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'num_of_comments':
          result.numOfComments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'last_comment_date':
          result.lastCommentDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'winner':
          result.winner = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'winner_contest_name':
          result.winnerContestName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'winner_contest_end_date':
          result.winnerContestEndDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'objectID':
          result.objectID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$PostsRecord extends PostsRecord {
  @override
  final String imageUrl;
  @override
  final int numLikes;
  @override
  final DocumentReference<Object> user;
  @override
  final String username;
  @override
  final String userProfilePic;
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
  final String phoneNumber;
  @override
  final String video;
  @override
  final bool fotoShow;
  @override
  final bool videoShow;
  @override
  final String info;
  @override
  final String location;
  @override
  final BuiltList<DocumentReference<Object>> likedBy;
  @override
  final String tag;
  @override
  final BuiltList<DocumentReference<Object>> attendantContest;
  @override
  final BuiltList<String> attendanceContestY;
  @override
  final String ilce;
  @override
  final String il;
  @override
  final String ulke;
  @override
  final String videoLink;
  @override
  final bool deleted;
  @override
  final String lastComment;
  @override
  final String lastCommentUsername;
  @override
  final String lastCommentUserPhoto;
  @override
  final int numOfComments;
  @override
  final DateTime lastCommentDate;
  @override
  final bool winner;
  @override
  final String winnerContestName;
  @override
  final DateTime winnerContestEndDate;
  @override
  final String objectID;
  @override
  final DocumentReference<Object> reference;

  factory _$PostsRecord([void Function(PostsRecordBuilder) updates]) =>
      (new PostsRecordBuilder()..update(updates)).build();

  _$PostsRecord._(
      {this.imageUrl,
      this.numLikes,
      this.user,
      this.username,
      this.userProfilePic,
      this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.video,
      this.fotoShow,
      this.videoShow,
      this.info,
      this.location,
      this.likedBy,
      this.tag,
      this.attendantContest,
      this.attendanceContestY,
      this.ilce,
      this.il,
      this.ulke,
      this.videoLink,
      this.deleted,
      this.lastComment,
      this.lastCommentUsername,
      this.lastCommentUserPhoto,
      this.numOfComments,
      this.lastCommentDate,
      this.winner,
      this.winnerContestName,
      this.winnerContestEndDate,
      this.objectID,
      this.reference})
      : super._();

  @override
  PostsRecord rebuild(void Function(PostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsRecordBuilder toBuilder() => new PostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsRecord &&
        imageUrl == other.imageUrl &&
        numLikes == other.numLikes &&
        user == other.user &&
        username == other.username &&
        userProfilePic == other.userProfilePic &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        video == other.video &&
        fotoShow == other.fotoShow &&
        videoShow == other.videoShow &&
        info == other.info &&
        location == other.location &&
        likedBy == other.likedBy &&
        tag == other.tag &&
        attendantContest == other.attendantContest &&
        attendanceContestY == other.attendanceContestY &&
        ilce == other.ilce &&
        il == other.il &&
        ulke == other.ulke &&
        videoLink == other.videoLink &&
        deleted == other.deleted &&
        lastComment == other.lastComment &&
        lastCommentUsername == other.lastCommentUsername &&
        lastCommentUserPhoto == other.lastCommentUserPhoto &&
        numOfComments == other.numOfComments &&
        lastCommentDate == other.lastCommentDate &&
        winner == other.winner &&
        winnerContestName == other.winnerContestName &&
        winnerContestEndDate == other.winnerContestEndDate &&
        objectID == other.objectID &&
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
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, imageUrl.hashCode), numLikes.hashCode), user.hashCode), username.hashCode), userProfilePic.hashCode), email.hashCode), displayName.hashCode), photoUrl.hashCode), uid.hashCode), createdTime.hashCode), phoneNumber.hashCode), video.hashCode), fotoShow.hashCode), videoShow.hashCode), info.hashCode), location.hashCode),
                                                                                likedBy.hashCode),
                                                                            tag.hashCode),
                                                                        attendantContest.hashCode),
                                                                    attendanceContestY.hashCode),
                                                                ilce.hashCode),
                                                            il.hashCode),
                                                        ulke.hashCode),
                                                    videoLink.hashCode),
                                                deleted.hashCode),
                                            lastComment.hashCode),
                                        lastCommentUsername.hashCode),
                                    lastCommentUserPhoto.hashCode),
                                numOfComments.hashCode),
                            lastCommentDate.hashCode),
                        winner.hashCode),
                    winnerContestName.hashCode),
                winnerContestEndDate.hashCode),
            objectID.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostsRecord')
          ..add('imageUrl', imageUrl)
          ..add('numLikes', numLikes)
          ..add('user', user)
          ..add('username', username)
          ..add('userProfilePic', userProfilePic)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('video', video)
          ..add('fotoShow', fotoShow)
          ..add('videoShow', videoShow)
          ..add('info', info)
          ..add('location', location)
          ..add('likedBy', likedBy)
          ..add('tag', tag)
          ..add('attendantContest', attendantContest)
          ..add('attendanceContestY', attendanceContestY)
          ..add('ilce', ilce)
          ..add('il', il)
          ..add('ulke', ulke)
          ..add('videoLink', videoLink)
          ..add('deleted', deleted)
          ..add('lastComment', lastComment)
          ..add('lastCommentUsername', lastCommentUsername)
          ..add('lastCommentUserPhoto', lastCommentUserPhoto)
          ..add('numOfComments', numOfComments)
          ..add('lastCommentDate', lastCommentDate)
          ..add('winner', winner)
          ..add('winnerContestName', winnerContestName)
          ..add('winnerContestEndDate', winnerContestEndDate)
          ..add('objectID', objectID)
          ..add('reference', reference))
        .toString();
  }
}

class PostsRecordBuilder implements Builder<PostsRecord, PostsRecordBuilder> {
  _$PostsRecord _$v;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  int _numLikes;
  int get numLikes => _$this._numLikes;
  set numLikes(int numLikes) => _$this._numLikes = numLikes;

  DocumentReference<Object> _user;
  DocumentReference<Object> get user => _$this._user;
  set user(DocumentReference<Object> user) => _$this._user = user;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _userProfilePic;
  String get userProfilePic => _$this._userProfilePic;
  set userProfilePic(String userProfilePic) =>
      _$this._userProfilePic = userProfilePic;

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

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _video;
  String get video => _$this._video;
  set video(String video) => _$this._video = video;

  bool _fotoShow;
  bool get fotoShow => _$this._fotoShow;
  set fotoShow(bool fotoShow) => _$this._fotoShow = fotoShow;

  bool _videoShow;
  bool get videoShow => _$this._videoShow;
  set videoShow(bool videoShow) => _$this._videoShow = videoShow;

  String _info;
  String get info => _$this._info;
  set info(String info) => _$this._info = info;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  ListBuilder<DocumentReference<Object>> _likedBy;
  ListBuilder<DocumentReference<Object>> get likedBy =>
      _$this._likedBy ??= new ListBuilder<DocumentReference<Object>>();
  set likedBy(ListBuilder<DocumentReference<Object>> likedBy) =>
      _$this._likedBy = likedBy;

  String _tag;
  String get tag => _$this._tag;
  set tag(String tag) => _$this._tag = tag;

  ListBuilder<DocumentReference<Object>> _attendantContest;
  ListBuilder<DocumentReference<Object>> get attendantContest =>
      _$this._attendantContest ??= new ListBuilder<DocumentReference<Object>>();
  set attendantContest(
          ListBuilder<DocumentReference<Object>> attendantContest) =>
      _$this._attendantContest = attendantContest;

  ListBuilder<String> _attendanceContestY;
  ListBuilder<String> get attendanceContestY =>
      _$this._attendanceContestY ??= new ListBuilder<String>();
  set attendanceContestY(ListBuilder<String> attendanceContestY) =>
      _$this._attendanceContestY = attendanceContestY;

  String _ilce;
  String get ilce => _$this._ilce;
  set ilce(String ilce) => _$this._ilce = ilce;

  String _il;
  String get il => _$this._il;
  set il(String il) => _$this._il = il;

  String _ulke;
  String get ulke => _$this._ulke;
  set ulke(String ulke) => _$this._ulke = ulke;

  String _videoLink;
  String get videoLink => _$this._videoLink;
  set videoLink(String videoLink) => _$this._videoLink = videoLink;

  bool _deleted;
  bool get deleted => _$this._deleted;
  set deleted(bool deleted) => _$this._deleted = deleted;

  String _lastComment;
  String get lastComment => _$this._lastComment;
  set lastComment(String lastComment) => _$this._lastComment = lastComment;

  String _lastCommentUsername;
  String get lastCommentUsername => _$this._lastCommentUsername;
  set lastCommentUsername(String lastCommentUsername) =>
      _$this._lastCommentUsername = lastCommentUsername;

  String _lastCommentUserPhoto;
  String get lastCommentUserPhoto => _$this._lastCommentUserPhoto;
  set lastCommentUserPhoto(String lastCommentUserPhoto) =>
      _$this._lastCommentUserPhoto = lastCommentUserPhoto;

  int _numOfComments;
  int get numOfComments => _$this._numOfComments;
  set numOfComments(int numOfComments) => _$this._numOfComments = numOfComments;

  DateTime _lastCommentDate;
  DateTime get lastCommentDate => _$this._lastCommentDate;
  set lastCommentDate(DateTime lastCommentDate) =>
      _$this._lastCommentDate = lastCommentDate;

  bool _winner;
  bool get winner => _$this._winner;
  set winner(bool winner) => _$this._winner = winner;

  String _winnerContestName;
  String get winnerContestName => _$this._winnerContestName;
  set winnerContestName(String winnerContestName) =>
      _$this._winnerContestName = winnerContestName;

  DateTime _winnerContestEndDate;
  DateTime get winnerContestEndDate => _$this._winnerContestEndDate;
  set winnerContestEndDate(DateTime winnerContestEndDate) =>
      _$this._winnerContestEndDate = winnerContestEndDate;

  String _objectID;
  String get objectID => _$this._objectID;
  set objectID(String objectID) => _$this._objectID = objectID;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PostsRecordBuilder() {
    PostsRecord._initializeBuilder(this);
  }

  PostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageUrl = $v.imageUrl;
      _numLikes = $v.numLikes;
      _user = $v.user;
      _username = $v.username;
      _userProfilePic = $v.userProfilePic;
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _video = $v.video;
      _fotoShow = $v.fotoShow;
      _videoShow = $v.videoShow;
      _info = $v.info;
      _location = $v.location;
      _likedBy = $v.likedBy?.toBuilder();
      _tag = $v.tag;
      _attendantContest = $v.attendantContest?.toBuilder();
      _attendanceContestY = $v.attendanceContestY?.toBuilder();
      _ilce = $v.ilce;
      _il = $v.il;
      _ulke = $v.ulke;
      _videoLink = $v.videoLink;
      _deleted = $v.deleted;
      _lastComment = $v.lastComment;
      _lastCommentUsername = $v.lastCommentUsername;
      _lastCommentUserPhoto = $v.lastCommentUserPhoto;
      _numOfComments = $v.numOfComments;
      _lastCommentDate = $v.lastCommentDate;
      _winner = $v.winner;
      _winnerContestName = $v.winnerContestName;
      _winnerContestEndDate = $v.winnerContestEndDate;
      _objectID = $v.objectID;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostsRecord;
  }

  @override
  void update(void Function(PostsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostsRecord build() {
    _$PostsRecord _$result;
    try {
      _$result = _$v ??
          new _$PostsRecord._(
              imageUrl: imageUrl,
              numLikes: numLikes,
              user: user,
              username: username,
              userProfilePic: userProfilePic,
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              video: video,
              fotoShow: fotoShow,
              videoShow: videoShow,
              info: info,
              location: location,
              likedBy: _likedBy?.build(),
              tag: tag,
              attendantContest: _attendantContest?.build(),
              attendanceContestY: _attendanceContestY?.build(),
              ilce: ilce,
              il: il,
              ulke: ulke,
              videoLink: videoLink,
              deleted: deleted,
              lastComment: lastComment,
              lastCommentUsername: lastCommentUsername,
              lastCommentUserPhoto: lastCommentUserPhoto,
              numOfComments: numOfComments,
              lastCommentDate: lastCommentDate,
              winner: winner,
              winnerContestName: winnerContestName,
              winnerContestEndDate: winnerContestEndDate,
              objectID: objectID,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'likedBy';
        _likedBy?.build();

        _$failedField = 'attendantContest';
        _attendantContest?.build();
        _$failedField = 'attendanceContestY';
        _attendanceContestY?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PostsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
