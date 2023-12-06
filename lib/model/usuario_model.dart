class UsuarioModel {
  String nome;
  String numeroTelefone;

  UsuarioModel({required this.nome, required this.numeroTelefone});

  factory UsuarioModel.fromJson(Map<String, dynamic> map) {
    return UsuarioModel(
      nome: map['nome'],
      numeroTelefone: map['idade'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': numeroTelefone,
    };
  }
}
