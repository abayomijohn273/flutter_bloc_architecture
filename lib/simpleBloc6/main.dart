import 'simpleBloc6/counterBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
              child: Text(
            "$count",
            style: TextStyle(fontSize: 32),
          ));
        },
      ),
      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatButton(
                Icons.add, () => counterBloc.add(CounterEvent.increment)),
            FloatButton(
                Icons.remove, () => counterBloc.add(CounterEvent.decrement)),
          ]),
    );
  }

  Widget FloatButton(IconData icon, Function bloc) {
    return FloatingActionButton(
      onPressed: bloc,
      child: Icon(
        icon,
        size: 30,
      ),
    );
  }
}
