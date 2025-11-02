import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../data.dart';
import '../../model_data/model_data.dart';
import '../desktop/chart.dart';

class Mobile1 extends StatefulWidget {
  const Mobile1({super.key});

  @override
  State<Mobile1> createState() => _Mobile1State();
}

class _Mobile1State extends State<Mobile1> {
  int selectlist = 0;

  int selectitem = 0;
  final TextEditingController _textsearch = TextEditingController();

  DateTime date1 = DateTime.now();
  final data12 = Model_Data();

  void _daySelected(DateTime day, DateTime selectday){
    setState(() {
      date1 = day;
    });
  }


  @override
  Widget build(BuildContext context) {


    var w1 = MediaQuery.of(context).size.width;
     final isWide = w1 > 789;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        title: Text('Dashboard'),


      ),
      //Drawer of right
      drawer:  Drawer(
        width: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){setState(() {
                  Navigator.of(context).pop();
                });}, icon: Icon(Icons.exit_to_app, color: Colors.black, size: 18,)
                ),
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
            ColoredBox(
              color: Color(0xFF569FF3),
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
            Container(
              height: 80,
              width: double.infinity,
              child: ListView.builder(
                itemCount: Workspaces.length,
                itemExtent: 35,
                itemBuilder: (context, index) {
                  List<Map<String, dynamic>> menu = Workspaces;
                  return ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    onTap: (){
                      setState(() {
                        selectitem = index;
                      });
                    },
                    selected:selectitem == index ? true: false,
                    selectedTileColor: Colors.grey[300],
                    tileColor: Colors.white,
                    trailing: menu[index]['Icons'],
                    title: Text(menu[index]['Text'], style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black,),
                    ),
                  );
                },
              ),
            ),

            Container(
              width: double.infinity,
              height: 80,
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
                  ),
                ],
              ),
            )

          ],
        ),
      ),

      // Drawer left
      endDrawer: Drawer(
          width: double.infinity,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          backgroundColor: Colors.white,
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  color : Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(onPressed: (){ Navigator.of(context).pop();}, icon: Icon(Icons.assignment_return, size: 28, color: Colors.black87)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.assignment_turned_in, size: 28, color: Colors.black87)),
                          Stack(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none, size: 28, color: Colors.black87)),
                              Positioned(
                                  top: 10,
                                  right: 12,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      shape: BoxShape.circle,
                                    ),
                                  ))
                            ],
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.power_settings_new, size: 28, color: Colors.black87)),
            
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.5),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              // backgroundImage: AssetImage(''),
                              backgroundColor: Colors.red,
                            ),
                          ],
                        ),
                      )
            
                    ],
                  ),
                ),
            
                //text general
                SizedBox(
                    width: double.infinity,
                    child: Text(isWide? 'GENERAL 10:00 TO 7:00 PM'.toUpperCase() : 'GENERAL 10:00'.toUpperCase(), style: TextStyle(height: 1.5,fontSize: 15, fontWeight: FontWeight.normal , color: Colors.white), textAlign: TextAlign.start,)
                ),
            
                //calendar
            
                Card(
                  child: TableCalendar(
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    availableGestures: AvailableGestures.all,
                    focusedDay: date1,
                    rowHeight: 28,
                    firstDay: DateTime.utc(2010, 12, 30),
                    lastDay: DateTime.utc(2030, 12, 30),
                    onDaySelected: _daySelected,
                    selectedDayPredicate: (day) => isSameDay(day, date1),
            
                  ),
                ),
            
                //birth

                   Card(
                    color: Color(0xFF3C3449),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
            
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Icon(Icons.auto_awesome, color: Colors.yellow, size: 20),
                              SizedBox(width: 8),
                              Text(
                                "Today Birthday",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.auto_awesome, color: Colors.yellow, size: 20),
            
                            ]
                        ),
                        SizedBox(height: 16),
            
                        Container(
                          width: double.infinity,
                          height: 60,
                          child: ListView.builder(
                              itemCount: 2,
                              scrollDirection: Axis.horizontal,
            
                              itemBuilder: (context,index){
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all( color: Colors.blueAccent,)
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xFF807B8B), radius: 22, child: Text('P',style: TextStyle(fontSize: 15),), ),
                                      ),
                                      Positioned(top :0, right : 0,
                                          child: Icon(Icons.cake,size: 16,color: Colors.red,)
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text('Total',textAlign: TextAlign.start, style: TextStyle(color: Colors.white,fontSize: 16),),
                            Row(
                              children: [
                                Text('|', style: TextStyle(fontSize: 24, color: Colors.grey)) ,
                                SizedBox(width: 13,),
                                Text('2',textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 16),),
                                SizedBox(width: 13,),
                                Text('|', style: TextStyle(fontSize: 24, color: Colors.grey)),
                              ],
                            ),
            
                            Text('',textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 16),),
            
                          ],
                        ),
            
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6 ,vertical: 8.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 35,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFBA7DF4),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                ),
                                onPressed: (){}, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.send_sharp,size: 10,color: Colors.white,),SizedBox(width: 15,),
                                Text('Birthday Wishing',style: TextStyle(color: Colors.white),),
                              ],
                            )),
                          ),
                        )
                      ],
                    ),
                  ),

            
                //Anivert
                Card(
            
                    color:Color(0xFF3C3449) ,
            
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
            
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Icon(Icons.auto_awesome, color: Colors.yellow, size: 20),
                              SizedBox(width: 8),
                              Text(
                                "Anniversary",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
            
                              Icon(Icons.auto_awesome, color: Colors.yellow, size: 20),
            
                            ]
                        ),
                        SizedBox(height: 8),
            
                        Container(
                          width: double.infinity,
                          height: 60,
                          child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
            
                              itemBuilder: (context,index){
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all( color: Colors.blueAccent,)
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xFF807B8B) , radius: 22, child: Text('P',style: TextStyle(fontSize: 15),), ),
                                  ),
                                );
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text('Total',textAlign: TextAlign.start, style: TextStyle(color: Colors.white,fontSize: 16),),
            
            
                            Row(
                              children: [
                                Text('|', style: TextStyle(fontSize: 24, color: Colors.grey)) ,
                                SizedBox(width: 13,),
                                Text('3',textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 16),),
                                SizedBox(width: 13,),
                                Text('|', style: TextStyle(fontSize: 24, color: Colors.grey)),
                              ],
                            ),
            
            
                            Text('',textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 10,),
            
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 6),
                          child: SizedBox(
                            width: double.infinity,
                            height: 30,
                            child: ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFBA7DF4),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                ),
                                onPressed: (){}, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.send_sharp,size: 10,color: Colors.white,), SizedBox(width: 15,),
                                Text('Anniversary Wishing',style: TextStyle(color: Colors.white)),
                              ],
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                SizedBox(height: 5,),

            
            
              ],
            ),
          ),
      ),


      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Home
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 5.0),
                            child: Text('Home', style: TextStyle(fontSize: 16, color: Colors.black , fontWeight: FontWeight.bold)),
                          ),
                      //Search
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: _textsearch,
                          // maxLines: 1,
                          maxLength: 50,
                          style: TextStyle(fontSize: 16, color: Colors.white),
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
                      )

                    ],
                  ),
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
                          const Text('ETHEREUM 2.0', style: TextStyle(fontSize: 12,color: Colors.white70)),
                          const SizedBox(height: 6),
                          const Text('Top Rating \nProject', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          const Text('Trending project and high rating Project Created by team.', style: TextStyle(fontSize: 12, color: Colors.white70)),
                          const SizedBox(height: 14),
                          ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Learn More',style: TextStyle(fontSize: 12),)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //row
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: Column(

                    children: [
                      //list1

                      Card(
                        color: const Color(0xFF101C46),
                        margin: EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'All Projects',
                                style: const TextStyle(
                                  backgroundColor: Color(0xFF101C46),
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                height: 160,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 5,

                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.all(5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      selected: selectlist == index,
                                      selectedTileColor: Colors.red,
                                      tileColor: Color(0xFF3C3449),
                                      onTap: () {
                                        setState(() {
                                          selectlist = index;
                                        });
                                      },
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
                                      title: Text(
                                        'Technology behind the Blockchain',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      subtitle: Text(
                                        'Project #1 See project detail',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.edit, color: selectlist == index ?Colors.white :Color(0xFF647AE4) ),
                                      ),
                                    );

                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //list2
                      Card(
                        color: Color(0xFF101C46),
                        margin: EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 10),
                                child: Container(
                                  width: double.infinity,
                                  color: Color(0xFF101C46),
                                  child: Text(
                                    'Top Creators',
                                    style: TextStyle(
                                      backgroundColor: Color(0xFF101C46),
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ListTile(
                                leading: Text('Name', style: TextStyle(fontSize: 15, color: Colors.grey)),
                                title: Text('Artworks', textAlign: TextAlign.end, style: TextStyle(fontSize: 16, color: Colors.grey)),
                                trailing: Text('Rating', style: TextStyle(fontSize: 15, color: Colors.grey)),
                              ),
                              Container(
                                width: double.infinity,
                                height: 130,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 8,
                                  itemBuilder: (_, index) {
                                    return InkWell(
                                      onTap: () {},
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
                                                SizedBox(width: 5),
                                                Text(
                                                  'vishantkumar',
                                                  style: TextStyle(fontSize: 12, color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text('7745', style: TextStyle(fontSize: 12, color: Colors.white)),
                                                SizedBox(width: 10),
                                                LinearPercentIndicator(
                                                  lineHeight: 15,
                                                  percent: 0.4,
                                                  width: 50,
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
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //graph
              Container(
                width: double.infinity,
                height: 400,
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
        ),
      ),
    );
  }
}
