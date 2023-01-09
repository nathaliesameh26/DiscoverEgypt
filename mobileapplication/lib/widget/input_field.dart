import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const InputField({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                      readOnly: widget==null?false:true,
                  autofocus: false,
                  cursorColor: Colors.blue,
                  controller: controller,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    fillColor: Colors.white,
                  ),
                ),
                ),
                widget==null?Container():Container(child: widget)
              ],
            ),
          )
        ],
      ),
      
    );
  }
}
