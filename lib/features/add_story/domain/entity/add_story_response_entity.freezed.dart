// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_story_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddStoryResponseEntity _$AddStoryResponseEntityFromJson(
    Map<String, dynamic> json) {
  return _AddStoryResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$AddStoryResponseEntity {
  bool? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddStoryResponseEntityCopyWith<AddStoryResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStoryResponseEntityCopyWith<$Res> {
  factory $AddStoryResponseEntityCopyWith(AddStoryResponseEntity value,
          $Res Function(AddStoryResponseEntity) then) =
      _$AddStoryResponseEntityCopyWithImpl<$Res, AddStoryResponseEntity>;
  @useResult
  $Res call({bool? error, String? message});
}

/// @nodoc
class _$AddStoryResponseEntityCopyWithImpl<$Res,
        $Val extends AddStoryResponseEntity>
    implements $AddStoryResponseEntityCopyWith<$Res> {
  _$AddStoryResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddStoryResponseEntityImplCopyWith<$Res>
    implements $AddStoryResponseEntityCopyWith<$Res> {
  factory _$$AddStoryResponseEntityImplCopyWith(
          _$AddStoryResponseEntityImpl value,
          $Res Function(_$AddStoryResponseEntityImpl) then) =
      __$$AddStoryResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? error, String? message});
}

/// @nodoc
class __$$AddStoryResponseEntityImplCopyWithImpl<$Res>
    extends _$AddStoryResponseEntityCopyWithImpl<$Res,
        _$AddStoryResponseEntityImpl>
    implements _$$AddStoryResponseEntityImplCopyWith<$Res> {
  __$$AddStoryResponseEntityImplCopyWithImpl(
      _$AddStoryResponseEntityImpl _value,
      $Res Function(_$AddStoryResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_$AddStoryResponseEntityImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddStoryResponseEntityImpl implements _AddStoryResponseEntity {
  const _$AddStoryResponseEntityImpl({this.error, this.message});

  factory _$AddStoryResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddStoryResponseEntityImplFromJson(json);

  @override
  final bool? error;
  @override
  final String? message;

  @override
  String toString() {
    return 'AddStoryResponseEntity(error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoryResponseEntityImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStoryResponseEntityImplCopyWith<_$AddStoryResponseEntityImpl>
      get copyWith => __$$AddStoryResponseEntityImplCopyWithImpl<
          _$AddStoryResponseEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddStoryResponseEntityImplToJson(
      this,
    );
  }
}

abstract class _AddStoryResponseEntity implements AddStoryResponseEntity {
  const factory _AddStoryResponseEntity(
      {final bool? error,
      final String? message}) = _$AddStoryResponseEntityImpl;

  factory _AddStoryResponseEntity.fromJson(Map<String, dynamic> json) =
      _$AddStoryResponseEntityImpl.fromJson;

  @override
  bool? get error;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$AddStoryResponseEntityImplCopyWith<_$AddStoryResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
