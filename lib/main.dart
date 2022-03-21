import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "TODO APP",
      home: TODOAPP(),
    ));

class TODOAPP extends StatefulWidget {
  const TODOAPP({Key? key}) : super(key: key);

  @override
  State<TODOAPP> createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  late String value;
  var listTODO = [''];
  addToDo(String item) {
    setState(() {
      listTODO.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO APP"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            addToDo(value);
          }),
      body: ListView.builder(
          itemCount: listTODO.length,
          itemBuilder: (context, index) {
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "Add Item"),
                      onChanged: (val) {
                        value = val;
                      },
                    ),
                  )
                : ListTile(
                    leading: Icon(Icons.work),
                    title: Text(
                      '${listTODO[index]}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
          }),
    );
  }
}
