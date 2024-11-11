import 'package:flutter/material.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/pages/task_group_create/widgets/colors_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/task_group_provider.dart';

class TaskGroupCreatePage extends StatefulWidget {
  const TaskGroupCreatePage({super.key});

  @override
  State<TaskGroupCreatePage> createState() => _TaskGroupCreatePageState();
}

class _TaskGroupCreatePageState extends State<TaskGroupCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  Color colorSelected = Colors.blue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task Group'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Field
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Selecione um email válido';
                    }
                    return null;
                  },
                  controller: nameController,
                    decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.title),
                    border: UnderlineInputBorder(),
                    label: Text('Name'),
                    hintText: 'Informe o nome',
                  ),
                ),
                Text('Select Color',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10),
                // Color Picker
                ColorPicker(
                  selectedColor: colorSelected,
                  onColorSelected: (color) {
                    setState(() {
                      colorSelected = color;
                      print(colorSelected);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () async {
          await _submitForm();
        },
        label: const Text('Add Task Group'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final task = TaskGroup.create(
        name: nameController.text,
        color: colorSelected.value,
      );

      await context.read<TaskGroupProvider>().createTaskGroup(task);

      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }
}
