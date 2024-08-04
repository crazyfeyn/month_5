import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: BlocBuilder<CounterBloc, CounterStates>(
        builder: (context, state) {
          if (state is LoadingCounterState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorCounterState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is InitialCounterState || state is LoadedCounterState) {
            return Center(
              child: Text(state.counter.toString(),
              ),
            );
          } else {
            return const Center(
              child: Text('Unknown state'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(IncrementEvent());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
