import 'package:flutter_structure/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_layout.dart';
import '../gen/assets.gen.dart';

class AppTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final double prefixIconHeight;
  final double suffixIconHeight;
  final double prefixIconWidth;
  final double suffixIconWidth;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final String prefixIcon;
  final bool showPrefixIcon;
  final Widget? showPrefixWidget;
  final String suffixIcon;
  bool showSuffixIcon;

  final TextEditingController? textEditingController;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;

  final EdgeInsets? textFieldPadding;
  final double? labelTextSize;
  bool obscureText;

  final bool isError;

  final TextInputType? keyboardType;

  final Function(String value)? onChanged;
  final Function(String value) validator;

  AppTextField(
      {Key? key,
      this.labelText = '',
      this.textEditingController,
      required this.prefixIcon,
      this.suffixIcon = '',
      this.hintTextStyle,
      this.textStyle,
      this.showPrefixWidget,
      this.maxLines = 1,
      this.maxLength,
      required this.validator,
      this.onChanged,
      this.textFieldPadding,
      this.labelTextSize,
      this.keyboardType,
      this.isError = false,
      this.obscureText = false,
      this.showPrefixIcon = true,
      this.inputFormatter,
      this.showSuffixIcon = false,
      this.prefixIconHeight = 16,
      this.suffixIconHeight = 24,
      this.prefixIconWidth = 20,
      this.suffixIconWidth = 24,
      this.hintText = ''})
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();
  bool isFocus = false;

  void _onFocusChange() {
    setState(() {
      isFocus = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _focusNode.addListener(_onFocusChange);
    super.initState();
  }

  String textFieldValue = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          widget.textFieldPadding ?? const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.labelText.isNotEmpty)
            Align(
              alignment: Alignment.centerLeft,
              child: widget.labelText.normalText(
                  fontWeight: FontWeight.w400,
                  fontSize: widget.labelTextSize ?? 14,
                  fontColor: appBlackColor),
            ),
          (8).spaceH(),
          TextFormField(
            maxLength: widget.maxLength,
            maxLengthEnforcement: MaxLengthEnforcement.none,
            maxLines: widget.maxLines,
            controller: widget.textEditingController,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            inputFormatters: widget.inputFormatter,
            focusNode: _focusNode,
            validator: (value) {
              return widget.validator(value!);
            },
            onChanged: (value) {
              textFieldValue = value;
              widget.onChanged!.call(value);
            },
            cursorColor: appBlackColor,
            style: widget.textStyle ??
                GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: appBlackColor),
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              prefixIcon: widget.showPrefixIcon
                  ? SvgGenImage(widget.prefixIcon)
                      .svg(
                          height: widget.prefixIconHeight,
                          width: widget.prefixIconWidth,
                          // ignore: deprecated_member_use_from_same_package
                          color: isFocus
                              ? primaryColor
                              : textFieldValue.isNotEmpty
                                  ? primaryColor
                                  : hintTextColor,
                          fit: BoxFit.contain)
                      .paddingAll(12)
                      .paddingOnly(top: 2)
                  : widget.showPrefixWidget,
              suffixIcon: widget.showSuffixIcon
                  ? Container(
                      child: GestureDetector(
                          onTap: _toggleObscured,
                          child: widget.obscureText
                              ? Assets.icons.icPasswordVisible
                                  .svg(color: hintTextColor)
                                  .paddingAll(3)
                              : Assets.icons.icHidePassword
                                  .svg(color: hintTextColor)
                                  .paddingAll(3)
                                  .paddingOnly(bottom: 4)),
                    ).paddingOnly(right: 20)
                  : null,
              hintText: widget.hintText,
              hintStyle: widget.hintTextStyle ??
                  GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: hintTextColor),
              /* fillColor: textFieldValue.isNotEmpty
                  ? Colors.transparent
                  : widget.isError
                      ? appBlackColor.withOpacity(0.5)
                      : (_focusNode.hasFocus)
                          ? Colors.transparent
                          : hintTextColor.withOpacity(0.2),*/
              fillColor: Colors.transparent,
              filled: true,
              errorStyle: const TextStyle(height: 0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: textFieldValue.isNotEmpty
                          ? appBlackColor.withOpacity(0.5)
                          : textFieldBorderColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: primaryColor)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: widget.isError
                          ? Colors.red
                          : hintTextColor.withOpacity(0.2))),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: widget.isError
                          ? primaryColor
                          : appBlackColor.withOpacity(0.5))),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleObscured() {
    setState(() {
      widget.obscureText = !widget.obscureText;
      if (_focusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      _focusNode.canRequestFocus = false; // Prevents focus if tap on eye
    });
  }
}

class StartUpTextField extends StatefulWidget {
  TextEditingController? controller;
  String? header;
  TextAlign? align;
  ValueChanged<String>? onchange;
  int? maxLength;
  int? maxLines;
  String? hint;
  String? topText;
  TextInputType? inputType;
  Color? fillColor;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool isSuffixIconShow;
  Color? hintColor;
  double? hintSize;
  double? fontSize;
  double? radius;
  String? error;
  GestureTapCallback? ontap;
  bool readOnly;
  bool showCurson;
  VoidCallback? onComplete;
  TextInputAction? textInputAction;
  bool? enabled;
  bool obSecureText;
  Color headerColor;
  TextCapitalization? textCapitalization;
  double? padLeft;
  double? padRight;
  double? padTop;
  double? padBottom;
  double? height;
  double? suffixPadding;
  Color? borderLineColor;
  Color? bgColor;
  FontStyle? hintStyle;
  FontWeight? hintWeight;
  FormFieldValidator<String>? validator;
  bool isOuterBolder;
  List<TextInputFormatter>? inputFormatters;

  StartUpTextField(
      {super.key,
      this.controller,
      this.align = TextAlign.start,
      this.onchange,
      this.maxLength,
      this.hintWeight,
      this.inputFormatters,
      this.hintStyle,
      this.suffixPadding,
      this.maxLines,
      this.borderLineColor,
      this.inputType,
      this.validator,
      this.obSecureText = false,
      this.hint,
      this.topText = '',
      this.prefixIcon,
      this.fillColor,
      this.suffixIcon,
      this.isSuffixIconShow = false,
      this.hintColor,
      this.hintSize,
      this.bgColor,
      this.fontSize,
      this.isOuterBolder = false,
      this.radius,
      this.error,
      this.ontap,
      this.onComplete,
      this.header,
      this.padLeft,
      this.padRight,
      this.padTop,
      this.padBottom,
      this.readOnly = false,
      this.showCurson = true,
      this.headerColor = Colors.black,
      this.textInputAction = TextInputAction.done,
      this.textCapitalization,
      this.height,
      this.enabled});

  @override
  State<StartUpTextField> createState() => _StartUpTextFieldState();
}

class _StartUpTextFieldState extends State<StartUpTextField> {
  FocusNode focusNode = FocusNode();
  final textFieldFocusNode = FocusNode();

  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        print("Has focus: ${focusNode.hasFocus}");
      });
    });
  }

  void _toggleObscured() {
    setState(() {
      widget.obSecureText = !widget.obSecureText;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.topText!.isNotEmpty
            ? (widget.topText ?? "")
                .normalText(
                    fontColor: appBlackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15)
                .paddingOnly(top: 13, left: 0, bottom: 10, right: 20)
            : const SizedBox.shrink(),
        SizedBox(
          height: widget.height,
          child: TextFormField(
            validator: widget.validator,
            style: TextStyle(color: appBlackColor),
            textInputAction: widget.textInputAction,
            textAlign: widget.align!,
            enabled: widget.enabled,
            inputFormatters: widget.inputFormatters,
            obscureText: widget.obSecureText,
            onChanged: (text) {
              if (text.isNotEmpty) {
                widget.error = null;
                setState(() {});
              }
              if (widget.onchange != null) {
                widget.onchange!(text);
              }
            },
            maxLength: widget.maxLength,
            cursorColor: appBlackColor,
            readOnly: widget.readOnly,
            showCursor: widget.showCurson,
            onEditingComplete: widget.onComplete,
            maxLines: widget.maxLines ?? 1,
            keyboardType: widget.inputType,
            onTap: widget.ontap,
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hint,
              filled: true,
              fillColor: widget.bgColor,
              hintStyle: TextStyle(
                  fontWeight: widget.hintWeight,
                  fontSize: 15,
                  color: widget.hintColor ?? hintTextColor,
                  fontStyle: widget.hintStyle),
              prefixIconConstraints: BoxConstraints(
                minWidth: 25,
                minHeight: 25,
              ),
              suffixIconConstraints: BoxConstraints(
                minWidth: 25,
                minHeight: 25,
              ),
              errorMaxLines: 2,
              border: widget.isOuterBolder
                  ? startupTextFieldFocusOuterBorder(widget.radius??10)
                  : startupTextFieldFocusBorder(0),
              enabledBorder: widget.isOuterBolder
                  ? startupTextFieldOuterBorder(widget.radius??10)
                  : startupTextFieldBorder(0),
              focusedBorder: widget.isOuterBolder
                  ? startupTextFieldFocusOuterBorder(widget.radius??10)
                  : startupTextFieldFocusBorder(0),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isSuffixIconShow
                  ? widget.suffixIcon ??
                      Container(
                        child: GestureDetector(
                            onTap: _toggleObscured,
                            child: widget.obSecureText
                                ? Assets.icons.icPasswordVisible
                                    .svg(color: hintTextColor)
                                    .paddingAll(3)
                                : Assets.icons.icHidePassword
                                    .svg(color: hintTextColor,height: 21,width: 23)
                                    .paddingAll(3)
                                    .paddingOnly(bottom: 5)),
                      ).paddingOnly(right: widget.suffixPadding ?? 10)
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}

class ChatTextField extends StatelessWidget {
  ChatTextField(
      {Key? key,
      this.radius,
      this.hint,
      this.controller,
      this.height = 55,
      this.maxLines = 1})
      : super(key: key);

  TextEditingController? controller;
  double? radius;
  String? hint;
  double height;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w400,
          // fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        decoration: InputDecoration(
          filled: true,
          // contentPadding:
          // EdgeInsets.only(top: 12, bottom: 12, left: 15), // Removes padding
          isDense: true,
          fillColor: sendMessageColor,
          hintText: hint,
          hintStyle: TextStyle(
            color: hintTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            // fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          border: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
        ),
        maxLines: maxLines,
      ).center,
    ).paddingSymmetric(horizontal: 10, vertical: 10);
  }
}
