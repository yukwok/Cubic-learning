import 'package:cubic_learning/cubit/weather_cubit.dart';
import 'package:cubic_learning/repo/repository.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/weather.dart';

//push to main

void main() {
  runApp(MyApp());
}

//add comments here if you like

//add second comments here if you like

// add the third comments line here if you want

class MyApp extends StatelessWidget {
  final bloc = new WeatherCubit(FakeRepository());
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
        // title: Text('sfasfs'),
      ),
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherError) {
            print('fake network error.');
            showCenterFlash(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is WeatherInitial) {
            return buildInitialPage();
          } else if (state is WeatherLoading) {
            return Center(child: Text('Loading...'));
          } else if (state is WeatherLoaded) {
            return buildCityWeatherPage(state.weather);
          }

          return Container(
            child: Center(child: buildInitialPage()),
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

  Widget buildCityWeatherPage(Weather weather) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Text(
            weather.cityName.toUpperCase(),
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Text(
            '${weather.temperatureCelsius.toStringAsFixed(1)} deg Celsius',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          InputCityField(),
        ],
      ),
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
          bloc.getWeather(value);
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

void showCenterFlash(BuildContext context, String message
    // {
    //   // FlashPosition? position,
    //   // FlashStyle? style,
    //   // Alignment? alignment,
    // }
    ) {
  showFlash(
    context: context,
    duration: Duration(seconds: 5),
    builder: (_, controller) {
      return Flash(
        controller: controller,
        backgroundColor: Colors.black87,
        borderRadius: BorderRadius.circular(8.0),
        borderColor: Colors.blue,
        // position: position,
        // style: style,
        // alignment: alignment,
        enableDrag: false,
        onTap: () => controller.dismiss(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: Text(
              message,
            ),
          ),
        ),
      );
    },
  ).then((_) {
    if (_ != null) {
      // _showMessage(_.toString());
    }
  });
}
