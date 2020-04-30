import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController pcontroller;
  final String plabel;
  final String phint;
  final IconData picon;
  final TextInputType ptype;

  const InputField(
      {this.pcontroller, this.plabel, this.phint, this.picon, this.ptype});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: ptype,
        controller: pcontroller,
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          icon: Icon(picon),
          hintText: phint,
          labelText: plabel,
        ),
      ),
    );
  }
}
