import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import '../model/user_data_model.dart';


final preferences = SharedPreference();

class SharedPreference {
  static SharedPreferences? _preferences;

  init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  // User data
  static const userInfo = "userInfo";
  static const userEmail = "user_email";
  static const firstName = "first_name";
  static const lastName = "last_name";
  static const phoneNum = "phone_num";
  static const userToken = "user_token";
  static const pushNotificationToken = "push_notification_token";
  static const about = "about";
  static const userProfileImage = "user_profile_image";

  static const isLogIn = "isLogIn";
  static const userType = "userType";
  static const chefAddInfo = "chefAddInfo";
  static const isTheme = "isTheme";
  static const appDeviceType = "App-Device-Type";
  static const appStoreVersion = "App-Store-Version";
  static const appDeviceModel = "App-Device-Model";
  static const appOsVersion = "App-Os-Version";
  static const appStoreBuildNumber = "App-Store-Build-Number";
  static const authToken = "Auth-Token";
  static const String isDarkMode = "isDarkMode";
  static const String isVerifyByAdmin = "isVerifyByAdmin";
  static const CUR_LAT = "cur_lat";
  static const CUR_LONG = "cur_long";

  saveUserItem(UserDataModel userItem) {
    preferences.putBool(isLogIn, true);
    preferences.putString(userEmail, userItem.data?.email??'');
    preferences.putString(firstName, userItem.data?.userName??'');
    preferences.putString(lastName, userItem.data?.userName??'');
    preferences.putString(phoneNum, userItem.data?.phoneNumber??'');
    // preferences.putString(userType, userItem.data?.userType??'');
    preferences.putString(userProfileImage, userItem.data?.userProfilePic??'');
    // preferences.putInt(chefAddInfo, userItem.data.isAddInfo??0);
    preferences.putString(userToken, userItem.data?.userToken??'');
    preferences.putString(authToken, userItem.data?.authToken??'');
    // preferences.putInt(isVerifyByAdmin, userItem.data.isVerifyByAdmin??1);
    _preferences!.setString(userInfo, jsonEncode(userItem.toJson()));
  }

  // void saveChefInfo(ChefInfoModel chefInfo) {
  //   _preferences?.setString('chefInfo', jsonEncode(chefInfo.toJson()));
  // }
  //
  // void saveChefCuisineType(ChefCuisineType cuisineType) {
  //   _preferences?.setString('chefCuisineType', jsonEncode(cuisineType.toJson()));
  // }

  // Method to retrieve ChefInfoModel from SharedPreferences
  /*ChefCuisineType? getChefCuisineType() {
    final String? chefCuisineTypeJson = _preferences?.getString('chefCuisineType');
    if (chefCuisineTypeJson != null) {
      return ChefCuisineType.fromJson(jsonDecode(chefCuisineTypeJson));
    }
    return null;
  }

  ChefInfoModel? getChefInfo() {
    final String? chefInfoJson = _preferences?.getString('chefInfo');
    if (chefInfoJson != null) {
      return ChefInfoModel.fromJson(jsonDecode(chefInfoJson));
    }
    return null;
  }*/
  UserDataModel? getUserData() {
    final String? userDataJson = _preferences?.getString(userInfo);
    if (userDataJson != null) {
      return UserDataModel.fromJson(jsonDecode(userDataJson));
    }
    return null;
  }

  void clearUserInfo() async {
    _preferences?.clear();
    _preferences = null;
    await init();
    putAppDeviceInfo();
  }

  putAppDeviceInfo() async {
    bool isiOS = Platform.isIOS;
    putString(appDeviceType, isiOS ? "iOS" : "android");
    var deviceInfo = await appDeviceInfo();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (isiOS) {
      IosDeviceInfo iosDeviceInfo = (deviceInfo as IosDeviceInfo);
      putString(appDeviceModel, "Test");
      putString(appOsVersion, "iOS ${iosDeviceInfo.systemVersion}");
    } else {
      AndroidDeviceInfo androidDeviceInfo = (deviceInfo as AndroidDeviceInfo);
      putString(appDeviceModel, androidDeviceInfo.model);
      putString(appOsVersion, androidDeviceInfo.version.release);
    }
    putString(appStoreVersion, packageInfo.version);
    putString(appStoreBuildNumber, packageInfo.buildNumber);
  }

  Future<dynamic> appDeviceInfo() async {
    return Platform.isIOS
        ? await DeviceInfoPlugin().iosInfo
        : await DeviceInfoPlugin().androidInfo;
  }

  Future<bool?> putString(String key, String value) async {
    if (_preferences == null) {
      return null;
    } else {
      return _preferences!.setString(key, value);
    }
  }

  String? getString(String key, {String defValue = ""}) {
    return _preferences == null
        ? defValue
        : _preferences!.getString(key) ?? defValue;
  }

  Future<bool?> putList(String key, List<String> value) async {
    if (_preferences == null) {
      return null;
    } else {
      return _preferences!.setStringList(key, value);
    }
  }

  List<String>? getList(String key, {List<String> defValue = const []}) {
    return _preferences == null
        ? defValue
        : _preferences!.getStringList(key) ?? defValue;
  }

  Future<bool?> putInt(String key, int value) async {
    if (_preferences == null) {
      return null;
    } else {
      return _preferences!.setInt(key, value);
    }
  }

  int? getInt(String key, {int defValue = 0}) {
    return _preferences == null
        ? defValue
        : _preferences!.getInt(key) ?? defValue;
  }

  Future<bool?> putDouble(String key, double value) async {
    if (_preferences == null) {
      return null;
    } else {
      return _preferences!.setDouble(key, value);
    }
  }

  double getDouble(String key, {double defValue = 0.0}) {
    return _preferences == null
        ? defValue
        : _preferences!.getDouble(key) ?? defValue;
  }

  bool? getBool(String key, {bool defValue = false}) {
    return _preferences == null
        ? defValue
        : _preferences!.getBool(key) ?? defValue;
  }

  Future<bool?> putBool(String key, bool value) async {
    if (_preferences == null) {
      return null;
    } else {
      return _preferences!.setBool(key, value);
    }
  }
}
