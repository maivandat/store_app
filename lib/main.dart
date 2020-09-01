import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/bloc/store_bloc.dart';
import 'package:store_app/repository/remote/store_api_client.dart';
import 'package:store_app/repository/store_repository.dart';
import 'package:store_app/screens/login.dart';

void main() async {
  final StoreRepository storeRepository = StoreRepository(
    storeApiClient: StoreApiClient(
      httpClient: http.Client())
  );
  runApp(MyApp(storeRepository: storeRepository,));
}

class MyApp extends StatelessWidget {
  final StoreRepository storeRepository;

  const MyApp({Key key, @required this.storeRepository})
      : assert(storeRepository != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => StoreBloc(storeRepository: storeRepository),
        child: Login(),
      ),
    );
  }
}
