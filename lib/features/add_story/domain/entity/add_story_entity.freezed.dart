// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_story_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddStoryEntity {
  String? get description => throw _privateConstructorUsedError;
  File? get photo => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddStoryEntityCopyWith<AddStoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStoryEntityCopyWith<$Res> {
  factory $AddStoryEntityCopyWith(
          AddStoryEntity value, $Res Function(AddStoryEntity) then) =
      _$AddStoryEntityCopyWithImpl<$Res, AddStoryEntity>;
  @useResult
  $Res call({String? description, File? photo, double? lat, double? lon});
}

/// @nodoc
class _$AddStoryEntityCopyWithImpl<$Res, $Val extends AddStoryEntity>
    implements $AddStoryEntityCopyWith<$Res> {
  _$AddStoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? photo = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as File?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddStoryEntityImplCopyWith<$Res>
    implements $AddStoryEntityCopyWith<$Res> {
  factory _$$AddStoryEntityImplCopyWith(_$AddStoryEntityImpl value,
          $Res Function(_$AddStoryEntityImpl) then) =
      __$$AddStoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? description, File? photo, double? lat, double? lon});
}

/// @nodoc
class __$$AddStoryEntityImplCopyWithImpl<$Res>
    extends _$AddStoryEntityCopyWithImpl<$Res, _$AddStoryEntityImpl>
    implements _$$AddStoryEntityImplCopyWith<$Res> {
  __$$AddStoryEntityImplCopyWithImpl(
      _$AddStoryEntityImpl _value, $Res Function(_$AddStoryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? photo = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_$AddStoryEntityImpl(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as File?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$AddStoryEntityImpl implements _AddStoryEntity {
  const _$AddStoryEntityImpl(
      {this.description, this.photo, this.lat, this.lon});

  @override
  final String? description;
  @override
  final File? photo;
  @override
  final double? lat;
  @override
  final double? lon;

  @override
  String toString() {
    return 'AddStoryEntity(description: $description, photo: $photo, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoryEntityImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, photo, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStoryEntityImplCopyWith<_$AddStoryEntityImpl> get copyWith =>
      __$$AddStoryEntityImplCopyWithImpl<_$AddStoryEntityImpl>(
          this, _$identity);
}

abstract class _AddStoryEntity implements AddStoryEntity {
  const factory _AddStoryEntity(
      {final String? description,
      final File? photo,
      final double? lat,
      final double? lon}) = _$AddStoryEntityImpl;

  @override
  String? get description;
  @override
  File? get photo;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  @JsonKey(ignore: true)
  _$$AddStoryEntityImplCopyWith<_$AddStoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
