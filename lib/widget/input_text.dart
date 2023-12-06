// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class InputText extends StatelessWidget {
  String nome;
  TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String)? validar;
  InputText(
      {super.key,
      required this.nome,
      required this.controller,
      required this.keyboardType,
      required this.validar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TextFormField(
          validator: (value) {
            if (validar != null) {
              return validar!(value!);
            }
            return null;
          },
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            labelText: nome,
            labelStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color(0xFF550F12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
