import 'dart:io';

// import 'package:codonnier_network/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ButtonType { follow, following, remove, followBack }

String devUrl = 'http://codonnier.tech/dipak/chef_pop/dev/Service.php';
String liveUrl = 'http://codonnier.tech/dipak/chef_pop/dev/Service.php';
String token = '';
String devImageUrl =
    'http://codonnier.tech/dipak/chef_pop/app_images/';
String devChefImageUrl =
    'http://codonnier.tech/dipak/chef_pop/app_images/chef_images/';
String devProfileImageUrl =
    'http://codonnier.tech/dipak/chef_pop/app_images/profile_images/';
String devAudioUrl =
    'https://codonnier.tech/naitik/chatta_box/app_images/post_data/';
String devCommentAudioUrl =
    'http://codonnier.tech/naitik/chatta_box/app_images/comments_voice/';

String devFeedImageUrl =
    'https://codonnier.tech/naitik/chatta_box/app_images/post_data/';


 const stripePublishableKeyTest =
    "pk_test_51OyoOX08ucy4t2miXsRoOKKk17C33kj8ywXXxTmEgrJl5Q31pPkO4DIOEJcdB0UMiLOUBF4GSihPr47HV4RmAMEt00AoxRYBka";
 const stripePublishableKeyLive =
    "pk_test_51OyoOX08ucy4t2miXsRoOKKk17C33kj8ywXXxTmEgrJl5Q31pPkO4DIOEJcdB0UMiLOUBF4GSihPr47HV4RmAMEt00AoxRYBka";


// late RestClient restClient;

double myLat = 0.0;
double myLon = 0.0;
const int LIMIT = 20;
const double serviceFeeInterest=0.05;
const double estimatedTaxInterest=0.10;

List<int> generateNumbers(int start, int end) {
  List<int> numbers = [];
  for (int i = start; i <= end; i++) {
    numbers.add(i);
  }
  return numbers;
}

final String googleAPIKey = Platform.isAndroid
    ? "AIzaSyCC_GrO0peF27v5Uf2hgsnkoFGbT4ga9kw"
    : "AIzaSyCC_GrO0peF27v5Uf2hgsnkoFGbT4ga9kw";
List<String> googleSearchCountry = ["in,us"];
List<int> ageList = generateNumbers(1, 100);

class RemoveSpaceAfterHashFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Check if the new value contains a '#' and a space after it
    if (newValue.text.endsWith('# ') && newValue.text.length > 1) {
      // Remove the space after the '#'
      return TextEditingValue(
        text: newValue.text.substring(0, newValue.text.length - 1),
        selection: TextSelection.collapsed(
          offset: newValue.selection.end - 1,
        ),
      );
    }
    return newValue;
  }
}

hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}
