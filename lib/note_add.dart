
import 'package:flutter/material.dart';

import 'note_screen.dart';



class NodeAdd extends StatefulWidget {
  const NodeAdd({super.key});


  @override
  State<NodeAdd> createState() => _NodeAddState();
}

class _NodeAddState extends State<NodeAdd> {
  TextEditingController titlecontroller =TextEditingController();
  TextEditingController Discriptioncontroller =TextEditingController();
  final _mykey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Add your note",style:TextStyle(
            color: Colors.black,
            fontSize: 25,
          )),
        ),
      ),
      body:  Column(
        children: [
          Form(
              key: _mykey,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  TextFormField(
                    controller:titlecontroller,
                    validator: (value){
                      if(value == null || value== ""){
                        return "title cant't empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: "title",
                        hintStyle: TextStyle(
                          fontSize: 25,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,

                        )
                    ),
                  ),
                 SizedBox(height: 15,),
                  TextFormField(
                    controller: Discriptioncontroller,
                    validator: (value){
                      if(value== null || value==""){
                        return "discription can't empty";
                      }
                      else if(value.length<200){
                        return "you can't type latter more then 100";
                      }
                      return null;
                    },
                    maxLines: 15,
                    maxLength: 200,
                    decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: "type something here",
                        hintStyle: TextStyle(
                            fontSize: 18
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )
                    ),
                  ),

                ],
              ))
        ],

      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton
          (
          backgroundColor: Colors.green,
          onPressed: (){
            setState(() {
              Map<String,dynamic> notedata={
                "date":DateTime.now(),
                "title" :titlecontroller.text,
                "discription":Discriptioncontroller.text,
              };
              notelist.add(notedata);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StartScreen()));
            });
          },
          child: Icon(Icons.save,color: Colors.white,size: 40,),),
      ),
    );
  }
}



