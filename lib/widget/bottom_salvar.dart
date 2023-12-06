// ignore_for_file: prefer_const_constructors

import 'package:app_teste/controller/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/usuario_model.dart';

class BottomSalvar extends StatefulWidget {
  const BottomSalvar({super.key});

  @override
  State<BottomSalvar> createState() => _BottomSalvarState();
}

class _BottomSalvarState extends State<BottomSalvar> {
  final c = Get.put(UsuarioController());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          UsuarioModel usuarioModel = UsuarioModel(
            nome: c.controlarNomeUsuario.text,
            numeroTelefone: c.controlarNumeroTelefone.text,
          );
          if (c.formKey.currentState!.validate()) {
            c.salvarUsuarioALista(usuarioModel);
            c.controlarNomeUsuario.clear();
            c.controlarNumeroTelefone.clear();
          } else {
            return;
          }
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF550F12),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 37,
        ),
      ),
      child: Text('Salvar'),
    );
  }
}
