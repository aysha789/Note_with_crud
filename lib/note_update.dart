import 'package:flutter/material.dart';

import 'note_screen.dart';

class NodeUpdate extends StatefulWidget {
  const NodeUpdate({super.key, required this.date, required this.title, required this.subtitle, required this.i});
  final DateTime date;
  final String title;
  final String subtitle;
  final int i;
  @override
  State<NodeUpdate> createState() => _NodeAddState();
}

class _NodeAddState extends State<NodeUpdate> {
  TextEditingController titlecontroller =TextEditingController();
  TextEditingController Discriptioncontroller =TextEditingController();
  final _mykey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    titlecontroller.text=widget.title;
    Discriptioncontroller.text=widget.subtitle;
    return Scaffold(
      backgroundColor: Color(0xffCBE4DE),
      appBar: AppBar(
        backgroundColor: Color(0xff9EC8B9),
        title: Center(
          child: Text("Edit your note",style:TextStyle(
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
                        // fillColor: Colors.white70,
                        // filled: true,
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
                    decoration: InputDecoration(
                        // fillColor: Colors.white70,
                        // filled: true,
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
              notelist.replaceRange(widget.i, widget.i+1, [notedata]);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StartScreen()));
            });
          },
          child: Icon(Icons.save,color: Colors.white,size: 40,),),
      ),
    );
  }
}
