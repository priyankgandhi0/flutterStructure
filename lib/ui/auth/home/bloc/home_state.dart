

part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<ServicesModel> servicesModel,
    ServicesListModel? servicesListModel,
    @Default([]) List<ServiceData> servicesListData,
    ResponseItem? responseItem,
    @Default(false) bool isLoading,
    @Default('') String message,
}) = _HomeState;


}
