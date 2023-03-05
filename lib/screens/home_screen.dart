import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weatherModels.dart';
import '../providers/weatherModelProvider.dart';
import '../widgets/customized_cart.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WeatherModel?> getOnce;

  Future<WeatherModel?> onStart() async {
    var weatherPorivder = Provider.of<WeatheModelProvider>(context);
    getOnce = weatherPorivder.getWeather('London');
    return getOnce;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authViewModel =
          Provider.of<WeatheModelProvider>(context, listen: false);

      authViewModel.getWeather('London');
    });
  }

  @override
  Widget build(BuildContext context) {
    var weatherPorivder = Provider.of<WeatheModelProvider>(context);

    // weatherPorivder.getWeather('London');
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/bc.jpg'))),
        child: weatherPorivder.weatherModel == null
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                appBar: AppBar(
                    centerTitle: true,
                    actions: [
                      IconButton(
                          onPressed: () {
                            weatherPorivder.getWeather('Nagpur');
                          },
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ))
                    ],
                    leading: IconButton(
                        onPressed: () {}, icon: Icon(Icons.location_city)),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(weatherPorivder.weatherModel!.location!.name!,
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                    )),
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    Column(
                      children: [
                        //     SizedBox(height: 20,),
                        SizedBox(
                          height: 20,
                        ),

                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Image.network(
                                  '${"http:" + weatherPorivder.weatherModel!.current!.condition!.icon!}',
                                  scale: 0.55,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    ' ${weatherPorivder.weatherModel!.current!.tempC!}*',
                                    style: TextStyle(
                                      fontSize: 50,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      weatherPorivder.weatherModel!.current!
                                          .condition!.text!,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                 Spacer(),
                               
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GridView(
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 200,
                                              childAspectRatio: 3 / 2.1,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10),
                                      children: [
                                        CustomizedCard(
                                            Icons.wind_power_sharp,
                                            weatherPorivder.weatherModel!
                                                .current!.condition!.text!,
                                            weatherPorivder.weatherModel!
                                                    .current!.windDegree!
                                                    .toString() +
                                                ' m/s',
                                            'Wind deg ' +
                                                weatherPorivder.weatherModel!
                                                    .current!.humidity
                                                    .toString()),
                                        CustomizedCard(
                                            Icons.cloud,
                                            weatherPorivder.weatherModel!
                                                .current!.windDir!,
                                            weatherPorivder.weatherModel!
                                                .location!.country!,
                                            'Sunset will be ' +
                                                weatherPorivder.weatherModel!
                                                    .location!.localtime!
                                                    .toString()),
                                        CustomizedCard(
                                            Icons.thermostat,
                                            'Temperature',
                                            weatherPorivder.weatherModel!
                                                .current!.feelslikeC
                                                .toString(),
                                            'Feels like ' +
                                                weatherPorivder.weatherModel!
                                                    .current!.feelslikeF
                                                    .toString()),
                                        CustomizedCard(
                                            Icons.waves,
                                            'Rain',
                                            weatherPorivder.weatherModel!
                                                    .current!.gustKph
                                                    .toString() +
                                                ' mm',
                                            ''),
                                      ],
                                    ),
                                  ),
                                ),
                             
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ));
  }
}


/*FutureBuilder<WeatherModel?>(
                future: weatherPorivder.getWeather('London'),
                builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();

                    }
                    return Scaffold(
                      appBar: AppBar(
                          centerTitle: true,
                          actions: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                ))
                          ],
                          leading: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.location_city)),
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          title: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('x',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white)),
                          )),
                      backgroundColor: Colors.transparent,
                      body: Stack(
                        children: [
                          Column(
                            children: [
                              //     SizedBox(height: 20,),
                              SizedBox(
                                height: 20,
                              ),

                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          'xx',
                                          style: TextStyle(
                                            fontSize: 50,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Text('data',
                                            style: GoogleFonts.sourceSerifPro(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20))),
                                      ),
                                      Text('Clouds'),
                                      Text('T:27 R:28'),
                                      //  Spacer(),
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GridView.builder(
                                            itemCount: 6,
                                            gridDelegate:
                                                SliverGridDelegateWithMaxCrossAxisExtent(
                                                    maxCrossAxisExtent: 200,
                                                    childAspectRatio: 3 / 2,
                                                    crossAxisSpacing: 20,
                                                    mainAxisSpacing: 20),
                                            itemBuilder: (context, index) =>
                                                Card(
                                              //      elevation: 0,
                                              color: Colors.transparent,
                                              child: Column(
                                                children: [
                                                  Text('s'),
                                                  Text('sd'),
                                                  Text('sasddas')
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    );
                 
                }));
  */