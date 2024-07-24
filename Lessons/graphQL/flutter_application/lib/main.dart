import 'package:flutter/material.dart';
import 'package:flutter_application/config/graphql_config.dart';
import 'package:flutter_application/views/screens/home_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main(List<String> args) {
  final client = GraphqlConfig.initializeClient();
  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;
  const MyApp({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: const CacheProvider(
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      )),
    );
  }
}
