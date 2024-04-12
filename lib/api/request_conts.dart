

import '../utils/preference.dart';

const bool isLive=true;

class ApiUrl {
  static const stripePublishableKeyTest =
      "pk_test_51OpafiDkzMW0It3aRjMm0Td0zeMzkgfrFMC4CjB6ASEQx3ZNuxEwt2KalZfCeV5gydaPlA3FQ6dXFCgVpvKgJI7k00C06Jz5bl";
  static const stripePublishableKeyLive =
      "pk_live_51OpafiDkzMW0It3abBtIydfYCBNNBY0qw89TuH0NPBYzJong7QX7wpEPG4V1LWr6RxqjHrm19xVHG8is8OYXxt4800F8dIgOGr";
  static const stripePublishableKey = isLive
      ? stripePublishableKeyLive
      : stripePublishableKeyTest;
  static const String testBaseUrl =
      "http://codonnier.tech/dipak/codeStructure/dev";
  static const String liveBaseUrl =
      "http://codonnier.tech/dipak/codeStructure/dev";
  static const String baseUrl = "${isLive
      ? liveBaseUrl
      : testBaseUrl}/Service.php?Service=";
  static const String imagePath =
      "http://codonnier.tech/dipak/codeStructure/app_images/service_images/";

  // static const String teamImagePath = "$mainImagePath/team_logos/";
  // static const String matchImagePath = "$mainImagePath/match_images/";

}

class ApiEndPoint {
  static const login = "userLogin";
  static const registration = "userRegistration";
  static const getAllServices = "getAllServices";
  static const forgotPassword = "forgotPassword";
  static const changePasswordWithVerifyCode = "changePasswordWithVerifyCode";
  static const changePassword = "changePassword";
  static const editProfile = "editProfile";
  static const uploadPost = "uploadPost";
  static const rePost = "rePost";
  static const getPostList = "getPostList";
  static const getSearchUserList = "getSearchUserList";
  static const searchPostByHastag = "searchPostByHastag";
  static const getUserAccountInfo = "getUserAccountInfo";
  static const getPostCommentList = "getPostCommentList";
  static const addCommentOnPost = "addCommentOnPost";
  static const likeDislikePost = "likeDislikePost";
  static const deletePost = "deletePost";
  static const reportPost = "reportPost";
  static const getFollowerFollowingList = "getFollowerFollowingList";
  static const getNotificationList = "getNotificationList";
  static const updateDeviceToken = "updateDeviceToken";
  static const logout = "logout";
  static const followUser = "followUser";
  static const unfollowUser = "unfollowUser";
  static const removeFollower = "removeFollower";
}

Map<String, String> requestHeader(bool passAuthToken) {
  return {
    RequestHeaderKey.contentType: "application/json",
    RequestHeaderKey.appSecret: "Code@2024#bloc",
    RequestHeaderKey.appTrackVersion: "v1",
    RequestHeaderKey.appDeviceType:
        preferences.getString(SharedPreference.appDeviceType) ?? '',
    RequestHeaderKey.appStoreVersion:
        preferences.getString(SharedPreference.appStoreVersion) ?? '',
    RequestHeaderKey.appDeviceModel:
        preferences.getString(SharedPreference.appDeviceModel) ?? '',
    RequestHeaderKey.appOsVersion:
        preferences.getString(SharedPreference.appOsVersion) ?? '',
    RequestHeaderKey.appStoreBuildNumber:
        preferences.getString(SharedPreference.appStoreBuildNumber) ?? '',
    if (passAuthToken)
      RequestHeaderKey.authToken:
          preferences.getString(SharedPreference.authToken) ?? '',
  };
}

class RequestHeaderKey {
  static const contentType = "Content-Type";
  static const userAgent = "User-Agent";
  static const appSecret = "App-Secret";
  static const appTrackVersion = "App-Track-Version";
  static const appDeviceType = "App-Device-Type";
  static const appStoreVersion = "App-Store-Version";
  static const appDeviceModel = "App-Device-Model";
  static const appOsVersion = "App-Os-Version";
  static const appStoreBuildNumber = "App-Store-Build-Number";
  static const authToken = "Auth-Token";
}

class RequestParam {
  static const service = "Service"; // -> pass method name
  static const showError = "show_error"; // -> bool in String
}