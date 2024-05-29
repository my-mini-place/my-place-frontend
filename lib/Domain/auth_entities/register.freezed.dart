// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Register _$RegisterFromJson(Map<String, dynamic> json) {
  return _Register.fromJson(json);
}

/// @nodoc
mixin _$Register {
  String get Email => throw _privateConstructorUsedError;
  String get Password => throw _privateConstructorUsedError;
  String get Name => throw _privateConstructorUsedError;
  String get Surname => throw _privateConstructorUsedError;
  String get PhoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterCopyWith<Register> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterCopyWith<$Res> {
  factory $RegisterCopyWith(Register value, $Res Function(Register) then) =
      _$RegisterCopyWithImpl<$Res, Register>;
  @useResult
  $Res call(
      {String Email,
      String Password,
      String Name,
      String Surname,
      String PhoneNumber});
}

/// @nodoc
class _$RegisterCopyWithImpl<$Res, $Val extends Register>
    implements $RegisterCopyWith<$Res> {
  _$RegisterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Email = null,
    Object? Password = null,
    Object? Name = null,
    Object? Surname = null,
    Object? PhoneNumber = null,
  }) {
    return _then(_value.copyWith(
      Email: null == Email
          ? _value.Email
          : Email // ignore: cast_nullable_to_non_nullable
              as String,
      Password: null == Password
          ? _value.Password
          : Password // ignore: cast_nullable_to_non_nullable
              as String,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Surname: null == Surname
          ? _value.Surname
          : Surname // ignore: cast_nullable_to_non_nullable
              as String,
      PhoneNumber: null == PhoneNumber
          ? _value.PhoneNumber
          : PhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterImplCopyWith<$Res>
    implements $RegisterCopyWith<$Res> {
  factory _$$RegisterImplCopyWith(
          _$RegisterImpl value, $Res Function(_$RegisterImpl) then) =
      __$$RegisterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String Email,
      String Password,
      String Name,
      String Surname,
      String PhoneNumber});
}

/// @nodoc
class __$$RegisterImplCopyWithImpl<$Res>
    extends _$RegisterCopyWithImpl<$Res, _$RegisterImpl>
    implements _$$RegisterImplCopyWith<$Res> {
  __$$RegisterImplCopyWithImpl(
      _$RegisterImpl _value, $Res Function(_$RegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Email = null,
    Object? Password = null,
    Object? Name = null,
    Object? Surname = null,
    Object? PhoneNumber = null,
  }) {
    return _then(_$RegisterImpl(
      Email: null == Email
          ? _value.Email
          : Email // ignore: cast_nullable_to_non_nullable
              as String,
      Password: null == Password
          ? _value.Password
          : Password // ignore: cast_nullable_to_non_nullable
              as String,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Surname: null == Surname
          ? _value.Surname
          : Surname // ignore: cast_nullable_to_non_nullable
              as String,
      PhoneNumber: null == PhoneNumber
          ? _value.PhoneNumber
          : PhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterImpl implements _Register {
  const _$RegisterImpl(
      {required this.Email,
      required this.Password,
      required this.Name,
      required this.Surname,
      required this.PhoneNumber});

  factory _$RegisterImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterImplFromJson(json);

  @override
  final String Email;
  @override
  final String Password;
  @override
  final String Name;
  @override
  final String Surname;
  @override
  final String PhoneNumber;

  @override
  String toString() {
    return 'Register(Email: $Email, Password: $Password, Name: $Name, Surname: $Surname, PhoneNumber: $PhoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterImpl &&
            (identical(other.Email, Email) || other.Email == Email) &&
            (identical(other.Password, Password) ||
                other.Password == Password) &&
            (identical(other.Name, Name) || other.Name == Name) &&
            (identical(other.Surname, Surname) || other.Surname == Surname) &&
            (identical(other.PhoneNumber, PhoneNumber) ||
                other.PhoneNumber == PhoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, Email, Password, Name, Surname, PhoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      __$$RegisterImplCopyWithImpl<_$RegisterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterImplToJson(
      this,
    );
  }
}

abstract class _Register implements Register {
  const factory _Register(
      {required final String Email,
      required final String Password,
      required final String Name,
      required final String Surname,
      required final String PhoneNumber}) = _$RegisterImpl;

  factory _Register.fromJson(Map<String, dynamic> json) =
      _$RegisterImpl.fromJson;

  @override
  String get Email;
  @override
  String get Password;
  @override
  String get Name;
  @override
  String get Surname;
  @override
  String get PhoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
