

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PartTwo extends StatefulWidget {
  const PartTwo({super.key});

  @override
  State<PartTwo> createState() => _PartTwoState();
}

class _PartTwoState extends State<PartTwo> {

  DateTime date1 = DateTime.now();

  void _daySelected(DateTime day, DateTime selectday){
    setState(() {
      date1 = day;
    });
  }
  @override
  Widget build(BuildContext context) {

    var w1 = MediaQuery.of(context).size.width;

    final isWide = w1 > 789;

    return  Scaffold(
      backgroundColor: Color(0xFF1B244B),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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

                  // icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
            Expanded(
              child: Card(
                color: Color(0xFF3C3449),
                child: ListView(
                  children: [

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          SizedBox(height: 4),
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
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                            Icon(Icons.send_sharp,size: 10,color: Colors.white,),SizedBox(width: 4,),
                            Text('Birthday Wishing',style: TextStyle(color: Colors.white),),
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),

            //Anivert
            Expanded(
              child: Card(

                color:Color(0xFF3C3449) ,

                child: ListView(

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

                    SizedBox(
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
                          Icon(Icons.send_sharp,size: 10,color: Colors.white,), SizedBox(width: 4,),
                          Text('Anniversary Wishing',style: TextStyle(color: Colors.white)),
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
