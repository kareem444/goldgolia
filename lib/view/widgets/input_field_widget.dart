import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.textEditingController,
    required this.text,
    this.email = false,
    this.password = false,
    this.mobile = false,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String text;
  final bool email;
  final bool password;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: TextFormField(
        controller: textEditingController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          } else if (email && !EmailValidator.validate(value)) {
            return 'Please enter a valid email';
          } else if (password) {
            String pattern =
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
            RegExp regExp = RegExp(pattern);
            if (!regExp.hasMatch(value)) {
              return 'At least 1 Upper case & 1 Number & 1 Special Character';
            } else if (value.length < 8) {
              return 'Minimum 8 Character';
            }
          } else if (mobile && value.length < 10) {
            return 'Please enter a valid mobile number';
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow[600]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow[600]!),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red[600]!),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red[600]!),
          ),
          hintText: text,
        ),
      ),
    );
  }
}
