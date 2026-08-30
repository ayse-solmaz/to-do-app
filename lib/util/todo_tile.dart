import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/util/app_style.dart';

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
        left: 20, right: 20, top: 10),
       child:Slidable(
        endActionPane:ActionPane(
          motion:const StretchMotion(),
          extentRatio: 0.24,
          children:[
            SlidableAction(
              onPressed: deleteTask,
              icon:Icons.delete_outline_rounded,
              backgroundColor: kNavyDark,
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(18),
              padding: EdgeInsets.zero,
            )
          ]
        ),
         child: AppCard(
          muted: taskCompleted,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
               child:Row(
          children: [
            // checkbox
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: taskCompleted, onChanged:onChanged,
                activeColor: Colors.white,
                checkColor: kNavy,
                side: BorderSide(
                  color: whiteAlpha(0.55),
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 16),
            // task name
            Expanded(
              child: Text(
                taskName,
                style:TextStyle(
                  color: taskCompleted ? whiteAlpha(0.60) : Colors.white,
                  fontSize: 15.5,
                  fontWeight: FontWeight.w500,
                  height: 1.35,
                  letterSpacing: -0.1,
                  decoration:taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  decorationColor: whiteAlpha(0.60),
                ),
              ),
            ),
          ],
               ),
             ),
       )
    );
  }
}
