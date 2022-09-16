import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  TextEditingController? controller;
  FormFieldValidator<String>? validator;


   CustomField({Key? key,this.controller,this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator:validator ,


    );
  }
}
