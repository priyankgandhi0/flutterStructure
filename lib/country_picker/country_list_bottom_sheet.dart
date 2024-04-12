import 'package:flutter/material.dart';

import 'country.dart';
import 'country_list_theme_data.dart';
import 'country_list_view.dart';

void showCountryListBottomSheet({
  required BuildContext context,
  required ValueChanged<Country> onSelect,
  VoidCallback? onClosed,
  List<String>? favorite,
  List<String>? exclude,
  List<String>? countryFilter,
  bool showPhoneCode = false,
  CountryListThemeData? countryListTheme,
  bool searchAutofocus = false,
  bool showWorldWide = false,
  bool showSearch = true,
  bool useSafeArea = false,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    useSafeArea: useSafeArea,
    builder: (context) => _builder(
      context,
      onSelect,
      favorite,
      exclude,
      countryFilter,
      showPhoneCode,
      countryListTheme,
      searchAutofocus,
      showWorldWide,
      showSearch,
    ),
  ).whenComplete(() {
    if (onClosed != null) onClosed();
  });
}

Widget _builder(
  BuildContext context,
  ValueChanged<Country> onSelect,
  List<String>? favorite,
  List<String>? exclude,
  List<String>? countryFilter,
  bool showPhoneCode,
  CountryListThemeData? countryListTheme,
  bool searchAutofocus,
  bool showWorldWide,
  bool showSearch,
) {
  final device = MediaQuery.of(context).size.height;
  final statusBarHeight = MediaQuery.of(context).padding.top;
  final height = countryListTheme?.bottomSheetHeight ??
      device - (statusBarHeight + (kToolbarHeight / 1.5));

  Color? backgroundColor = countryListTheme?.backgroundColor ??
      Theme.of(context).bottomSheetTheme.backgroundColor;
  if (backgroundColor == null) {
    if (Theme.of(context).brightness == Brightness.light) {
      backgroundColor = Colors.white;
    } else {
      backgroundColor = Colors.black;
    }
  }

  final BorderRadius borderRadius = countryListTheme?.borderRadius ??
      const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      );

  return Container(
    height: height,
    padding: countryListTheme?.padding,
    margin: countryListTheme?.margin,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: borderRadius,
    ),
    child: CountryListView(
      onSelect: onSelect,
      exclude: exclude,
      favorite: favorite,
      countryFilter: countryFilter,
      showPhoneCode: showPhoneCode,
      countryListTheme: countryListTheme,
      searchAutofocus: searchAutofocus,
      showWorldWide: showWorldWide,
      showSearch: showSearch,
    ),
  );
}
