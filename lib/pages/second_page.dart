import 'package:flutter/material.dart';
import 'package:generated_routes/cubits/second_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.title});

  final String title;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => BlocProvider(
                //           create: (context) => ThirdCubit(),
                //           child: const ThirdPage(title: 'Third page'),
                //         )));
              },
              icon: const Icon(Icons.arrow_forward)),
        ],
      ),
      body: Center(
        child: BlocBuilder<SecondCubit, int>(builder: (context, state) {
          return Text(
            state.toString(),
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          BlocProvider.of<SecondCubit>(context).increment();
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
