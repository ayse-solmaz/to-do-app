import 'package:flutter/material.dart';
import 'package:to_do_app/util/app_style.dart';
import 'package:to_do_app/util/my_button.dart';

class DialogBox extends StatelessWidget{
final TextEditingController controller;
final VoidCallback onSave;
final VoidCallback onCancel;


  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,required this.onCancel
    });

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: kNavy,
      surfaceTintColor: kNavy,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      contentPadding: const EdgeInsets.fromLTRB(22, 24, 22, 18),
      content:Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
          // get user input
          TextField(
            controller:controller,
            autofocus: true,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.5,
              fontWeight: FontWeight.w500,
            ),
            cursorColor: Colors.white,
            decoration:InputDecoration(
              filled: true,
              fillColor: whiteAlpha(0.08),
              hintText:"yapılacaklarını gir",
              hintStyle: TextStyle(
                color: whiteAlpha(0.50),
                fontWeight: FontWeight.w400,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: whiteAlpha(0.22)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: whiteAlpha(0.22)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.white, width: 1.5),
              ),
          ),),
          const SizedBox(height: 20),
          // buttons -> save and cancel
          Row(
            mainAxisAlignment:MainAxisAlignment.end,
             children:[
              // cancel button
              MyButton(text:"iptal",onPressed:onCancel,filled: false),
              const SizedBox(width:10),
              // save button
              MyButton(text:"kaydet",onPressed:onSave),
            ]
          )
         ]
         )
    );

  }
}
