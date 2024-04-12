/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_email.svg
  SvgGenImage get icEmail => const SvgGenImage('assets/icons/ic_email.svg');

  /// File path: assets/icons/ic_hide_password.svg
  SvgGenImage get icHidePassword =>
      const SvgGenImage('assets/icons/ic_hide_password.svg');

  /// File path: assets/icons/ic_line.svg
  SvgGenImage get icLine => const SvgGenImage('assets/icons/ic_line.svg');

  /// File path: assets/icons/ic_lock.svg
  SvgGenImage get icLock => const SvgGenImage('assets/icons/ic_lock.svg');

  /// File path: assets/icons/ic_logout.svg
  SvgGenImage get icLogout => const SvgGenImage('assets/icons/ic_logout.svg');

  /// File path: assets/icons/ic_password_visible.svg
  SvgGenImage get icPasswordVisible =>
      const SvgGenImage('assets/icons/ic_password_visible.svg');

  /// File path: assets/icons/ic_right_arrow.svg
  SvgGenImage get icRightArrow =>
      const SvgGenImage('assets/icons/ic_right_arrow.svg');

  /// File path: assets/icons/ic_search.svg
  SvgGenImage get icSearch => const SvgGenImage('assets/icons/ic_search.svg');

  /// File path: assets/icons/ic_single_line.svg
  SvgGenImage get icSingleLine =>
      const SvgGenImage('assets/icons/ic_single_line.svg');

  /// File path: assets/icons/ic_ui_logo.svg
  SvgGenImage get icUiLogo => const SvgGenImage('assets/icons/ic_ui_logo.svg');

  /// File path: assets/icons/ic_user.svg
  SvgGenImage get icUser => const SvgGenImage('assets/icons/ic_user.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icEmail,
        icHidePassword,
        icLine,
        icLock,
        icLogout,
        icPasswordVisible,
        icRightArrow,
        icSearch,
        icSingleLine,
        icUiLogo,
        icUser
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_android_app.png
  AssetGenImage get imgAndroidApp =>
      const AssetGenImage('assets/images/img_android_app.png');

  /// File path: assets/images/img_flutter.png
  AssetGenImage get imgFlutter =>
      const AssetGenImage('assets/images/img_flutter.png');

  /// File path: assets/images/img_flutter_app.png
  AssetGenImage get imgFlutterApp =>
      const AssetGenImage('assets/images/img_flutter_app.png');

  /// File path: assets/images/img_flutter_logo.svg
  SvgGenImage get imgFlutterLogo =>
      const SvgGenImage('assets/images/img_flutter_logo.svg');

  /// File path: assets/images/img_ios_app.png
  AssetGenImage get imgIosApp =>
      const AssetGenImage('assets/images/img_ios_app.png');

  /// File path: assets/images/img_offshare.png
  AssetGenImage get imgOffshare =>
      const AssetGenImage('assets/images/img_offshare.png');

  /// File path: assets/images/img_ui_logo.png
  AssetGenImage get imgUiLogo =>
      const AssetGenImage('assets/images/img_ui_logo.png');

  /// File path: assets/images/img_user_placeholder.png
  AssetGenImage get imgUserPlaceholder =>
      const AssetGenImage('assets/images/img_user_placeholder.png');

  /// File path: assets/images/img_web_services.png
  AssetGenImage get imgWebServices =>
      const AssetGenImage('assets/images/img_web_services.png');

  /// List of all assets
  List<dynamic> get values => [
        imgAndroidApp,
        imgFlutter,
        imgFlutterApp,
        imgFlutterLogo,
        imgIosApp,
        imgOffshare,
        imgUiLogo,
        imgUserPlaceholder,
        imgWebServices
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
