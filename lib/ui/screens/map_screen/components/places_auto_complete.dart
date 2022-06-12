import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:millionaire_app/constants.dart';
import 'package:easy_localization/easy_localization.dart';

class PlacesAutoComplete extends StatefulWidget {
  final TextEditingController? controller;

  const PlacesAutoComplete({Key? key, this.controller}) : super(key: key);
  @override
  _PlacesAutoCompleteState createState() => _PlacesAutoCompleteState();
}

class _PlacesAutoCompleteState extends State<PlacesAutoComplete> {
  bool editableMode = true;
  late Timer _timer;
  bool canSearch = true;
  int waitDuration = 2000;
  TextEditingController? _controller;

  @override
  void initState() {
    _timer = _resetTimer();
    _controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(10.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsetsDirectional.only(
              start: 14.0, bottom: 8.0, top: 8.0),
          filled: true,
          fillColor: Colors.white,
          hintText: "Search".tr(),
          prefixIcon: Icon(
            Icons.search,
            color: editableMode ? Colors.black : subtitleColor,
          ),
          suffixIcon: editableMode
              ? GestureDetector(
                  onTap: () {
                    _controller!.clear();
                    setState(() {
                      editableMode = false;
                    });
                  },
                  child: const Icon(
                    Icons.clear,
                    size: 16,
                  ),
                )
              : null,
          hintStyle: const TextStyle(color: subtitleColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onChanged: (query) {
          setState(() {
            editableMode = query.isNotEmpty;
          });
        },
      ),
    );
  }

  _resetTimer() {
    return new Timer.periodic(Duration(milliseconds: waitDuration), (timer) {
      canSearch = true;
    });
  }
}
