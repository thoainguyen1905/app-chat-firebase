import 'package:app_chat_firebase/shared/constants/ColorsConstants.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String? hintText;
  final IconData? leading;
  final Function(String)? userTyped;
  final bool obscure;
  final TextInputType keyboard;

  const CustomTextInput(
      {super.key,
      this.hintText,
      this.leading,
      required this.userTyped,
      required this.obscure,
      this.keyboard = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return _CustomTextInput(
        hintText: hintText,
        leading: leading,
        userTyped: userTyped,
        obscure: obscure,
        keyboard: keyboard);
  }
}

class _CustomTextInput extends StatefulWidget {
  final String? hintText;
  final IconData? leading;
  final Function(String)? userTyped;
  final bool obscure;
  final TextInputType keyboard;

  const _CustomTextInput(
      {required this.hintText,
      required this.leading,
      required this.userTyped,
      required this.obscure,
      required this.keyboard});

  @override
  State<_CustomTextInput> createState() => __CustomTextInputState(
      hintText: hintText,
      leading: leading,
      userTyped: userTyped,
      obscure: obscure,
      keyboard: keyboard);
}

class __CustomTextInputState extends State<_CustomTextInput> {
  final String? hintText;
  final IconData? leading;
  final Function(String)? userTyped;
  final bool obscure;
  final TextInputType keyboard;
  __CustomTextInputState(
      {required this.hintText,
      required this.leading,
      required this.userTyped,
      required this.obscure,
      required this.keyboard});
  final FocusNode _textFieldFocus = FocusNode();
  bool _isTextFieldFocused = false;
  final bool _passwordVisible = true;
  @override
  void initState() {
    super.initState();

    _textFieldFocus.addListener(() {
      setState(() {
        _isTextFieldFocused = _textFieldFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _textFieldFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      // padding: const EdgeInsets.only(left: 10),
      // width: MediaQuery.of(context).size.width * 0.70,
      child: Material(
        child: TextField(
          onChanged: userTyped,
          keyboardType: keyboard,
          focusNode: _textFieldFocus,
          onSubmitted: (value) {},
          autofocus: false,
          obscureText: obscure ? true : false,
          decoration: InputDecoration(
            prefixIcon: Icon(
              leading,
              color: _isTextFieldFocused
                  ? ColorsConstants.light200
                  : ColorsConstants.gray300,
            ),
            suffixIcon: obscure && _passwordVisible
                ? const Icon(Icons.visibility_off)
                : null,
            suffixIconColor: _isTextFieldFocused
                ? ColorsConstants.light200
                : ColorsConstants.gray300,
            filled: true,
            fillColor: _isTextFieldFocused
                ? ColorsConstants.light100
                : ColorsConstants.gray100,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: 'Roboto-300',
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: ColorsConstants.gray100, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: ColorsConstants.light200, width: 2)),
          ),
        ),
      ),
    );
  }
}
