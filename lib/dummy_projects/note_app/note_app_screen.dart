import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:iti_g24_1/dummy_projects/note_app/cubit/note_cubit.dart';
import 'package:iti_g24_1/dummy_projects/note_app/hive_helpers.dart';

class NoteAppScreen extends StatelessWidget {
  final _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NoteCubit>();
    print("From stateless build method");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Note App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              cubit.removeAll();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Clear All",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          _noteController.text = "";
          showAlertDialog(
            context,
            cubit: cubit,
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          print("From bloc builder");
          return ListView.builder(
              itemCount: HiveHelpers.noteList.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      _noteController.text = HiveHelpers.noteList[index];
                      showAlertDialog(
                        context,
                        index: index,
                        isEditing: true,
                        cubit: cubit,
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(12),
                            height: 100,
                            decoration: BoxDecoration(
                              color: index == 0
                                  ? Colors.blue.withOpacity(.2)
                                  : index % 2 == 0
                                      ? Colors.green.withOpacity(.2)
                                      : Colors.orange.withOpacity(.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                                child: Text(
                              HiveHelpers.noteList[index],
                              style: TextStyle(fontSize: 18),
                            ))),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: InkWell(
                            onTap: () {
                              cubit.removeNote(index);
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
        },
      ),
    );
  }

  showAlertDialog(
    BuildContext context, {
    bool? isEditing = false,
    int? index,
    required NoteCubit cubit,
  }) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        if (_noteController.text.isNotEmpty) {
          if (isEditing!) {
            cubit.updateNote(index: index!, text: _noteController.text);
          } else {
            cubit.addNote(_noteController.text);
          }

          Get.back();
        }
      },
    );
    Widget cancelButton = TextButton(
      child: Text("CANCEL"),
      onPressed: () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add your Note"),
      content: TextFormField(
        onChanged: (v) {
          cubit.textFieldChanged();
        },
        controller: _noteController,
      ),
      actions: [
        okButton,
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
