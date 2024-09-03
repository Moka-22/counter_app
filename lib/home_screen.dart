import 'package:counter_app/utils/colors.dart';
import 'package:counter_app/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit/counter_dart_cubit.dart';
import 'counter_cubit/counter_dart_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'Counter App',
          fontSize: 30,
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return TextWidget(
                    text: state.counterValue.toString(),
                    fontSize: 100,
                  );
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).counterIncrement();
                    },
                    child: const TextWidget(
                      text: '+',
                      fontSize: 55,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).counterDecrement();
                    },
                    child: const TextWidget(
                      text: '-',
                      fontSize: 55,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
