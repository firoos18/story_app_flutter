// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterResponseEntity _$RegisterResponseEntityFromJson(
    Map<String, dynamic> json) {
  return _RegisterResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$RegisterResponseEntity {
  bool? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterResponseEntityCopyWith<RegisterResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResponseEntityCopyWith<$Res> {
  factory $RegisterResponseEntityCopyWith(RegisterResponseEntity value,
          $Res Function(RegisterResponseEntity) then) =
      _$RegisterResponseEntityCopyWithImpl<$Res, RegisterResponseEntity>;
  @useResult
  $Res call({bool? error, String? message});
}

/// @nodoc
class _$RegisterResponseEntityCopyWithImpl<$Res,
        $Val extends RegisterResponseEntity>
    implements $RegisterResponseEntityCopyWith<$Res> {
  _$RegisterResponseEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$RegisterResponseEntityImplCopyWith<$Res>
    implements $RegisterResponseEntityCopyWith<$Res> {
  factory _$$RegisterResponseEntityImplCopyWith(
          _$RegisterResponseEntityImpl value,
          $Res Function(_$RegisterResponseEntityImpl) then) =
      __$$RegisterResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? error, String? message});
}

/// @nodoc
class __$$RegisterResponseEntityImplCopyWithImpl<$Res>
    extends _$RegisterResponseEntityCopyWithImpl<$Res,
        _$RegisterResponseEntityImpl>
    implements _$$RegisterResponseEntityImplCopyWith<$Res> {
  __$$RegisterResponseEntityImplCopyWithImpl(
      _$RegisterResponseEntityImpl _value,
      $Res Function(_$RegisterResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_$RegisterResponseEntityImpl(
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
class _$RegisterResponseEntityImpl implements _RegisterResponseEntity {
  const _$RegisterResponseEntityImpl({this.error, this.message});

  factory _$RegisterResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterResponseEntityImplFromJson(json);

  @override
  final bool? error;
  @override
  final String? message;

  @override
  String toString() {
    return 'RegisterResponseEntity(error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterResponseEntityImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterResponseEntityImplCopyWith<_$RegisterResponseEntityImpl>
      get copyWith => __$$RegisterResponseEntityImplCopyWithImpl<
          _$RegisterResponseEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterResponseEntityImplToJson(
      this,
    );
  }
}

abstract class _RegisterResponseEntity implements RegisterResponseEntity {
  const factory _RegisterResponseEntity(
      {final bool? error,
      final String? message}) = _$RegisterResponseEntityImpl;

  factory _RegisterResponseEntity.fromJson(Map<String, dynamic> json) =
      _$RegisterResponseEntityImpl.fromJson;

  @override
  bool? get error;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$RegisterResponseEntityImplCopyWith<_$RegisterResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
