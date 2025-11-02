import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../data.dart';
import 'chart.dart';

class PartTwoScreen extends StatefulWidget {
  const PartTwoScreen({super.key});

  @override
  State<PartTwoScreen> createState() => _PartTwoScreenState();
}

class _PartTwoScreenState extends State<PartTwoScreen> {
  int selectlist = 0;
  final TextEditingController _textsearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFF1F1EF),
      body:  Column(
        children: [

          Container(
            width: double.infinity,
            height: 60,

            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Home
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Home', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),

                //Search
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 300,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _textsearch,
                      // maxLines: 1,
                      maxLength: 50,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(

                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white, fontSize: 18),

                        suffixIcon: Icon(Icons.search, color: Colors.white),
                        filled: true,
                        counterText: '',
                        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),

          //Text
          Container(

            child: Padding(
              padding: const EdgeInsets.only(left:  10.0, right: 10, bottom: 3),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF7C4DFF), Color(0xFF6EA8FE)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(14),
                ),
                width: double.maxFinite,

                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('ETHEREUM 2.0', style: TextStyle(color: Colors.white70)),
                      const SizedBox(height: 6),
                      const Text('Top Rating Project', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      const Text('Trending project and high rating\nProject Created by team.', style: TextStyle(color: Colors.white70)),
                      const SizedBox(height: 14),
                      ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Learn More')),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //row
          //list1
          Expanded(child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Expanded(child: Card(
                    color: Color(0xFF101C46),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          child: Container(
                              padding: EdgeInsets.only(left: 5,top: 5),
                              width: double.infinity,
                              color: Color(0xFF101C46),
                              child: Text('All Projects', style: const TextStyle(backgroundColor: Color(0xFF101C46), fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold))),
                        ),
                        Expanded(
                          child: ListView.builder(

                              itemCount: 3,
                              itemBuilder: (_, index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.all(5),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    selected: selectlist ==  index ? true : false,
                                    selectedTileColor: Colors.red,
                                    tileColor: Color(0xFF3C3449),
                                    onTap: (){setState(() {
                                      selectlist = index;
                                    });},

                                    leading: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.cyan,
                                        image: DecorationImage(
                                          image: AssetImage('assets/face/img${index+1}.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    title: Text('Technology behind the Blockchain', style: TextStyle(color: Colors.white),),
                                    subtitle: Text('Project #1 See project detail',style: TextStyle(color: Colors.white),),
                                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: selectlist == index ?Colors.white :Color(0xFF647AE4) ,)),
                                  ),
                                );
                              }),
                        ),


                      ],
                    ),
                  )),
                  //list2
                  Expanded(child: Card(
                    color: Color(0xFF101C46),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                           Padding(
                             padding: const EdgeInsets.only(top: 10, left: 10),
                             child: Container(
                                width: double.infinity,
                                color: Color(0xFF101C46),
                                child: Text('Top Creators', style: const TextStyle(backgroundColor: Color(0xFF101C46), fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold))
                             ),
                           ),

                        ListTile(
                          leading: Text('Name', style: TextStyle(fontSize: 16, color: Colors.grey),),


                          title: Text('Artworks', textAlign: TextAlign.end , style: TextStyle(fontSize: 16, color: Colors.grey),),
                          trailing: Text('Rating', style: TextStyle(fontSize: 16, color: Colors.grey),),

                        ),
                        Expanded(
                          child: ListView.builder(

                              itemCount: 6,
                              itemBuilder: (_, index){
                                return InkWell(
                                  onTap: (){},
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                      CircleAvatar(
                                              backgroundColor: Colors.cyan, radius: 20,
                                        backgroundImage: AssetImage('assets/face/img${index+1}.jpg'),
                                            ),
                                            SizedBox(width: 5,),
                                            Text('vishantkumar', style: TextStyle(fontSize: 14,color: Colors.white), ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('7745', style: TextStyle(fontSize: 14,color: Colors.white),),
                                            SizedBox(width: 10,),
                                            LinearPercentIndicator(
                                                lineHeight: 20.0,
                                                percent: 0.4,
                                                width: 100,
                                                progressColor: Color(0xFF0E38EF),
                                                backgroundColor: Color(0xA50E38EF),
                                                barRadius: Radius.circular(10),
                                                animation: true,
                                                animationDuration: 800,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }



                          )
                        ),


                      ],
                    ),
                  )),




                ],
              ),
            ),
          )),

          //graph
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:  10.0, right: 10, bottom: 10),
              child: SizedBox(
                height: 250,
                child: PerformanceChart(),
              ),
            ),
          ),



        ],
      )

    );
  }
}


