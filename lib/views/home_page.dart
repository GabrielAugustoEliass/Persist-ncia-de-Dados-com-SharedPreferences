// ignore_for_file: prefer_const_constructors
import 'package:app_teste/widget/Input_text.dart';
import 'package:app_teste/widget/app_bar_padrao.dart';
import 'package:app_teste/widget/bottom_salvar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/usuario_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final c = Get.put(UsuarioController());

  @override
  void initState() {
    super.initState();
    setState(() {
      c.salvarUsuarioPermanentemente();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPadrao(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: c.formKey,
            child: Column(
              children: [
                Card(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InputText(
                            nome: 'Telefone',
                            controller: c.controlarNumeroTelefone,
                            keyboardType: TextInputType.number,
                            validar: (value) {
                              if (value.isEmpty) {
                                return 'Telefone não pode ser vazio';
                              } else {
                                return null;
                              }
                            },
                          ),
                          InputText(
                            keyboardType: TextInputType.text,
                            nome: 'Nome',
                            controller: c.controlarNomeUsuario,
                            validar: (value) {
                              if (value.isEmpty) {
                                return 'Nome não pode ser vazio';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 17),
                      BottomSalvar(),
                      SizedBox(
                        height: 400,
                        child: c.listaUsuarios.isEmpty
                            ? Center(
                                child: Text(
                                  'Lista de Contatos vazia',
                                  style: TextStyle(fontSize: 19),
                                ),
                              )
                            : GetBuilder<UsuarioController>(
                                init: UsuarioController(),
                                builder: (_) {
                                  return ListView.builder(
                                    itemCount: _.listaUsuarios.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        trailing: IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Color(0xFF550F12),
                                            size: 24,
                                          ),
                                          onPressed: () {
                                            _.removerUsuarioALista(index);
                                          },
                                        ),
                                        title: Text(
                                          _.listaUsuarios[index].numeroTelefone,
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Color(0xFF550F12),
                                          ),
                                        ),
                                        subtitle: Text(
                                          _.listaUsuarios[index].nome,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
