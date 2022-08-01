import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather_data.dart';

import 'getLocation.dart';


var dayinfo = DateTime.now();
var dayformate = DateFormat('EEEE, d MMM, yyyy').format(dayinfo);

class MyHome extends StatelessWidget {

  var client = WeatherData();
  var data;

  info() async
  {
    var position = await GetPosition();
    data = await client.getData(position.latitude,position.longitude);
    return data;
}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: ((context,snapshort){

          return Container(

            child: Column(

              children: [
              SizedBox(
              height: 10,
            ),
                Container(
                  height: size.height * 0.96,
                  width: size.width,
                  padding: EdgeInsets.only(top: 30),
                  margin: EdgeInsets.only(right: 10,left: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40),
                    // gradient: LinearGradient(colors: [Color(0xfcb827ec),
                    //   Color(0xff3350ee),
                    // ],

                    //   begin: Alignment.bottomCenter,
                    //   end: Alignment.topCenter,
                    //   stops: [0.2,0.85],
                    // ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text('${data?.citynm}',style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 35,
                        fontStyle:FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        dayformate
                        ,style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 15,
                        fontStyle:FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(
                        height: 10,
                      ),
                      // Image.asset('img/sun.png',
                      //   width: size.width * 0.3,),
                      Image.network('https:${data?.icon}',
                      width: size.width * 0.36,
                      fit: BoxFit.fill,),
                      SizedBox(
                        height: 10,
                      ),
                      Text('${data?.condition}',style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontStyle:FontStyle.italic,
                        fontWeight: FontWeight.w600,
                      ),),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${data?.temp}°',style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontStyle:FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: Column(
                            children: [
                              Image.asset('images/wind.png',
                                width: size.width * 0.15,),
                              Text('${data?.wind} Km/h',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Wind',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white.withOpacity(0.6),
                                ),),
                            ],
                          ),),
                          Expanded(child: Column(
                            children: [
                              Image.asset('images/humidity.png',
                                width: size.width * 0.15,),
                              Text('${data?.humidity}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Humidity',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white.withOpacity(0.6),
                                ),),
                            ],
                          ),),
                          Expanded(child: Column(
                            children: [
                              Image.asset('images/weather-vane.png',
                                width: size.width * 0.15,),
                              Text('${data?.wind_dir}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Wnd Direction',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white.withOpacity(0.6),
                                ),),
                            ],
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Row(
                //   children: [
                //     Expanded(child: Column(
                //       children: [
                //         Text('Gust',
                //           style: TextStyle(
                //             fontStyle: FontStyle.italic,
                //             fontSize: 17,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white.withOpacity(0.5),
                //           ),),
                //         SizedBox(
                //           height: 5,
                //         ),
                //         Text('${data?.gust} Kp/h',
                //           style: TextStyle(
                //             fontStyle: FontStyle.italic,
                //             fontSize: 23,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white,
                //           ),),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         Text('Pressure',
                //           style: TextStyle(
                //             fontStyle: FontStyle.italic,
                //             fontSize: 17,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white.withOpacity(0.5),
                //           ),),
                //         SizedBox(
                //           height: 5,
                //         ),
                //         Text('${data?.pressure} hpa',
                //           style: TextStyle(
                //             fontStyle: FontStyle.italic,
                //             fontSize: 23,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white,
                //           ),),
                //       ],
                //     ),),
                //     Expanded(child: Column(
                //       children: [
                //         Text('UV',
                //           style: TextStyle(
                //             fontStyle: FontStyle.italic,
                //             fontSize: 17,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white.withOpacity(0.5),
                //           ),),
                //         SizedBox(
                //           height: 5,
                //         ),
                //         Text('${data?.uv}',
                //           style: TextStyle(
                //             fontStyle: FontStyle.italic,
                //             fontSize: 23,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white,
                //           ),),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         Text('Precipitation',
                //           style: TextStyle(
                //             fontStyle: FontStyle.italic,
                //             fontSize: 17,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white.withOpacity(0.5),
                //           ),),
                //         SizedBox(
                //           height: 5,
                //         ),
                //         Text('${data?.pricipe} mm',
                //           style: TextStyle(
                //             fontStyle: FontStyle.italic,
                //             fontSize: 23,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white,
                //           ),),
                //       ],
                //     ),),
                //     Expanded(child: Column(
                //       children: [
                //         Text('Wind',
                //           style: TextStyle(
                //             fontStyle: FontStyle.italic,
                //             fontSize: 17,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white.withOpacity(0.5),
                //           ),),
                //         SizedBox(
                //           height: 5,
                //         ),
                //         Text('${data?.wind} Km/h',
                //           style: TextStyle(
                //             fontStyle: FontStyle.italic,
                //             fontSize: 23,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white,
                //           ),),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         Text('Last Update',
                //           style: TextStyle(
                //             fontStyle: FontStyle.italic,
                //             fontSize: 17,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white.withOpacity(0.5),
                //           ),),
                //         SizedBox(
                //           height: 5,
                //         ),
                //         Text('${data?.last_update}',
                //           style: TextStyle(
                //             fontStyle: FontStyle.italic,
                //             fontSize: 14,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white,
                //           ),),
                //       ],
                //     ),),
                //   ],
                // ),
              ],
            ),
          );
    }),),
    );
  }
}
