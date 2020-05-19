import 'package:flutter/material.dart';
import 'counterEvent.dart';
import 'countBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _bloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Counter App"),
        ),
        body: StreamBuilder(
            stream: _bloc.counter,
            initialData: 0,
            builder: (context, AsyncSnapshot<int> snapshot) {
              return Container(
                child: Center(
                  child: Text(
                    "${snapshot.data}",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              );
            }),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
              child: Icon(Icons.add),
            ),
            SizedBox(width: 10, height: 10),
            FloatingActionButton(
              onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
              child: Icon(Icons.remove),
            ),
            SizedBox(width: 10, height: 10),
            FloatingActionButton(
              onPressed: () => _bloc.counterEventSink.add(IncrementIFive()),
              child: Text("+5"),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () => _bloc.counterEventSink.add(ResetEvent()),
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
