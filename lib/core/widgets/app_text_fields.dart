import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:remainder_flutter/core/theme/app_colors.dart';

class AppTextFiled extends StatelessWidget {
  String? hint;

  TextEditingController textEditingController;

  String? prefixIcon;
  bool prefixEnable;

  Widget? suffixIcon;

  Color? focusedBorderColor;

  Color? errorBorderColor;

  Color? enabledBorderColor;
  Color? disabledBorderColor;

  Color? backgroundColor;

  bool isEnable;

  String? label;

  FocusNode? focusNode;

  int? maxLine;

  int? maxLength;
  bool isCenter;

  double? height;

  double? width;

  TextInputType? textInputType;

  bool obscureText;

  TextInputAction? textInputAction;
  Function(String)? onValue;

  Function()? onEditingComplete;

  EdgeInsets? contentPadding;

  bool isPhoneNumberSelectAble;

  bool isBorderEnable;
  Function()? onTap;
  InputBorder? border;

  Alignment? align;

  TextStyle? hintStyle;

  bool? borderEnable;

  bool? isPassword;

  bool? enable;

  TextStyle? valueStyle;

  VoidCallback? onSubmit;

  List<TextInputFormatter>? inputFormatters;

  AppTextFiled(
      {Key? key,
      this.prefixEnable = false,
      this.suffixIcon,
      this.hint,
      this.focusedBorderColor,
      this.prefixIcon,
      this.enabledBorderColor,
      this.errorBorderColor,
      this.disabledBorderColor,
      this.backgroundColor,
      this.isEnable = true,
      required this.textEditingController,
      this.label,
      this.focusNode,
      this.maxLine,
      this.maxLength,
      this.isCenter = false,
      this.width,
      this.height,
      this.textInputType,
      this.obscureText = false,
      this.onValue,
      this.textInputAction,
      this.onEditingComplete,
      this.contentPadding,
      this.isPhoneNumberSelectAble = false,
      this.isBorderEnable = true,
      this.onTap,
      this.border,
      this.align,
      this.hintStyle,
      this.borderEnable = true,
      this.enable,
      this.isPassword,
      this.valueStyle,
      this.onSubmit,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (obscureText == true) {
      suffixIcon = _maskIcon();
    }
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 50,
      child: GestureDetector(
        onTap: onTap,
        child: TextField(
          onSubmitted: (v) => onSubmit != null ? onSubmit!() : null,
          onEditingComplete: onEditingComplete,
          textInputAction: textInputAction,
          onChanged: (v) => onValue != null ? (v) : null,
          obscureText: obscureText,
          keyboardType: textInputType ?? TextInputType.text,
          enabled: isEnable,
          focusNode: focusNode,
          //enabled: this.isEnable,
          controller: textEditingController,
          maxLength: this.maxLength,
          maxLines: obscureText ? 1 : this.maxLine,
          inputFormatters: inputFormatters,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColor.primaryTextColor),
          textAlign: isCenter == true ? TextAlign.center : TextAlign.start,

          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColor.secondaryTextColor),
            contentPadding: contentPadding ??
                const EdgeInsets.only(top: 16, left: 16, bottom: 16),
            counter: null,
            filled: backgroundColor != null,
            fillColor: backgroundColor,

            labelText: label,
            labelStyle: valueStyle ??
                Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColor.secondaryTextColor),
            errorBorder: border ??
                OutlineInputBorder(
                    borderSide: BorderSide(
                      color: errorBorderColor ?? Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10)),
            focusedBorder: borderEnable == false
                ? UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.grayColor, width: 1),
                  )
                : border ??
                    OutlineInputBorder(
                        borderSide: borderEnable == false
                            ? BorderSide()
                            : BorderSide(
                                width: 1,
                                color: focusedBorderColor ??
                                    Theme.of(context).colorScheme.shadow),
                        borderRadius: BorderRadius.circular(10)),
            disabledBorder: borderEnable == false
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                  )
                : border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: disabledBorderColor ??
                                Theme.of(context).colorScheme.shadow),
                        borderRadius: BorderRadius.circular(10)),
            enabledBorder: borderEnable == false
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                  )
                : border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: enabledBorderColor ??
                                Theme.of(context).colorScheme.shadow),
                        borderRadius: BorderRadius.circular(10)),
            // border: UnderlineInputBorder(),

            border: borderEnable == false
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                  )
                : border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.shadow,
                        ),
                        borderRadius: BorderRadius.circular(10)),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(prefixIcon!),
                  )
                : prefixEnable
                    ? SizedBox(
                        width: 90,
                        child: Row(
                          children: const [
                            // Image(image: AssetImage(AppAssets.bd)),
                            Text(" +880 "),
                          ],
                        ),
                      )
                    : null,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }

  _maskIcon() {
    bool isMusk;
    return Icon(Icons.visibility_off);
  }
}
