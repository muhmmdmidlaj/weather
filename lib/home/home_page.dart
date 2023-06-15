// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:weather_app/api/get_location.dart';
import 'package:weather_app/api/weather_data.dart';
import 'package:intl/intl.dart';

var dayinfo = DateTime.now();
var dateFormat = DateFormat('EEE, d MMM, yyyy').format(dayinfo);

// ignore: must_be_immutable
class HomePaage extends StatelessWidget {
  var client = WeatherData();
  var data;
  // final _textController = TextEditingController();

  HomePaage({super.key});

  info() async {
    // city = _textController.text;
    data = await client.getdata('calicut');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: FutureBuilder(
      future: info(),
      builder: (context, snapshot) {
        return ListView(children: [
          Column(
            children: [
              Container(
                height: size.height * 0.75,
                width: size.width,
                padding: const EdgeInsets.only(top: 30),
                margin: const EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff955cd1),
                      Color(0xff3fa2fa),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.2, 0.85],
                  ),
                ),
                child: Column(
                  children: [
                    // Padding(
                    //     padding: const EdgeInsets.all(15.0),
                    //     child: TextFormField(
                    //       controller: _textController,
                    //       decoration: InputDecoration(
                    //         border: OutlineInputBorder(),
                    //         hintText: 'Location',
                    //       ),
                    //     )),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       final _text = _textController.text;
                    //       info(_text);
                    //     },
                    //     child: Text('Search Weather')),
                    Text(
                      data?.cityName,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 30,
                          fontFamily: ' MavenPro'),
                    ),
                    Text(
                      dateFormat,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 15,
                          fontFamily: ' MavenPro'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //
                    Image.network(
                      'https:${data?.icon}',
                      width: size.width * 0.3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${data?.conditions}',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            fontFamily: ' MavenPro'),
                      ),
                    ),
                    Text(
                      '${data?.temp}°',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 70,
                          fontWeight: FontWeight.w600,
                          fontFamily: ' MavenPro'),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/img/icons8-windwhite-100.png',
                                width: size.width * 0.1,
                              ),
                              Text(
                                '${data?.wind}  km/h',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Hubballi',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Wind',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Hubballi',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/img/cloudy.png',
                                width: size.width * 0.1,
                              ),
                              Text(
                                '${data?.humidity}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Hubballi',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Humidity',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Hubballi',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/img/icons8-windflag-100.png',
                                width: size.width * 0.1,
                              ),
                              Text(
                                '${data?.windDirection}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Hubballi',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Wind Direction',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Hubballi',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Gust',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data?.gust} kp/h',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'MavenPro',
                            fontSize: 23,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Pressure',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data?.pressure} hps',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'MavenPro',
                            fontSize: 23,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'UV',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data?.uv}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'MavenPro',
                            fontSize: 23,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Precipation',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data?.precipation} mm',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'MavenPro',
                            fontSize: 23,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Wind',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.5),
                          fontFamily: 'MavenPro',
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.wind}.km/h',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'MavenPro',
                          fontSize: 23,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Last Upadate',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.5),
                          fontFamily: 'MavenPro',
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.lastUpadte}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontFamily: 'MavenPro',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ))
                ],
              )
            ],
          ),
        ]);
      },
    ));
  }
}
