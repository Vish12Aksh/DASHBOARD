

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../data.dart';
import '../../model_data/model_data.dart';
import '../desktop/chart.dart';


class PartOne extends StatefulWidget {
  const PartOne({super.key});

  @override
  State<PartOne> createState() => _PartOneState();
}

class _PartOneState extends State<PartOne> {
  int selectlist = 1;
  bool mepos = false;
  int selectitem = 0;
  final data12 = Model_Data();
  final TextEditingController _textsearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var w1 = MediaQuery.of(context).size.width;

    final isWide = w1 > 889;

    return  Scaffold(
        backgroundColor: Color(0xFFF1F1EF),
        body:  Stack(
          children: [
            Column(
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
                      Row(
                        children: [
                          IconButton(onPressed: (){setState(() {
                            mepos = true;
                          });}, icon: Icon(Icons.menu_open_rounded)),
                          SizedBox(width: 5,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('Home', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ],
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
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        //list1
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
                                          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: selectlist == index ?Colors.white :Color(0xFF647AE4) ,)),
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

                                      itemCount: 8,
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
                                                    Text(isWide? 'vishantkumar': 'vishantkumar'.substring(0,5)+'..', style: TextStyle(fontSize: 14,color: Colors.white), ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('7745', style: TextStyle(fontSize: 14,color: Colors.white),),
                                                    SizedBox(width: 10,),
                                                    LinearPercentIndicator(
                                                      lineHeight: isWide? 20.0 : 15,
                                                      percent: 0.4,
                                                      width: isWide? 80 :50,
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
            ),
            Positioned(
                top: 0,
                left: 0,
                child: Visibility(
              visible: mepos,
              child: Container(
                width: 300,
                height: 900,
                color: Color(0xFFFFFFFF),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){setState(() {
                          mepos = false;
                        });}, icon: Icon(Icons.exit_to_app, color: Colors.black, size: 18,)
                        ),

                        //Logo
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            width: 50,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(color: Colors.white),
                            ),
                            child: Image.asset(
                              'assets/images/img.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),


                    Divider(
                      color: Colors.grey[200],
                      thickness: 2,
                      height: 20,
                    ),

                    // Admin
                    Card(child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.yellow, width: 3),
                                ),
                                child: CircleAvatar(
                                  radius: 26,
                                  backgroundImage: NetworkImage(
                                    'https://static.vecteezy.com/system/resources/thumbnails/025/221/284/small_2x/picture-a-captivating-scene-of-a-tranquil-lake-at-sunset-ai-generative-photo.jpg',
                                  ),
                                  backgroundColor: Colors.lightBlue,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Vishant kumar',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.blue, width: 2),
                                  ),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  elevation: 4,
                                ),
                                onPressed: () {},
                                child: SizedBox(
                                  width: 80,
                                  height: 25,
                                  child: Center(
                                    child: Text('Admin',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )

                    ),),
                    Divider(
                      color: Colors.grey[200],
                      thickness: 2,
                      height: 20,
                    ),

                    //Menu-item
                    Container(
                      height: 180,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: data12.item_menu.length,
                        itemExtent: 35,
                        itemBuilder: (context, index) {

                          return ListTile(

                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only( topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))),
                            leading: Icon(data12.item_menu[index].icon, color: selectitem == index ? Colors.black:  Color(0xFF9C9898),),
                            onTap: (){
                              setState(() {
                                selectitem = index;

                              });
                            },
                            title: Text(data12.item_menu[index].title, style: TextStyle( fontSize: 16, fontWeight: selectitem == index ? FontWeight.bold : FontWeight.normal,  color: selectitem == index ? Colors.black:  Color(0xFF9C9898),),),
                            selected: selectitem == index ? true : false,
                            selectedTileColor: Color(0xFFBFBFBF),
                            dense: true,
                            visualDensity:  VisualDensity(vertical: -4),
                          );
                        },
                      ),
                    ),

                    //workspace
                    ColoredBox(
                      color: Colors.lightBlueAccent,
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('WORKSPACES', style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),
                            IconButton(onPressed: (){}, icon: Icon(Icons.add))
                          ],
                        ),
                      ),
                    ),

                    //workspace-item
                    Container(
                      height: 180,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: Workspaces.length,
                        itemExtent: 35,
                        itemBuilder: (context, index) {
                          List<Map<String, dynamic>> menu = Workspaces;
                          return ListTile(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            onTap: (){},
                            trailing: menu[index]['Icons'],
                            title: Text(menu[index]['Text'], style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black,),
                            ),
                          );
                        },
                      ),
                    ),

                    //Bottom-item
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            selected: false,
                            selectedColor: Colors.red,
                            selectedTileColor: Colors.pink[200],
                            tileColor: Colors.white,
                            hoverColor: Colors.orange,
                            focusColor: Colors.green,
                            onTap: (){print('setting');},
                            leading: Icon(Icons.settings, size: 16,),
                            title: Text('Setting', style: TextStyle(fontSize: 16, color: Colors.black),),

                            dense: true,
                            visualDensity:  VisualDensity(vertical: -4),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                          ),

                          ListTile(
                            selected: false,
                            selectedColor: Colors.red,
                            selectedTileColor: Colors.pink[200],
                            tileColor: Colors.white,
                            hoverColor: Colors.orange,
                            focusColor: Colors.green,
                            onTap: (){print('Logout');},
                            leading: Icon(Icons.logout, size: 16,),
                            title: Text('Logout', style: TextStyle(fontSize: 16, color: Colors.black),),

                            dense: true,
                            visualDensity:  VisualDensity(vertical: -4),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ))
          ],

        )

    );
  }
}


