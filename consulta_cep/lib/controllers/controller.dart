import 'package:consulta_cep/models/exibition_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Controller {
  ExibitionModel model = ExibitionModel(
      cep: '', logradouro: '', localidade: '', uf: '', bairro: '', ddd: '');
  String resultado = 'O resultado irá aparecer aqui!';

  Future<List<ExibitionModel>> buscaCep(String cepDigitado) async {
    try {
      String _tempUrl = "https://viacep.com.br/ws/$cepDigitado/json/";
      Uri _url = Uri.parse(_tempUrl);
      http.Response _response; //resposta do site para a requisição
      _response = await http.get(_url);
      model = ExibitionModel.fromJson(_response.body);
      List<ExibitionModel> list = [];
      list.add(model);
      return list;
    } catch (ex) {
      return <ExibitionModel>[];
    }
  }
}
