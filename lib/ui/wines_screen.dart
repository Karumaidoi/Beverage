import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:winery/colors/app_colors.dart';
import 'package:winery/model/data_model.dart';
import 'package:http/http.dart' as http;

class WineScreen extends StatefulWidget {
  WineScreen({Key? key}) : super(key: key);

  @override
  State<WineScreen> createState() => _WineScreenState();
}

class _WineScreenState extends State<WineScreen> {
  late Future<List<Wines>> myData;

  @override
  void initState() {
    super.initState();
    myData = getWines();
  }

  Future<List<Wines>> getWines() async {
    const url = 'https://api.sampleapis.com/wines/reds';
    final response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    print(jsonData);

    return jsonData.map<Wines>(Wines.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: myData,
          builder: ((context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(
                  child: Text('An error occured. \n Please try again.'));
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
               final wines = snapshot.data;
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: wines.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: AppColors.lightColor,
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage: CachedNetworkImageProvider(wines[index].image),),
                        title: Text(
                          wines[index].wine,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Chip(label: Text(wines[index].location.toString().split('\n·\n')[0])),
                                SizedBox(width: 12,),
                                
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(wines[index].winery),
                                
                                //  Text(wines[index].location.toString().split('\n·\n')[1]),
                              ],
                            ),
                           
                          ],
                        ),
                        isThreeLine: true,
                        trailing:  Chip(
                                backgroundColor: AppColors.auditionColor,
                                label: Text(wines[index].rating.average.toString(),
                                )),
                      ),
                    );
                  });
            }
          
            
          })),
    );
  }
}
