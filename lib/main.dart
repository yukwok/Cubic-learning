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
  final bloc = new WeatherCubit();
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

class HomePage extends StatefulWidget {
  final String title;

  HomePage(this.title);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          return null;
        },
        builder: (context, state) {
          if (state is WeatherInitial) {
            return buildInitialPage();
          } else if (state is WeatherLoading) {
            return Center(child: Text('Loading...'));
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

  Widget buildInitialPage() {
    return Center(
      child: InputCityField(),
    );
  }
}

class InputCityField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<WeatherCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onChanged: (value) {},
        onSubmitted: (value) {
          bloc.getWeather();
        },
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter cityname",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
