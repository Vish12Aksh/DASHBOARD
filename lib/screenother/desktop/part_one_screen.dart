import 'package:dashb/data.dart';
import 'package:dashb/model_data/model_data.dart';
import 'package:flutter/material.dart';

class PartoneScreen extends StatefulWidget {
  const PartoneScreen({super.key});

  @override
  State<PartoneScreen> createState() => _PartoneScreenState();
}

class _PartoneScreenState extends State<PartoneScreen> {
   int selectitem = 0;

   final data12 = Model_Data();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        children: [

          //Logo
          Container(
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
    );
  }
}
