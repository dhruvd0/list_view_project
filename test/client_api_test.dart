import 'package:flutter_test/flutter_test.dart';
import 'package:list_view_project/api/client_list_api.dart';
import 'package:list_view_project/models/client.dart';

void main() {
  test(' Test to get and parse client list', () async {
    List<ClientModel>? clients = await getClients();

    assert(clients != null);
    expect(clients?.isNotEmpty, true);
    expect(clients![0].id, "1");
  });
}
