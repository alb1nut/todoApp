import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ToDoView extends StatelessWidget {
  ToDoView({
    Key? key,
  }) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  GlobalKey<FormState> formKey =
      GlobalKey(); //for checking the state of all the fields to confirm if field in forms has been field
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF20306C),
      appBar: AppBar(
        backgroundColor: Color(0xFF20306C),
        title: Text("Create Todo "),
      ),
      body: Container(
        padding: EdgeInsets.all(14),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xfff0f4ff),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: titleController,
                // maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "Please enter Title",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Color(0xff20306c),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title field is required";
                  }
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: descriptionController,
                // maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "Please enter Description",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Color(0xff20306c),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Description field is required";
                  }
                },
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: dateController,
                      // maxLines: 4,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                        ).then((selectedDate) {
                          final DateFormat dateFormat =
                              DateFormat("dd/MM/yyyy");
                          dateController.text =
                              dateFormat.format(selectedDate!);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Date",
                        hintText: "Please enter Date",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xff20306c),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Date field is required";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: timeController,
                      maxLines: 1,
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then(
                          (selectedTime) {
                            timeController.text = selectedTime!.format(context);
                          },
                        );
                      },
                      decoration: InputDecoration(
                        labelText: "TIme",
                        hintText: "Please enter Time",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xff20306c),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Title field is required";
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print(titleController.text);
                    print(descriptionController.text);
                    print(dateController.text);
                    print(timeController.text);
                  } else {
                    print("failed");
                  }
                },
                child: Text(
                  "Create",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff20306c),
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

