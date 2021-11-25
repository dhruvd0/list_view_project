import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:list_view_project/api/client_list_api.dart';
import 'package:list_view_project/models/client.dart';

class ClientListCubit extends HydratedCubit<List<ClientModel>> {
  ClientListCubit() : super([]) {
    Future.delayed(const Duration(milliseconds: 500), () async {
      refreshClients();
    });
  }

  Future<void> refreshClients() async {
    try {
      var clients = await getClients();
      emit(clients ?? []);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  List<ClientModel>? fromJson(Map<String, dynamic> json) {
    var list = (json["clients"] as List).map((element) {
      return ClientModel.fromMap(element);
    }).toList();
    log(list.toString());
    return list;
  }

  @override
  Map<String, dynamic>? toJson(List<ClientModel> state) {
    List<Map<String, dynamic>> clients = state.map((e) => e.toMap()).toList();
    return {
      "clients": clients,
    };
  }
}
