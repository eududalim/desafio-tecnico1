import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../shared/helpers/consts.dart';

class SeventhApiDatasource {
  final _uri = Uri(host: Seventh.baseUrl, scheme: 'https');

  /// Token de acesso do usuário, caso ele tenha feita login.
  String? token;

  /// Url do video a ser transmitido.
  String? urlVideo;

  /// Verifica se o token de acesso não é inválido ou nulo.
  /// Caso seja, significa que o usuario precisa fazer login novamente.
  bool getAuthState() {
    return (token != null && token!.isNotEmpty);
  }

  /// Realiza o login do usuario com username e password.
  /// Em caso de sucesso salva o token na variavel global e retorna string vazia.
  /// Caso dê erro, retorna mensagem string com o erro.
  Future<String> loginWithUsernameAndPassword(
      {required String username, required String password}) async {
    final url = _uri.replace(path: '/login');

    var body = jsonEncode({'username': username, 'password': password});

    var response = await http.post(url, headers: _headerToken, body: body);

    try {
      var data = Map<String, dynamic>.from(jsonDecode(response.body));

      if (response.statusCode == 200) {
        token = data['token'].toString();
        return '';
      } else {
        debugPrint(response.statusCode.toString());
        return data['message'].toString();
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return response.reasonPhrase!;
    }
  }

  /// Obtem a url do video passado por parametro.
  /// Caso sucesso, salva sua url na variavel global e retorna string vazia.
  /// Caso dê erro, retorna mensagem string com o erro.
  Future<String> getUrlVideo(String fileName) async {
    final url = _uri.replace(
      path: '/video/$fileName',
    );

    try {
      var response = await http.get(url, headers: _header(token));

      try {
        var data = Map<String, dynamic>.from(jsonDecode(response.body));

        if (response.statusCode == 200) {
          urlVideo = data['url'].toString();
          return '';
        } else {
          debugPrint(response.statusCode.toString());
          return data['message'].toString();
        }
      } on Exception catch (e) {
        debugPrint(e.toString());
        return e.toString();
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return e.toString();
    }
  }
}

const _headerToken = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Accept': '*/*',
};

Map<String, String> _header(token) => {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': '*/*',
      'X-Access-Token': token,
    };
