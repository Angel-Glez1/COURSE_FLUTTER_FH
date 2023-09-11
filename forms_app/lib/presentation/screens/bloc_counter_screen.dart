import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCountScreen extends StatelessWidget {
  const BlocCountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const _BlocCountView(),
    );
  }
}

class _BlocCountView extends StatelessWidget {
  
  const _BlocCountView();

  void increaseCounterBy(BuildContext context, [ int value = 1 ]){
    context.read<CounterBloc>()
      .add( CounterIncrased(value) )
    ;
  }


  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: AppBar(
        title: context.select(( CounterBloc counterBloc) => Text('Transactions: ${counterBloc.state.transactionCount}')),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add( CounterReset() )  , 
            icon: const Icon( Icons.refresh_outlined ),
          ),
        ],
      ),
      body: Center( 
        child: context.select(( CounterBloc counterBloc) => Text('Counter value: ${counterBloc.state.counter}'))
       ),
       floatingActionButton: Column( 
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          
          FloatingActionButton(
            heroTag: 1,
            onPressed: () => increaseCounterBy(context, 3),
            child: const Text('+3'),
          ),
          
          const SizedBox(height: 15,),

          FloatingActionButton(
            heroTag: 1,
            onPressed: () => increaseCounterBy(context, 2),
            child: const Text('+2'),
          ),

          const SizedBox(height: 15,),

          FloatingActionButton(
            heroTag: 1,
            onPressed: () => increaseCounterBy(context, 1),
            child: const Text('+1'),
          ),

        ],
      ),
    );
  }
} 