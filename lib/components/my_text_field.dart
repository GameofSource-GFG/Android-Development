import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final Function onChanged;
  final Function validator;
  final IconData prefixIconData;
  final TextInputType keyboardType;
  final bool enableMultilineText;
  final TextCapitalization textCapitalization;

  const MyTextField({
    @required this.labelText,
    @required this.onChanged,
    @required this.validator,
    @required this.prefixIconData,
    this.keyboardType = TextInputType.text,
    this.enableMultilineText = false,
    this.textCapitalization = TextCapitalization.none,
  });

  static final kBackgroundColor = const Color(0xFF2F8D46);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: kBackgroundColor.withOpacity(0.7),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        validator: this.validator,
        keyboardType: this.keyboardType,
        textAlignVertical: TextAlignVertical.center,
        textCapitalization: this.textCapitalization,
        onChanged: this.onChanged,
        cursorColor: Colors.tealAccent,
        style: TextStyle(color: Colors.white),
        maxLines: this.enableMultilineText ? null : 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          prefixIcon: Icon(
            this.prefixIconData,
            size: 25,
            color: Colors.white,
          ),
          border: InputBorder.none,
          hintText: "Enter ${this.labelText}",
          hintStyle: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
