// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stories_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoriesResponseEntity _$StoriesResponseEntityFromJson(
    Map<String, dynamic> json) {
  return _StoriesResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$StoriesResponseEntity {
  bool? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<StoryEntity>? get listStory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoriesResponseEntityCopyWith<StoriesResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoriesResponseEntityCopyWith<$Res> {
  factory $StoriesResponseEntityCopyWith(StoriesResponseEntity value,
          $Res Function(StoriesResponseEntity) then) =
      _$StoriesResponseEntityCopyWithImpl<$Res, StoriesResponseEntity>;
  @useResult
  $Res call({bool? error, String? message, List<StoryEntity>? listStory});
}

/// @nodoc
class _$StoriesResponseEntityCopyWithImpl<$Res,
        $Val extends StoriesResponseEntity>
    implements $StoriesResponseEntityCopyWith<$Res> {
  _$StoriesResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? listStory = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listStory: freezed == listStory
          ? _value.listStory
          : listStory // ignore: cast_nullable_to_non_nullable
              as List<StoryEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoriesResponseEntityImplCopyWith<$Res>
    implements $StoriesResponseEntityCopyWith<$Res> {
  factory _$$StoriesResponseEntityImplCopyWith(
          _$StoriesResponseEntityImpl value,
          $Res Function(_$StoriesResponseEntityImpl) then) =
      __$$StoriesResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? error, String? message, List<StoryEntity>? listStory});
}

/// @nodoc
class __$$StoriesResponseEntityImplCopyWithImpl<$Res>
    extends _$StoriesResponseEntityCopyWithImpl<$Res,
        _$StoriesResponseEntityImpl>
    implements _$$StoriesResponseEntityImplCopyWith<$Res> {
  __$$StoriesResponseEntityImplCopyWithImpl(_$StoriesResponseEntityImpl _value,
      $Res Function(_$StoriesResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? listStory = freezed,
  }) {
    return _then(_$StoriesResponseEntityImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listStory: freezed == listStory
          ? _value._listStory
          : listStory // ignore: cast_nullable_to_non_nullable
              as List<StoryEntity>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoriesResponseEntityImpl implements _StoriesResponseEntity {
  const _$StoriesResponseEntityImpl(
      {this.error, this.message, final List<StoryEntity>? listStory})
      : _listStory = listStory;

  factory _$StoriesResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoriesResponseEntityImplFromJson(json);

  @override
  final bool? error;
  @override
  final String? message;
  final List<StoryEntity>? _listStory;
  @override
  List<StoryEntity>? get listStory {
    final value = _listStory;
    if (value == null) return null;
    if (_listStory is EqualUnmodifiableListView) return _listStory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StoriesResponseEntity(error: $error, message: $message, listStory: $listStory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoriesResponseEntityImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._listStory, _listStory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message,
      const DeepCollectionEquality().hash(_listStory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoriesResponseEntityImplCopyWith<_$StoriesResponseEntityImpl>
      get copyWith => __$$StoriesResponseEntityImplCopyWithImpl<
          _$StoriesResponseEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoriesResponseEntityImplToJson(
      this,
    );
  }
}

abstract class _StoriesResponseEntity implements StoriesResponseEntity {
  const factory _StoriesResponseEntity(
      {final bool? error,
      final String? message,
      final List<StoryEntity>? listStory}) = _$StoriesResponseEntityImpl;

  factory _StoriesResponseEntity.fromJson(Map<String, dynamic> json) =
      _$StoriesResponseEntityImpl.fromJson;

  @override
  bool? get error;
  @override
  String? get message;
  @override
  List<StoryEntity>? get listStory;
  @override
  @JsonKey(ignore: true)
  _$$StoriesResponseEntityImplCopyWith<_$StoriesResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
