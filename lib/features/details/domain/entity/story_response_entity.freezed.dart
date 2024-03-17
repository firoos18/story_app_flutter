// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoryResponseEntity _$StoryResponseEntityFromJson(Map<String, dynamic> json) {
  return _StoryResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$StoryResponseEntity {
  bool? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  StoryEntity? get story => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryResponseEntityCopyWith<StoryResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryResponseEntityCopyWith<$Res> {
  factory $StoryResponseEntityCopyWith(
          StoryResponseEntity value, $Res Function(StoryResponseEntity) then) =
      _$StoryResponseEntityCopyWithImpl<$Res, StoryResponseEntity>;
  @useResult
  $Res call({bool? error, String? message, StoryEntity? story});

  $StoryEntityCopyWith<$Res>? get story;
}

/// @nodoc
class _$StoryResponseEntityCopyWithImpl<$Res, $Val extends StoryResponseEntity>
    implements $StoryResponseEntityCopyWith<$Res> {
  _$StoryResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? story = freezed,
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
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as StoryEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryEntityCopyWith<$Res>? get story {
    if (_value.story == null) {
      return null;
    }

    return $StoryEntityCopyWith<$Res>(_value.story!, (value) {
      return _then(_value.copyWith(story: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryResponseEntityImplCopyWith<$Res>
    implements $StoryResponseEntityCopyWith<$Res> {
  factory _$$StoryResponseEntityImplCopyWith(_$StoryResponseEntityImpl value,
          $Res Function(_$StoryResponseEntityImpl) then) =
      __$$StoryResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? error, String? message, StoryEntity? story});

  @override
  $StoryEntityCopyWith<$Res>? get story;
}

/// @nodoc
class __$$StoryResponseEntityImplCopyWithImpl<$Res>
    extends _$StoryResponseEntityCopyWithImpl<$Res, _$StoryResponseEntityImpl>
    implements _$$StoryResponseEntityImplCopyWith<$Res> {
  __$$StoryResponseEntityImplCopyWithImpl(_$StoryResponseEntityImpl _value,
      $Res Function(_$StoryResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? story = freezed,
  }) {
    return _then(_$StoryResponseEntityImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as StoryEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryResponseEntityImpl implements _StoryResponseEntity {
  const _$StoryResponseEntityImpl({this.error, this.message, this.story});

  factory _$StoryResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryResponseEntityImplFromJson(json);

  @override
  final bool? error;
  @override
  final String? message;
  @override
  final StoryEntity? story;

  @override
  String toString() {
    return 'StoryResponseEntity(error: $error, message: $message, story: $story)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryResponseEntityImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.story, story) || other.story == story));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message, story);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryResponseEntityImplCopyWith<_$StoryResponseEntityImpl> get copyWith =>
      __$$StoryResponseEntityImplCopyWithImpl<_$StoryResponseEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryResponseEntityImplToJson(
      this,
    );
  }
}

abstract class _StoryResponseEntity implements StoryResponseEntity {
  const factory _StoryResponseEntity(
      {final bool? error,
      final String? message,
      final StoryEntity? story}) = _$StoryResponseEntityImpl;

  factory _StoryResponseEntity.fromJson(Map<String, dynamic> json) =
      _$StoryResponseEntityImpl.fromJson;

  @override
  bool? get error;
  @override
  String? get message;
  @override
  StoryEntity? get story;
  @override
  @JsonKey(ignore: true)
  _$$StoryResponseEntityImplCopyWith<_$StoryResponseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
