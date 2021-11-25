import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:list_view_project/models/client.dart';

Future<List<ClientModel>?> getClients() async {
  try {
    Response response = await get(
      Uri.parse(
        "https://run.mocky.io/v3/f3feef1c-9bfa-43fd-b2a0-bbe9abadb4f6",
      ),
    );
    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }
    Map body = jsonDecode(response.body);
    return (body["clients"] as List)
        .map((e) => ClientModel.fromMap(e))
        .toList();
  } on ArgumentError catch (e) {
    
  }
  on SocketException{
    
  }
}
