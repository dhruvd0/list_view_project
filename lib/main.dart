import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:list_view_project/bloc/client_list_cubit.dart';
import 'package:list_view_project/list_view.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(
    MaterialApp(
      home: BlocProvider(
        create: (_) => ClientListCubit(),
        child: const ClientListView(),
      ),
    ),
  ),
    storage: storage,
  );
  
}
