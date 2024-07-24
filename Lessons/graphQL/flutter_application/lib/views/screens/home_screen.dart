import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/graphql_mutations.dart';
import 'package:flutter_application/core/constants/graphql_queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Query(
          options: QueryOptions(document: gql(fetchProducts)),
          builder: (result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            List products = result.data!['products'];

            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    title: Text(product['title']),
                    subtitle: Text(product['description']),
                  );
                });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _updateProduct(context),
          child: const Icon(Icons.add),
        ));
  }

  void _createProduct(BuildContext context) {
    final client = GraphQLProvider.of(context).value;

    client.mutate(
      MutationOptions(
        document: gql(createProduct),
        variables: const {
          'title': 'apple',
          'price': 12.2,
          'description': 'eat eat eat just eat again',
          'categoryId': 6,
          'images': [
            'https://c02.purpledshub.com/uploads/sites/48/2022/04/nasa-artemis-moon-mission-3dad36d.jpg?w=1029&webp=1'
          ]
        },
        onCompleted: (data) {
          print(data);
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Save')));
        },
      ),
    );
  }

  void _updateProduct(BuildContext context) {
    final client = GraphQLProvider.of(context).value;

    client.mutate(
      MutationOptions(
        document: gql(updateProduct),
        variables: const {
          'title': 'banana',
          'price': 0,
          'description': 'eat eat eat just eat again',
          'categoryId': 1898,
          'images': [
            'https://c02.purpledshub.com/uploads/sites/48/2022/04/nasa-artemis-moon-mission-3dad36d.jpg?w=1029&webp=1'
          ]
        },
        onCompleted: (data) {
          print(data);
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Save')));
        },
      ),
    );
  }
}
