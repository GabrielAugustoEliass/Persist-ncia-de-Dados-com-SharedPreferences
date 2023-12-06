import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/usuario_model.dart';

class UsuarioController extends GetxController {
  final formKey = GlobalKey<FormState>();

  List<UsuarioModel> listaUsuarios = <UsuarioModel>[].obs;

  final TextEditingController controlarNomeUsuario = TextEditingController();
  final TextEditingController controlarNumeroTelefone = TextEditingController();

  void salvarUsuarioPermanentemente() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? listaString = prefs.getStringList('listaUsuarios');
    if (listaString != null) {
      listaUsuarios = listaString
          .map((e) => UsuarioModel.fromJson(json.decode(e)))
          .toList();
      update();
    }
  }

  void salvarUsuarioALista(UsuarioModel usuario) async {
    final prefs = await SharedPreferences.getInstance();
    listaUsuarios.add(usuario);
    List<String> listaString =
        listaUsuarios.map((e) => json.encode(e.toJson())).toList();
    prefs.setStringList('listaUsuarios', listaString);
    update();
  }

  void removerUsuarioALista(int index) async {
    final prefs = await SharedPreferences.getInstance();
    listaUsuarios.removeAt(index);
    List<String> listaString =
        listaUsuarios.map((e) => json.encode(e.toJson())).toList();
    prefs.setStringList('listaUsuarios', listaString);
    update();
  }
}
