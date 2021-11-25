import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:list_view_project/bloc/client_list_cubit.dart';
import 'package:list_view_project/models/client.dart';

class ClientListView extends StatelessWidget {
  const ClientListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          child: const Text("Client List"),
          color: Colors.black,
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: BlocBuilder<ClientListCubit, List<ClientModel>>(
            builder: (context, state) {
              if (state.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return LiquidPullToRefresh(
                onRefresh: () async {
                 await BlocProvider.of<ClientListCubit>(context, listen: false)
                      .refreshClients();
                },
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state[index].name.toString()),
                        subtitle: Text(state[index].company.toString()),
                        trailing: Text(
                          state[index].invoicepaid.toString() +
                              "/" +
                              state[index].invoicePending.toString(),
                        ),
                      );
                    }),
              );
            },
          ),
        );
      }),
    );
  }
}
