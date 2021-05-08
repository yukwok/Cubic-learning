import 'package:cubic_learning/cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

//add comments here if you like

//add second comments here if you like

// add the third comments line here if you want

class MyApp extends StatelessWidget {
  var bloc = new WeatherCubit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BlocProvider(
        create: (context) => bloc, // WeatherBloc instance
        child: HomePage('Flutter Cubit learning'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          return null;
        },
        builder: (context, state) {
          if (state is WeatherInitial) {
            return Text('WeatherInitial');
          } else if (state is WeatherLoading) {
            return Text('Loading');
          } else if (state is WeatherLoaded) {
            return Text('Loaded');
          }

          return Container(
            child: Center(child: Text('WeatherInitial')),
          );
        },
      ),
    );
  }
}
