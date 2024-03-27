import 'package:flutter/material.dart';

import 'package:todo_api/Screeens/widgets/form_widget.dart';
import 'package:todo_api/Services/service.dart';

class AddTodo_Page extends StatefulWidget {
  final Map? todo;

  const AddTodo_Page({super.key, this.todo});
  @override
  State<AddTodo_Page> createState() => _AddTodo_PageState();
}

class _AddTodo_PageState extends State<AddTodo_Page> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();

    final todo = widget.todo;
    if (widget.todo != null) {
      isEdit = true;
      final title = todo!['title'];
      final description = todo['description'];
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          isEdit ? "Edit ToDo List" : "Add ToDo List",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Form_Widget(
                titleController: titleController,
                descriptionController: descriptionController,
                isEdit: isEdit,
                submitData: submitData,
                updateData: updateData,
              ),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/images/4702ed7b709edf02a58b87257b2e95f4.png'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateData() async {
    final todo = widget.todo;
    if (todo == null) {
      print("You can not updated without todo data");
      return;
    }
    final id = todo['_id'];

    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };

    final isSuccess = await TodoService.updateData(id, body);

    if (isSuccess) {
      titleController.text = '';
      descriptionController.text = '';
      showSuccessMessage("Updated Successfully !");
    } else {
      showErrorMessage("Updation Failed !");
    }
  }

  Future<void> submitData() async {
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };

    final isSuccess = await TodoService.submitData(body);
    if (isSuccess) {
      titleController.text = '';
      descriptionController.text = '';
      showSuccessMessage("Created Successfully !");
    } else {
      showErrorMessage("creation Failed !");
    }
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.blue,
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
