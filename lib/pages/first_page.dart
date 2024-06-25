import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generated_routes/cubits/first_cubit.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key, required this.title});

  final String title;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second', arguments: {
                  'title':'Dynamic page',
                });
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => BlocProvider(
                //           create: (context) => SecondCubit(),
                //           child: const SecondPage(title: 'Second page'),
                //         )));
              },
              icon: const Icon(Icons.arrow_forward)),
        ],
      ),
      body: Center(
        child: BlocBuilder<FirstCubit, int>(
        builder: (context, state) {
          return Text(
            state.toString(),
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          );
        },
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          BlocProvider.of<FirstCubit>(context).increment();
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
