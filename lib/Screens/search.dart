import 'package:doctor_search_example/Global/global.dart';
import 'package:doctor_search_example/Model/doctormodel.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? _special,_city;
  List<Doctor> searchedlist=[];
  void filterDoctors()
  {
    if(_special!=null && _city!=null){
      searchedlist=doctor_list.where((element) => element.spec==_special &&
                                    element.city==_city).toList();
    }
    else if(_special!=null)
    {
       searchedlist=doctor_list.where((element) => element.spec==_special ).toList();

    }
    else if(_city!=null)
    {
       searchedlist=doctor_list.where((element) => 
                                    element.city==_city).toList();
    }
    else{
      searchedlist.clear();
    }
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search'),),
      body:Column(
        children: [
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
                filterDoctors();
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
                filterDoctors();
              });
            },
          ),
          
          ),
          Expanded(child: Container(
            child: ListView.builder(
              itemCount: searchedlist.length ,
              itemBuilder: (context,index){
                Doctor doctor=searchedlist[index];
                return Container(height: 70,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      Text('Name ${doctor.name}'),
                      Text('Experience ${doctor.experience}'),
                      Text('Specailization ${doctor.spec}')
                    ],
                  ),
                ),
                );
              }),
          ))
        ],
      ) ,
    );
  }
}