import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'note_add.dart';
import 'note_update.dart';


List<Color> backgroundcolors = [
 Color(0xffB3C8CF),
 Color(0xffBED7DC),
 Color(0xffF1EEDC),
 Color(0xffE5DDC5),
];
List<Map<String, dynamic>> notelist = [];



class StartScreen extends StatefulWidget {
  const StartScreen({super.key,});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  getRandomColors() {
    Random random = Random();
    return backgroundcolors[random.nextInt(backgroundcolors.length)];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff9EC8B9),
          title: Row(
            children: [
              Flexible(
                child: Text(
                  "Notes",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.sort,
                    size: 30,
                  )),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            children: [
              Searchbar(),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: notelist.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>NodeUpdate(
                                date: notelist[index]['date'],
                                title:notelist[index]['title'] ,
                                subtitle: notelist[index]['discription'],
                                i: index,)));
                        },
                        child: Card(
                            color: getRandomColors(),
                            elevation: 5,
                            child: ListTile(
                              contentPadding: EdgeInsets.all(20),
                              title: RichText(
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    text: "${notelist[index]['title']} \n",
                                    style:
                                    TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: "${notelist[index]['discription']}",
                                        style: TextStyle( fontSize: 20, height: 1.5,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  )
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Text(
                                    " ${DateFormat.jm().format(notelist[index]['date'])}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text("${DateFormat.yMMMMEEEEd().format(notelist[index]['date'])}",style: TextStyle(
                                      color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),),
                                ],
                              ),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: (){
                                        },
                                        icon: Icon(Icons.favorite_border_outlined,
                                            color:Colors.white)),
                                    IconButton(
                                      onPressed: (){
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context, builder:(BuildContext context){
                                          return AlertDialog(
                                            backgroundColor: Colors.grey.shade900,
                                            icon: Icon(Icons.info,color: Colors.grey,),
                                            title: Text("Are you sure you want to delet?",
                                              style: TextStyle(color: Colors.white),
                                              maxLines: 1,),
                                            content: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: (){
                                                      setState(() {
                                                        notelist.removeAt(index);
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.green
                                                    ),
                                                    child: Text("Yes",style: TextStyle(
                                                        color: Colors.white
                                                    ),)),
                                                ElevatedButton(
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: Colors.red,
                                                    ),
                                                    child: Text("No",style: TextStyle(
                                                      color:Colors.white,
                                                    ),)),
                                              ],
                                            ),
                                          );

                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        );


                    }
                ),
              )
            ]
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          backgroundColor: Color(0xff9EC8B9),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NodeAdd()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}


class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          fillColor: Colors.grey,
          filled: true,
          hintText: "Search Note...",
          hintStyle: TextStyle(fontSize: 18, color: Colors.white),
          contentPadding: EdgeInsets.all( 15),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}


