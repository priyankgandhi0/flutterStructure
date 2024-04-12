import 'dart:io';


import '../../config/env/build_env.dart';
import '../../model/response_item.dart';
import '../api_helpers.dart';
import '../request_conts.dart';

class MainRepo {
  static MainRepo? _instance;

  MainRepo._();

  static MainRepo get instance => _instance ??= MainRepo._();
  String apiUrl = env?.baseUrl ?? '';



  static Future<ResponseItem> getAllServices() async {
    ResponseItem result;
    bool status = true;
    dynamic data;
    String msg = "";

    String requestUrl = ApiUrl.baseUrl + ApiEndPoint.getAllServices;
    result = await BaseApiHelper.postRequest(appendShowErrorParam(requestUrl,false),
        {});
    status = result.status;
    data = result.data;
    msg = result.message;

    return ResponseItem(data: data, status: status, message: msg);
  }


 /* Future<ResponseItem> editProfile(
      {String? name, String? about, File? imgPath}) async {
    try {
      Response response = await restClient.postFormData(
          APIType.protected,
          apiUrl,
          imgPath != null
              ? {
                  'user_name': name,
                  'about': about,
                  'profile_images': await MultipartFile.fromFile(imgPath.path,
                      filename: 'test.png')
                }
              : {
                  'user_name': name,
                  'about': about,
                },
          headers: requestHeader(APIType.protected),
          query: {
            RequestParam.service: ApiEndPoint.editProfile,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
          message: e.message ?? 'Something went wrong', status: false);
    }
  }

  Future<ResponseItem> getFeedList(
      {required int page, required int limit}) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "page": page,
            "limit": limit,
          },
          query: {
            RequestParam.service: ApiEndPoint.getPostList,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
          message: e.message ?? 'Something went wrong', status: false);
    }
  }

  Future<ResponseItem> searchUser(
      {required int page, required int limit, required String text}) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "page": page,
            "limit": limit,
            "search_txt": text,
          },
          query: {
            RequestParam.service: ApiEndPoint.getSearchUserList,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
          message: e.message ?? 'Something went wrong', status: false);
    }
  }

  Future<ResponseItem> searchPost(
      {required int page, required int limit, required String text,int? showMyPost}) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "page": page,
            "limit": limit,
            "search_txt": text,
            "is_show_my_post" : showMyPost ?? 0,
          },
          query: {
            RequestParam.service: ApiEndPoint.searchPostByHastag,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
          message: e.message ?? 'Something went wrong', status: false);
    }
  }

  Future<ResponseItem> getCommentList(
      {required int page, required int limit, required int postId}) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "page": page,
            "limit": limit,
            "post_id": postId,
          },
          query: {
            RequestParam.service: ApiEndPoint.getPostCommentList,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
          message: e.message ?? 'Something went wrong', status: false);
    }
  }

  Future<ResponseItem> likeDisLikePost(LikeDisLikeData likeDisLikeData) async {
    try {
      Response response = await restClient.post(
          APIType.protected, apiUrl, likeDisLikeData.toJson(),
          headers: requestHeader(APIType.protected),
          query: {
            RequestParam.service: ApiEndPoint.likeDislikePost,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
          message: e.message ?? 'Something went wrong', status: false);
    }
  }

  Future<ResponseItem> addComment(
      {String? comment,
      required int postId,
      required String type,
      File? imgPath,
      String? seconds,
      String? waveForm}) async {
    try {
      Response response = await restClient.postFormData(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "comments": type == "TEXT" ? comment ?? "" : "",
            "post_id": postId,
            "type": type,
            "wave_form": type == "VOICE" ? waveForm ?? "" : "",
            "seconds": type == "VOICE" ? seconds ?? "" : "",
            "voice_file": type == "VOICE"
                ? await MultipartFile.fromFile(imgPath!.path,
                    filename: imgPath.path.split('/').last)
                : null,
          },
          query: {
            RequestParam.service: ApiEndPoint.addCommentOnPost,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
          message: e.message ?? 'Something went wrong', status: false);
    }
  }

  Future<ResponseItem> getUserInfo({required String userToken}) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "user_token": userToken,
          },
          query: {
            RequestParam.service: ApiEndPoint.getUserAccountInfo,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
          message: e.message ?? 'Something went wrong', status: false);
    }
  }

  Future<ResponseItem> deletePost({required int postId}) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "post_id": postId,
          },
          query: {
            RequestParam.service: ApiEndPoint.deletePost,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
          message: e.message ?? 'Something went wrong', status: false);
    }
  }

  Future<ResponseItem> reportPost({required int postId}) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "post_id": postId,
          },
          query: {
            RequestParam.service: ApiEndPoint.reportPost,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
          message: e.message ?? 'Something went wrong', status: false);
    }
  }

  Future<ResponseItem> uploadPost(
      {File? imgPath,
      String? hashTags,
      String? waveData,
      List<File>? imageList,
      int? totalDuration}) async {
    try {
      List<MultipartFile> multipartList = [];
      if (imageList != null) {
        for (var e in imageList) {
          multipartList.add(await MultipartFile.fromFile(e.path,
              filename: e.path.split('/').last.trim()));
        }
      }

      Response response = await restClient.postFormData(
          APIType.protected,
          apiUrl,
          {
            'wave_form': waveData ?? "",
            'hastags': hashTags ?? "",
            'seconds': totalDuration.toString(),
            'post_name': await MultipartFile.fromFile(imgPath!.path,
                filename: imgPath.path.split('/').last),
            'post_images[]': multipartList,
          },
          headers: requestHeader(APIType.protected),
          query: {
            RequestParam.service: ApiEndPoint.uploadPost,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
          message: e.message ?? 'Something went wrong', status: false);
    }
  }

  Future<ResponseItem> rePost({String? hashTags, required int postId}) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          {
            "post_id": postId,
            'hastags': hashTags ?? "",
          },
          headers: requestHeader(APIType.protected),
          query: {
            RequestParam.service: ApiEndPoint.rePost,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
          message: e.message ?? 'Something went wrong', status: false);
    }
  }

  Future<ResponseItem> getFollowUnfollowList(
      {required int page,
      required int limit,
      required String type,
      required int userId}) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "page": page,
            "limit": limit,
            "type": type,
            "user_id": userId,
          },
          query: {
            RequestParam.service: ApiEndPoint.getFollowerFollowingList,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? 'Something went wrong',
        status: false,
      );
    }
  }

  Future<ResponseItem> getNotificationList({
    required int page,
    required int limit,
  }) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "page": page,
            "limit": limit,
          },
          query: {
            RequestParam.service: ApiEndPoint.getNotificationList,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? 'Something went wrong',
        status: false,
      );
    }
  }

  Future<ResponseItem> followUser({
    required int oppUserId,
  }) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "opposite_user_id": oppUserId,
          },
          query: {
            RequestParam.service: ApiEndPoint.followUser,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? 'Something went wrong',
        status: false,
      );
    }
  }

  Future<ResponseItem> unFollowUser({
    required int oppUserId,
  }) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "opposite_user_id": oppUserId,
          },
          query: {
            RequestParam.service: ApiEndPoint.unfollowUser,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? 'Something went wrong',
        status: false,
      );
    }
  }

  Future<ResponseItem> removeFollower({
    required int oppUserId,
  }) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "opposite_user_id": oppUserId,
          },
          query: {
            RequestParam.service: ApiEndPoint.removeFollower,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? 'Something went wrong',
        status: false,
      );
    }
  }

  Future<ResponseItem> updateDeviceToken({
    required String token,
  }) async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {
            "device_push_token": token,
          },
          query: {
            RequestParam.service: ApiEndPoint.updateDeviceToken,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? 'Something went wrong',
        status: false,
      );
    }
  }

  Future<ResponseItem> logOut() async {
    try {
      Response response = await restClient.post(
          APIType.protected,
          apiUrl,
          headers: requestHeader(APIType.protected),
          {},
          query: {
            RequestParam.service: ApiEndPoint.logout,
            'show_error': true,
          });
      final ResponseItem responseData = ResponseItem.fromJson(response.data);
      return responseData;
    } on Failure catch (e) {
      return ResponseItem(
        message: e.message ?? 'Something went wrong',
        status: false,
      );
    }
  }*/

}
