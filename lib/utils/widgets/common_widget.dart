import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    required this.title,
    this.color,
    this.fontSize,
    this.height,
    this.fontWeight,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.fontFamily,
    this.textDecoration,
    Key? key,
  }) : super(key: key);
  final String title;
  final Color? color;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final String? fontFamily;
  final int? maxLines;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      overflow: textOverflow ?? TextOverflow.visible,
      style: GoogleFonts.outfit(
        decoration: textDecoration,
        color: color ?? kPrimaryColor,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 32,
        height: height,
      ),
    );
  }
}

class MainContainer extends StatelessWidget {
  const MainContainer({
    this.child,
    this.color,
    this.borderColor,
    this.horizontalPadding,
    this.horizontalMargin,
    this.verticalPadding,
    this.verticalMargin,
    this.borderRadius,
    this.topBorderRadius,
    this.bottomBorderRadius,
    this.width,
    this.height,
    this.borderWidth,
    this.withBoxShadow = false,
    Key? key,
  }) : super(key: key);
  final Widget? child;
  final Color? color;
  final Color? borderColor;
  final double? horizontalMargin;
  final double? verticalMargin;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? borderRadius;
  final double? topBorderRadius;
  final double? bottomBorderRadius, height, width, borderWidth;
  final bool withBoxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(
      //     horizontal: horizontalMargin ?? 24, vertical: verticalMargin ?? 0),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 16, vertical: verticalPadding ?? 10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: topBorderRadius != null || bottomBorderRadius != null
            ? BorderRadius.vertical(
                top: Radius.circular(topBorderRadius ?? 0),
                bottom: Radius.circular(bottomBorderRadius ?? 0),
              )
            : BorderRadius.circular(borderRadius ?? 16),
        // border: Border.all(
        //   color: borderColor ?? kPrimaryColor,
        //   width: borderWidth ?? .5,
        // ),
        boxShadow: [
          if (withBoxShadow)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            )
        ],
      ),
      child: child,
    );
  }
}

class AnswerContainer extends StatelessWidget {
  const AnswerContainer({
    this.child,
    this.color,
    this.decoration,
    this.gradient,
    this.borderColor,
    this.horizontalPadding,
    this.horizontalMargin,
    this.verticalPadding,
    this.verticalMargin,
    this.borderRadius,
    this.topBorderRadius,
    this.bottomBorderRadius,
    this.width,
    this.height,
    this.borderWidth,
    this.withBoxShadow = false,
    Key? key,
  }) : super(key: key);
  final Widget? child;
  final Color? color;
  final Color? decoration;
  final Color? gradient;
  final Color? borderColor;
  final double? horizontalMargin;
  final double? verticalMargin;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? borderRadius;
  final double? topBorderRadius;
  final double? bottomBorderRadius, height, width, borderWidth;
  final bool withBoxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 16, vertical: verticalPadding ?? 10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            color ?? const Color(0xFFE84141),
            color ?? const Color(0xFF9C1D1B),
          ],
        ),
        borderRadius: topBorderRadius != null || bottomBorderRadius != null
            ? BorderRadius.vertical(
                top: Radius.circular(topBorderRadius ?? 0),
                bottom: Radius.circular(bottomBorderRadius ?? 0),
              )
            : BorderRadius.circular(borderRadius ?? 16),
        boxShadow: [
          if (withBoxShadow)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            )
        ],
      ),
      child: child,
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    this.color,
    this.height,
    this.thickness,
    this.horizontalMargin,
    this.verticalMargin,
    Key? key,
  }) : super(key: key);
  final Color? color;
  final double? height;
  final double? thickness;
  final double? horizontalMargin;
  final double? verticalMargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalMargin ?? 0,
        vertical: verticalMargin ?? 0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: thickness,
              height: height,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class RegexUtil {
  RegexUtil._();

  static final spaceOrNewLine = RegExp(r'[ ^\s]+');
}

class MaxWordTextInputFormater extends TextInputFormatter {
  final int maxWords;
  final ValueChanged<int>? currentLength;

  MaxWordTextInputFormater({this.maxWords = 1, this.currentLength});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int count = 0;
    if (newValue.text.isEmpty) {
      count = 0;
    } else {
      count = newValue.text.trim().split(RegexUtil.spaceOrNewLine).length;
    }
    if (count > maxWords) {
      return oldValue;
    }
    currentLength?.call(count);
    return newValue;
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController controller,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    this.maxLines = 1,
    this.hintText,
    this.labelText,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.requiredStarColor,
    this.onChanged,
    this.borderRadius,
    this.verticalMargin,
    this.horizontalMargin,
    this.horizontalPadding,
    this.verticalPadding,
    this.textFieldHeight,
    this.textFieldHorizontalContentPadding,
    this.textFieldVerticalContentPadding,
    this.labelTextFontSize,
    this.onEditingComplete,
    this.hintTextStyle,
    this.inputFormatters,
    this.isLabelExist = false,
    this.isRequired = false,
    this.isOuterBorderExist = false,
    this.isObsecured = false,
  })  : _controller = controller,
        _focusNode = focusNode,
        keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        super(key: key);

  final TextEditingController _controller;
  final FocusNode? _focusNode;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? borderColor;
  final Color? requiredStarColor;
  final TextInputType? keyboardType;
  final int? maxLines;
  final TextStyle? hintTextStyle;
  final ValueChanged<String>? onChanged;
  final Function()? onEditingComplete;
  final BorderRadius? borderRadius;
  final bool isLabelExist;
  final bool? isRequired;
  final bool? isOuterBorderExist;
  final bool? isObsecured;
  final double? verticalMargin,
      horizontalMargin,
      horizontalPadding,
      verticalPadding,
      textFieldHeight,
      textFieldHorizontalContentPadding,
      textFieldVerticalContentPadding,
      labelTextFontSize;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalMargin ?? 0, vertical: verticalMargin ?? 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null)
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      labelText ?? '',
                      style: GoogleFonts.outfit(
                        fontSize: labelTextFontSize ?? 14,
                        fontWeight: FontWeight.w600,
                        color: kparagraphColor,
                      ),
                    ),
                    if (isRequired!)
                      TitleText(
                        title: '*',
                        color: requiredStarColor ?? kPrimaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                  ],
                ),
                space2C,
              ],
            ),
          Material(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding ?? 4.0,
                    vertical: verticalPadding ?? 4),
                child: SizedBox(
                  height: textFieldHeight ?? 50,
                  child: Center(
                    child: TextFormField(
                      controller: _controller,
                      focusNode: _focusNode,
                      obscureText: isObsecured ?? false,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      keyboardType: keyboardType,
                      maxLines: maxLines,
                      inputFormatters: inputFormatters,
                      decoration: InputDecoration(
                        prefixIcon: prefixIcon,
                        suffixIcon: suffixIcon,
                        fillColor: fillColor ?? Colors.white,
                        hintText: hintText ?? '',
                        hintStyle: hintTextStyle,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class CustomTextFieldAlt extends StatelessWidget {
  const CustomTextFieldAlt({
    Key? key,
    required TextEditingController controller,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    this.maxLines = 1,
    this.hintText,
    this.labelText,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.requiredStarColor,
    this.onChanged,
    this.borderRadius,
    this.verticalMargin,
    this.horizontalMargin,
    this.horizontalPadding,
    this.verticalPadding,
    this.textFieldHeight,
    this.textFieldHorizontalContentPadding,
    this.textFieldVerticalContentPadding,
    this.labelTextFontSize,
    this.onEditingComplete,
    this.hintTextStyle,
    this.inputFormatters,
    this.isLabelExist = false,
    this.isRequired = false,
    this.isOuterBorderExist = false,
    this.isObsecured = false,
  })  : _controller = controller,
        _focusNode = focusNode,
        keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        super(key: key);

  final TextEditingController _controller;
  final FocusNode? _focusNode;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? borderColor;
  final Color? requiredStarColor;
  final TextInputType? keyboardType;
  final int? maxLines;
  final TextStyle? hintTextStyle;
  final ValueChanged<String>? onChanged;
  final Function()? onEditingComplete;
  final BorderRadius? borderRadius;
  final bool isLabelExist;
  final bool? isRequired;
  final bool? isOuterBorderExist;
  final bool? isObsecured;
  final double? verticalMargin,
      horizontalMargin,
      horizontalPadding,
      verticalPadding,
      textFieldHeight,
      textFieldHorizontalContentPadding,
      textFieldVerticalContentPadding,
      labelTextFontSize;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalMargin ?? 0, vertical: verticalMargin ?? 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: TextFormField(
              controller: _controller,
              focusNode: _focusNode,
              obscureText: isObsecured ?? false,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              keyboardType: keyboardType,
              maxLines: maxLines,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                fillColor: fillColor ?? Colors.white,
                hintText: hintText ?? '',
                hintStyle: hintTextStyle,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: labelText,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.primary,
    this.borderColor,
    this.labelColor,
    this.shadowColor,
    this.fontSize,
    this.fontWeight,
    this.iconData,
    this.height,
    this.borderWidth = 1.0,
    this.elevation,
    this.width,
    this.borderRadiusAll,
    this.contentPadding,
    this.marginHorizontal,
    this.marginVertical,
    this.isDisable = false,
  }) : super(key: key);
  final String label;
  final Function()? onPressed;
  final Color? primary;
  final Color? labelColor;
  final Color? shadowColor;
  final Color? borderColor;
  final double? fontSize;
  final double? marginHorizontal;
  final double? marginVertical;
  final double? height;
  final double? elevation;
  final double? contentPadding;
  final double? width;
  final double? borderWidth;
  final double? borderRadiusAll;
  final FontWeight? fontWeight;
  final String? iconData;
  final bool isDisable;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: iconData != null ? 75 : height ?? 50,
        width: width ?? size.width,
        margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal ?? 32,
          vertical: marginVertical ?? 32,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: elevation,
            shadowColor: kPrimaryColor,
            backgroundColor:
                isDisable ? const Color(0xff4A8B5C) : primary ?? kPrimaryColor,
            padding: EdgeInsets.all(contentPadding ?? 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusAll ?? 8),
              side: BorderSide(
                  color: borderColor ?? primary ?? kPrimaryColor,
                  width: borderWidth!),
            ),
          ),
          onPressed: isDisable ? () {} : onPressed,
          child: iconData == null
              ? Text(
                  label,
                  style: TextStyle(
                      color: labelColor ?? Colors.white,
                      fontWeight: fontWeight ?? FontWeight.normal,
                      fontSize: fontSize ?? 16),
                )
              : Stack(
                  children: [
                    Container(
                      width: size.width,
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/$iconData.png',
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        label,
                        style: TextStyle(
                            color: labelColor ?? Colors.white,
                            fontWeight: fontWeight ?? FontWeight.normal,
                            fontSize: fontSize ?? 16),
                      ),
                    ),
                  ],
                ),
        ));
  }
}

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    Key? key,
    required String? selectedOption,
    required String? hintText,
    required this.onChange,
    required List<dynamic> list,
    this.borderRadius,
    this.elevation,
    this.height,
    this.shadowColor,
    this.horizontalMargin,
    this.verticalMargin,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconSize,
    this.textColor,
    this.fillColor,
    this.spaceBetween,
    this.fontWeight,
    this.arrowColor,
    this.fontSize,
    this.icon,
    this.hasPrefixIcon = false,
    this.leftAlign = false,
    this.useFittedBox = false,
    this.isRequired = false,
    this.label,
    this.leftPadding,
    this.extension,
    this.textAlign = TextAlign.left,
    this.underline,
  })  : _selectedOption = selectedOption,
        _hintText = hintText,
        _list = list,
        super(key: key);

  final String? _selectedOption;
  final String? _hintText, label;
  final List<dynamic> _list;
  final Function onChange;
  final double? elevation;
  final double? spaceBetween;
  final double? height;
  final FontWeight? fontWeight;

  final double? verticalMargin, fontSize;
  final double? horizontalMargin;
  final BorderRadius? borderRadius;
  final Color? shadowColor;
  final Color? fillColor;
  final Color? arrowColor;
  final Widget? underline, icon;
  final IconData? prefixIcon;
  final double? prefixIconSize;
  final double? leftPadding;
  final Color? prefixIconColor, textColor;
  final bool hasPrefixIcon;
  final bool leftAlign;
  final TextAlign textAlign;
  final String? extension;
  final bool useFittedBox;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalMargin ?? 12.0, horizontal: horizontalMargin ?? 0),
      child: Column(
        children: [
          if (label != null)
            Column(
              children: [
                Row(
                  children: [
                    TitleText(
                      title: label!,
                      color: const Color(0xFF3A4346),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    if (isRequired)
                      const TitleText(
                        title: '*',
                        color: const Color(0xFFFF7B54),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                  ],
                ),
                space1C,
              ],
            ),
          SizedBox(
            height: spaceBetween ?? 0,
          ),
          Material(
            elevation: elevation ?? 2.0,
            // shadowColor: shadowColor ?? Colors.grey,
            borderRadius: borderRadius ??
                BorderRadius.circular(
                  12.0,
                ),
            color: fillColor,
            child: SizedBox(
              height: height ?? 48,
              child: DropdownButton(
                icon: icon ??
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: arrowColor ?? kPrimaryColor,
                    ),
                isExpanded: true,
                underline: underline ?? const SizedBox(),
                hint: Text(
                  _hintText!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff818181),
                  ),
                ), // Not necessary for Option 1
                value: _selectedOption,
                onChanged: (newValue) {
                  onChange(newValue);
                },

                items: _list.map((playlist) {
                  return DropdownMenuItem(
                    value: playlist,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (prefixIcon != null || hasPrefixIcon)
                          Row(
                            children: [
                              space1R,
                              Icon(
                                prefixIcon ?? Icons.location_on_outlined,
                                color: prefixIconColor ?? kPrimaryColor,
                                size: prefixIconSize ?? 13,
                              ),
                            ],
                          ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0)
                                    .copyWith(left: leftPadding ?? 12.0),
                            child: useFittedBox
                                ? FittedBox(
                                    fit: BoxFit.none,
                                    child: Text(
                                      playlist.toString() +
                                          (extension != null
                                              ? ' ${extension!}'
                                              : ''),
                                      style: TextStyle(
                                        fontSize: fontSize ?? 10,
                                        fontWeight:
                                            fontWeight ?? FontWeight.w300,
                                        color: textColor ??
                                            const Color(0xff818181),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                : Text(
                                    playlist.toString() +
                                        (extension != null
                                            ? ' ${extension!}'
                                            : ''),
                                    style: TextStyle(
                                      fontSize: fontSize ?? 10,
                                      fontWeight: fontWeight ?? FontWeight.w300,
                                      color:
                                          textColor ?? const Color(0xff818181),
                                    ),
                                    textAlign: textAlign,
                                  ),
                          ),
                        ),
                        if (leftAlign) const Spacer(),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
