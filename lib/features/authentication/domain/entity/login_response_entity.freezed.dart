// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponseEntity _$LoginResponseEntityFromJson(Map<String, dynamic> json) {
  return _LoginResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$LoginResponseEntity {
  bool? get error => throw _privateConstructorUsedError;
  LoginResultEntity? get loginResult => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseEntityCopyWith<LoginResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseEntityCopyWith<$Res> {
  factory $LoginResponseEntityCopyWith(
          LoginResponseEntity value, $Res Function(LoginResponseEntity) then) =
      _$LoginResponseEntityCopyWithImpl<$Res, LoginResponseEntity>;
  @useResult
  $Res call({bool? error, LoginResultEntity? loginResult, String? message});

  $LoginResultEntityCopyWith<$Res>? get loginResult;
}

/// @nodoc
class _$LoginResponseEntityCopyWithImpl<$Res, $Val extends LoginResponseEntity>
    implements $LoginResponseEntityCopyWith<$Res> {
  _$LoginResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? loginResult = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      loginResult: freezed == loginResult
          ? _value.loginResult
          : loginResult // ignore: cast_nullable_to_non_nullable
              as LoginResultEntity?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginResultEntityCopyWith<$Res>? get loginResult {
    if (_value.loginResult == null) {
      return null;
    }

    return $LoginResultEntityCopyWith<$Res>(_value.loginResult!, (value) {
      return _then(_value.copyWith(loginResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseEntityImplCopyWith<$Res>
    implements $LoginResponseEntityCopyWith<$Res> {
  factory _$$LoginResponseEntityImplCopyWith(_$LoginResponseEntityImpl value,
          $Res Function(_$LoginResponseEntityImpl) then) =
      __$$LoginResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? error, LoginResultEntity? loginResult, String? message});

  @override
  $LoginResultEntityCopyWith<$Res>? get loginResult;
}

/// @nodoc
class __$$LoginResponseEntityImplCopyWithImpl<$Res>
    extends _$LoginResponseEntityCopyWithImpl<$Res, _$LoginResponseEntityImpl>
    implements _$$LoginResponseEntityImplCopyWith<$Res> {
  __$$LoginResponseEntityImplCopyWithImpl(_$LoginResponseEntityImpl _value,
      $Res Function(_$LoginResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? loginResult = freezed,
    Object? message = freezed,
  }) {
    return _then(_$LoginResponseEntityImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      loginResult: freezed == loginResult
          ? _value.loginResult
          : loginResult // ignore: cast_nullable_to_non_nullable
              as LoginResultEntity?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LoginResponseEntityImpl
    with DiagnosticableTreeMixin
    implements _LoginResponseEntity {
  const _$LoginResponseEntityImpl({this.error, this.loginResult, this.message});

  factory _$LoginResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseEntityImplFromJson(json);

  @override
  final bool? error;
  @override
  final LoginResultEntity? loginResult;
  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginResponseEntity(error: $error, loginResult: $loginResult, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginResponseEntity'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('loginResult', loginResult))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseEntityImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.loginResult, loginResult) ||
                other.loginResult == loginResult) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, loginResult, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseEntityImplCopyWith<_$LoginResponseEntityImpl> get copyWith =>
      __$$LoginResponseEntityImplCopyWithImpl<_$LoginResponseEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseEntityImplToJson(
      this,
    );
  }
}

abstract class _LoginResponseEntity implements LoginResponseEntity {
  const factory _LoginResponseEntity(
      {final bool? error,
      final LoginResultEntity? loginResult,
      final String? message}) = _$LoginResponseEntityImpl;

  factory _LoginResponseEntity.fromJson(Map<String, dynamic> json) =
      _$LoginResponseEntityImpl.fromJson;

  @override
  bool? get error;
  @override
  LoginResultEntity? get loginResult;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseEntityImplCopyWith<_$LoginResponseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
