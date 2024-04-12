// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  List<ServicesModel> get servicesModel => throw _privateConstructorUsedError;
  ServicesListModel? get servicesListModel =>
      throw _privateConstructorUsedError;
  List<ServiceData> get servicesListData => throw _privateConstructorUsedError;
  ResponseItem? get responseItem => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<ServicesModel> servicesModel,
      ServicesListModel? servicesListModel,
      List<ServiceData> servicesListData,
      ResponseItem? responseItem,
      bool isLoading,
      String message});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servicesModel = null,
    Object? servicesListModel = freezed,
    Object? servicesListData = null,
    Object? responseItem = freezed,
    Object? isLoading = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      servicesModel: null == servicesModel
          ? _value.servicesModel
          : servicesModel // ignore: cast_nullable_to_non_nullable
              as List<ServicesModel>,
      servicesListModel: freezed == servicesListModel
          ? _value.servicesListModel
          : servicesListModel // ignore: cast_nullable_to_non_nullable
              as ServicesListModel?,
      servicesListData: null == servicesListData
          ? _value.servicesListData
          : servicesListData // ignore: cast_nullable_to_non_nullable
              as List<ServiceData>,
      responseItem: freezed == responseItem
          ? _value.responseItem
          : responseItem // ignore: cast_nullable_to_non_nullable
              as ResponseItem?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ServicesModel> servicesModel,
      ServicesListModel? servicesListModel,
      List<ServiceData> servicesListData,
      ResponseItem? responseItem,
      bool isLoading,
      String message});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servicesModel = null,
    Object? servicesListModel = freezed,
    Object? servicesListData = null,
    Object? responseItem = freezed,
    Object? isLoading = null,
    Object? message = null,
  }) {
    return _then(_$HomeStateImpl(
      servicesModel: null == servicesModel
          ? _value._servicesModel
          : servicesModel // ignore: cast_nullable_to_non_nullable
              as List<ServicesModel>,
      servicesListModel: freezed == servicesListModel
          ? _value.servicesListModel
          : servicesListModel // ignore: cast_nullable_to_non_nullable
              as ServicesListModel?,
      servicesListData: null == servicesListData
          ? _value._servicesListData
          : servicesListData // ignore: cast_nullable_to_non_nullable
              as List<ServiceData>,
      responseItem: freezed == responseItem
          ? _value.responseItem
          : responseItem // ignore: cast_nullable_to_non_nullable
              as ResponseItem?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {final List<ServicesModel> servicesModel = const [],
      this.servicesListModel,
      final List<ServiceData> servicesListData = const [],
      this.responseItem,
      this.isLoading = false,
      this.message = ''})
      : _servicesModel = servicesModel,
        _servicesListData = servicesListData;

  final List<ServicesModel> _servicesModel;
  @override
  @JsonKey()
  List<ServicesModel> get servicesModel {
    if (_servicesModel is EqualUnmodifiableListView) return _servicesModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servicesModel);
  }

  @override
  final ServicesListModel? servicesListModel;
  final List<ServiceData> _servicesListData;
  @override
  @JsonKey()
  List<ServiceData> get servicesListData {
    if (_servicesListData is EqualUnmodifiableListView)
      return _servicesListData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servicesListData);
  }

  @override
  final ResponseItem? responseItem;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'HomeState(servicesModel: $servicesModel, servicesListModel: $servicesListModel, servicesListData: $servicesListData, responseItem: $responseItem, isLoading: $isLoading, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality()
                .equals(other._servicesModel, _servicesModel) &&
            (identical(other.servicesListModel, servicesListModel) ||
                other.servicesListModel == servicesListModel) &&
            const DeepCollectionEquality()
                .equals(other._servicesListData, _servicesListData) &&
            (identical(other.responseItem, responseItem) ||
                other.responseItem == responseItem) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_servicesModel),
      servicesListModel,
      const DeepCollectionEquality().hash(_servicesListData),
      responseItem,
      isLoading,
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final List<ServicesModel> servicesModel,
      final ServicesListModel? servicesListModel,
      final List<ServiceData> servicesListData,
      final ResponseItem? responseItem,
      final bool isLoading,
      final String message}) = _$HomeStateImpl;

  @override
  List<ServicesModel> get servicesModel;
  @override
  ServicesListModel? get servicesListModel;
  @override
  List<ServiceData> get servicesListData;
  @override
  ResponseItem? get responseItem;
  @override
  bool get isLoading;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
