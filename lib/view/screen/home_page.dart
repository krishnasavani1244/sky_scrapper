import 'package:flutter/material.dart';
import 'package:sky_scrapper/model/weather_model.dart';
import 'package:sky_scrapper/services/weather_api_client.dart';
import 'package:sky_scrapper/view/screen/additional_information.dart';
import 'package:sky_scrapper/view/screen/current_wether.dart';


class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void>getData() async{
    data = await client.getCurrentWeather("surat");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:Colors.white,
          elevation: 0,

          title: Text(
            "Weather App",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu),
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.sunny),
              color: Colors.black,
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
                child:Padding(
                  padding: EdgeInsets.all(16),

                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.search),
                  ),
                  onSubmitted: (val){
                    setState(() {
                    });
                  },
                ),
            ),
            ),
            Expanded(
              flex: 20,
                child: FutureBuilder(
                  future: getData(),
                  builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.done ){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          current_wether(Icons.wb_sunny_rounded, "${data!.temp}", "${data!.cityName}"),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Additional Information",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 20,
                          ),
                          additionalInofrmation("${data!.wind}", "${data!.humidity}", "${data!.pressure}", "${data!.feels_like}"),

                        ],
                      );
                    }else if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),
                      );
                    }
                    return Container();
                  },
                ),
            ),
          ],
        )
    );
  }
}

