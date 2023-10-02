import 'dart:convert';
import 'dart:math';

import 'package:cimb_technical_test/src/domain/model.dart';
import 'package:cimb_technical_test/src/domain/post_usecase.dart';
import 'package:cimb_technical_test/src/utils/helper.dart';
import 'package:cimb_technical_test/src/utils/konstanta.dart';
import 'package:cimb_technical_test/src/utils/pallete.dart';
import 'package:cimb_technical_test/src/view/posts/post_state.dart';
import 'package:cimb_technical_test/src/view/shared_widgets/param_req.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostFormScreen extends StatefulWidget {
  const PostFormScreen({super.key, this.isEdit = false, required this.data});
  final bool isEdit;
  final Post data;

  @override
  State<PostFormScreen> createState() => _PostFormScreenState();
}

class _PostFormScreenState extends State<PostFormScreen> {
  final _titleCtrl = TextEditingController();
  final _bodyCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleCtrl.text = widget.data.title;
    _bodyCtrl.text = widget.data.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.cPurple,
        title: Text("${widget.isEdit ? "Edit" : "Create"} Post"),
        actions: [
          TextButton.icon(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final posState = context.read<PostState>();
                  if (widget.isEdit) {
                    final lastda = widget.data
                        .copyWith(title: _titleCtrl.text, body: _bodyCtrl.text);
                    print(jsonEncode(lastda.toJson()));
                    final update = await usePosts.update(lastda);
                    update.when((success) {
                      Navigator.pop(context);
                      // fetch list
                      posState.initFetch();
                      showMessenger(context, "Item Succesfully Updated",
                          bgColor: Palette.cGreen);
                    }, (error) {
                      showMessenger(context, error.toString(),
                          bgColor: Palette.cRed);
                    });
                  } else {
                    // add new item
                    final create = await usePosts.create(Post(
                        userId: Random().nextInt(10),
                        id: 0,
                        title: _titleCtrl.text,
                        body: _bodyCtrl.text));

                    create.when((success) {
                      Navigator.pop(context);
                      // fetch list
                      posState.initFetch();
                      showMessenger(context, "New Item Succesfully created",
                          bgColor: Palette.cGreen);
                    },
                        (error) => showMessenger(context, error.toString(),
                            bgColor: Palette.cRed));
                  }
                }
              },
              icon: const Text(
                "Save",
                style: TextStyle(color: Colors.black),
              ),
              label: const Icon(
                Icons.check,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ParamRequired(param: "Title"),
                TextFormField(
                  decoration: kInputDecor,
                  controller: _titleCtrl,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return "Title is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const ParamRequired(param: "Body"),
                TextFormField(
                  decoration: kInputDecor,
                  controller: _bodyCtrl,
                  minLines: 3,
                  maxLines: null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return "Description is required";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bodyCtrl.dispose();
    _titleCtrl.dispose();
    super.dispose();
  }
}
