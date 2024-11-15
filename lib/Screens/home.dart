import 'package:doctor_search_example/Screens/newdoctor.dart';
import 'package:doctor_search_example/Screens/search.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return NewDoctor();

            }
            )
            );

          }, child: Text('New Doctor')),
          SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
              return SearchScreen();

            }
            )
            );

          }, child: Text('Search Doctor')),
        ],
      ),
    );
  }
}