import 'package:http/http.dart' as http;
import 'dart:convert';

class Controller {
  String resultado = 'O resultado irá aparecer aqui!';

  void buscaCep(String cepDigitado) async {
    String url = "https://viacep.com.br/ws/$cepDigitado/json/";
    http.Response response; //resposta do site para a requisição
    response = await http.get(url);
  }
}
