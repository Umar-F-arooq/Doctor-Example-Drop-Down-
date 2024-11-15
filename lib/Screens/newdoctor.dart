import 'package:doctor_search_example/Global/global.dart';
import 'package:doctor_search_example/Model/doctormodel.dart';
import 'package:flutter/material.dart';

class NewDoctor extends StatefulWidget {
  const NewDoctor({super.key});

  @override
  State<NewDoctor> createState() => _NewDoctorState();
}

class _NewDoctorState extends State<NewDoctor> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController experiencecontroller=TextEditingController();
  String ?_city,_special;
   List<DropdownMenuItem<String>> menuItems2()
   {
      return  specialization_list.map((e){
        return DropdownMenuItem<String>(
          value: e,
          child: Text(e));
      }).toList();
   }
  List<DropdownMenuItem<String>> menuItems()
  {
    List<DropdownMenuItem<String>> items=[];
    for(int i=0;i<specialization_list.length;i++)
    {
      DropdownMenuItem<String> item=DropdownMenuItem<String>(
        value: specialization_list[i],
        child: Text(specialization_list[i]),);
        items.add(item);

    }
    return items;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor Detail'),),
      body: Column(
        children: [
          Container(
            height: 70,
            width: 150,
            child: TextFormField(
              controller: namecontroller,
              decoration: InputDecoration(
                hintText: 'Name',
                labelText: 'Name'
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text('Specialization'),
          Container(height: 60,width: 150,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5)
          ),
          child: DropdownButton(
            isExpanded: true,
            value: _special,
            //items: menuItems() or
            items:specialization_list.map((e){
                          return DropdownMenuItem<String>(
                               value: e,
                         child: Text(e));
                        }).toList(),
            onChanged: (String? _selectedItem){
              setState(() {
                _special=_selectedItem;
              });
            },
          ),
          
          )
          ,
          SizedBox(height: 10,),
          Text('City'),
          Container(height: 60,width: 150,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5)
          ),
          child: DropdownButton(
            isExpanded: true,
            value: _city,
            //items: menuItems() or
            items:cities_list.map((e){
                          return DropdownMenuItem<String>(
                               value: e,
                         child: Text(e));
                        }).toList(),
            onChanged: (String? _selectedItem){
              setState(() {
                _city=_selectedItem;
              });
            },
          ),
          
          ),
          Container(
            height: 70,
            width: 150,
            child: TextFormField(
              controller: experiencecontroller,
              decoration: InputDecoration(
                hintText: 'Experience',
                labelText: 'Experience'
              ),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            Doctor doctor=Doctor(city: _city!, 
                                 experience:int.parse(experiencecontroller.text),
                                  name: namecontroller.text,
                                   spec: _special!);
            doctor_list.add(doctor);

          }, child: Text('Add'))


        ],
      ),
    );
  }
}
