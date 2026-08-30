
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:to_do_app/util/dialog_box.dart";
import "package:to_do_app/util/todo_tile.dart";
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/app_style.dart';


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
        barrierColor: navyAlpha(0.30),
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
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 0,
              scrolledUnderElevation: 0,
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              title: const Text(
                "yapılacaklar",
                style: TextStyle(
                  color: kNavy,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(height: 1, color: navyAlpha(0.08)),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: createNewTask,
              backgroundColor: kNavy,
              foregroundColor: Colors.white,
              elevation: 0,
              focusElevation: 0,
              hoverElevation: 0,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child:const Icon(Icons.add, size: 28),
            ),
            body:ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 120),
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
