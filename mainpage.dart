import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'task.dart';

class Main_Page extends StatefulWidget {
  const Main_Page({super.key});

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  TextEditingController _text = TextEditingController();
  TextEditingController _date = TextEditingController();
  String newtaskname = "";
  String newdate = "";


  void initState() {
    super.initState();
    _text = TextEditingController();
  }

  List<Task> _tasks = <Task>[];

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("New Task", textAlign: TextAlign.center),
          content: SingleChildScrollView(
              child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  newtaskname = value;
                },
                decoration: const InputDecoration(
                  hintText: "Enter your Task",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
               TextField(
                onChanged: (date) {
                  newdate = date;
                },
                decoration: const InputDecoration(
                  hintText: "Select Date",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ],
          )),
          actions: [
            CupertinoDialogAction(
              onPressed: addToList,
              child:
                  const Text("Save", style: TextStyle(color: Colors.blueGrey)),
            ),
            CupertinoDialogAction(
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.blueGrey),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  //add tsk to list
  void addToList() {
    setState(() {
      _tasks.add(Task(
        title: newtaskname,
        date: newdate,
      ));
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xFFEEEFF5),
            appBar: AppBar(title: Text("Tasks")),
            
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 290, top: 8),
                  child: const Text(
                    "Tasks",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 400,
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 255, 255, 255),
                          blurRadius: 2.0,
                          spreadRadius: 2.0,
                          offset: Offset(5.0, 5.0),
                        ),
                      ], borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ListView.builder(
                        itemCount: _tasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(_tasks[index].title),
                              subtitle: Text(_tasks[index].date),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        backgroundColor: Colors.blueGrey,
                        onPressed: createNewTask,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      
    );
  }
}
