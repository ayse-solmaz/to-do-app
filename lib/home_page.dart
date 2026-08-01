import "package:flutter/material.dart";

class ToDoApp extends StatefulWidget{
    const ToDoApp({super.key});
    @override
    State<ToDoApp> createState() => _ToDoAppState(
    );
}

class _ToDoAppState extends State<ToDoApp>{
    List<String> tasks = ["to-do-app bitir"];
    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar:AppBar(
                title:Text("Yapılacaklar")
            ),
            body:ListView.builder(
                itemCount:tasks.length,
                itemBuilder:(context,index){
                    return ListTile(
                        title:Text(tasks[index])
                    );},
            ),
            floatingActionButton:FloatingActionButton(
                onPressed:(){
                    print("Butona basıldı");
                },
                child:Icon(Icons.add),
            )
        );
    }
}
