import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testbloc/Counter_Cubit.dart';
import 'package:testbloc/Counter_State.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        title: 'TestCubit',
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstAppBloc'),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {},
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                  return Text(
                    state.count.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  );
                  Future.delayed(Duration(seconds: 5));
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).increment();
                          Get.snackbar('InCrement', '++',
                              duration: Duration(seconds: 1));
                        },
                        child: Icon(CupertinoIcons.add_circled)),
                    FlatButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).decrement();
                          Get.snackbar('DeCrement', '--',
                              duration: Duration(seconds: 2));
                        },
                        child: Icon(CupertinoIcons.minus_circled)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
