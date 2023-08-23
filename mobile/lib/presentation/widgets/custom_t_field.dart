import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      this.labelText,
      this.suffixicondata,
      this.icondata,
      this.validator,
      this.height,
      this.maxlines,
      this.isObscure = false,
      required this.textEditingController,
      this.keyBoardType,
      this.nullPadding = false,
      this.enabledBorder = true,
      this.hintText,
      this.enabled,
      this.onChanged,
      this.inputFormatters})
      : super(key: key);
  final String? labelText;
  final Widget? icondata;
  final Icon? suffixicondata;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool isObscure;
  final bool nullPadding;
  EdgeInsetsDirectional? contetPadding;
  final double? height;
  final bool enabledBorder;
  int? maxlines;
  final bool? enabled;
  final void Function(String)? onChanged;
  final TextInputType? keyBoardType;
  TextEditingController? textEditingController;
  List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: nullPadding
          ? null
          : const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        keyboardType: keyBoardType,
        controller: textEditingController,
        maxLines: maxlines,
        validator: validator,
        inputFormatters: inputFormatters,
        obscureText: isObscure,
        onChanged: onChanged,
        enabled: enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          prefixIcon: icondata,
          contentPadding: const EdgeInsets.all(12),
          isDense: true,
          hintText: hintText,
          suffix: suffixicondata,
          enabledBorder: enabledBorder
              ? OutlineInputBorder(borderRadius: BorderRadius.circular(5))
              : null,

          // enabledBorder: enabledBorder
          //     ? OutlineInputBorder(borderRadius: BorderRadius.circular(5))
          //     : null,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          fillColor: const Color.fromRGBO(255, 255, 255, 1),
          filled: true,
        ),
      ),
    );
  }
}
