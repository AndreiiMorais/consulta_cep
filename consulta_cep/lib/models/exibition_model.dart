import 'dart:convert';

class ExibitionModel {
  String cep;
  String logradouro;
  String bairro;
  String localidade;
  String uf;
  String ddd;

  ExibitionModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ddd': ddd,
    };
  }

  factory ExibitionModel.fromMap(Map<String, dynamic> map) {
    return ExibitionModel(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
      ddd: map['ddd'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ExibitionModel.fromJson(String source) =>
      ExibitionModel.fromMap(json.decode(source));
}
