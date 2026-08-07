import 'package:hive_flutter/hive_flutter.dart';
class ToDoDataBase{
  List toDoList = [];
  // reference our box
  final _mybox = Hive.box('mybox');

  // run
  void createInitialData (){
    toDoList = [
      ["buraya yaz",false],
      ["buraya yaz",false],

    ];}
    // load
    void loadData(){
      toDoList = _mybox.get("TODOLIST");
    }

    // update
    void updateDatabase(){
      _mybox.put("TODOLIST",toDoList);
    }
  }

