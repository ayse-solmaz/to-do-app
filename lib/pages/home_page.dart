

import "package:flutter/material.dart";
import "package:to_do_app/util/dialog_box.dart";
import "package:to_do_app/util/todo_tile.dart";
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';

class ToDoApp extends StatefulWidget{
    const ToDoApp({super.key});
    @override
    State<ToDoApp> createState() => _ToDoAppState(
    );
}

class _ToDoAppState extends State<ToDoApp>{

  //refresh the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db =ToDoDataBase();
  @override
  void initState(){
    // default data
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
      db.updateDatabase();
    }
    else{
      // there already exists data
      db.loadData();
    }
    super.initState();
  }
  // text controller
  final _controller = TextEditingController();

    // checkbox was tapped
    void checkBoxChanged(bool? value, int index) {
      setState(() {
        db.toDoList[index][1] = !db.toDoList[index][1];
      });
      db.updateDatabase();
    }
    // save my task
    void saveNewTask(){
      setState(() {
        db.toDoList.add([_controller.text,false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDatabase();
    }
    //create a new task
    void createNewTask() {
      showDialog(
        context:context,
        builder:(context)
         {
          return DialogBox(
          controller:_controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
         );}
        );
    }
    // delete task
    void deleteTask(int index){
      setState(() {
        db.toDoList.removeAt(index);
      });
      db.updateDatabase();
    }

    @override
    Widget build(BuildContext context){
        return Scaffold(
            backgroundColor: Colors.blue[300],
            appBar:AppBar(
              backgroundColor:Colors.blue[800],
                title:Center(child: Text("yapılacaklar"),
                ),
                elevation:0,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: createNewTask,
              child:const Icon(Icons.add),
              backgroundColor: Colors.blue[800],
            ),
            body:ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder:(context,index) {
                return ToDoTile
                  (
                    taskName:db.toDoList[index][0],taskCompleted:db.toDoList[index][1],onChanged:(value) => checkBoxChanged(value,index),
                    deleteTask: (context) => deleteTask(index),
                  );
                  
              }
            ),
    
    
    );   
  }
}

