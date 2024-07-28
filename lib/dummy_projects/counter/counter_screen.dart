import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_g24_1/dummy_projects/counter/cubit/counter_cubit.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text(
              cubit.counterText.toString(),
              style: TextStyle(color: Colors.white),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit.increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  cubit.counterText.toString(),
                  style: TextStyle(
                    fontSize: 50,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
