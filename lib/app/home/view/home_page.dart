import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/components.dart';
import '../bloc/bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Center(
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${BlocProvider.of<AppBloc>(context).state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () =>
                              context.read<AppBloc>().add(Decrement()),
                          icon: const Icon(Icons.remove),
                          label: const Text('Decrement'),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () =>
                              context.read<AppBloc>().add(Increment()),
                          icon: const Icon(Icons.add),
                          label: const Text('Increment'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'heroTag1',
            tooltip: 'Decrement',
            onPressed: () => BlocProvider.of<AppBloc>(context).add(Decrement()),
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: 'heroTag2',
            tooltip: 'Increment',
            onPressed: () => BlocProvider.of<AppBloc>(context).add(Increment()),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
