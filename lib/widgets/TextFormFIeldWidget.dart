import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  String label;
  Icon icon;
  FormFieldValidator<String> validator;
  TextEditingController textEditingController;

  TextFormFieldWidget(this.label, this.icon,this.textEditingController,this.validator);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        validator: validator,
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(30.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: Colors.black),
            hintText: label,
            prefixIcon: icon,
            fillColor: Colors.white70),
        controller: textEditingController,
      ),
    );
  }
}
