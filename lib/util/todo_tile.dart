import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  const ToDoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTask,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(
        left: 24, right: 24, top: 8),
       child:Slidable(
        endActionPane:ActionPane(
          motion:StretchMotion(),
          children:[
            SlidableAction(
              onPressed: deleteTask,
              icon:Icons.delete,
              backgroundColor:Colors.red.shade300,
            )
          ]
        ),
         child: Container(
          decoration:BoxDecoration(
          color:Colors.blue[200],
          borderRadius:BorderRadius.circular(12),
          ),
               child:Row(
          children: [
            // checkbox
            Checkbox(
              value: taskCompleted, onChanged:onChanged,
              activeColor: Colors.black),
            // task name
            Text(
              taskName,
              style:TextStyle(decoration:taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),),
          ],
               ),
             ),
       )
    );
  }
}