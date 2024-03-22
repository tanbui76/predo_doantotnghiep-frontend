import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_intern/core/hepler/size-app.dart';


class CloseButtonWidget extends StatefulWidget {
  const CloseButtonWidget({
    super.key,
    required this.callBack,
    this.secondDuration,
  });
  final Function callBack;
  final int? secondDuration;

  @override
  State<CloseButtonWidget> createState() => _CloseButtonWidgetState();
}

class _CloseButtonWidgetState extends State<CloseButtonWidget> {
  ///
  /// Declare the data.
  bool _isShowButton = false;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: widget.secondDuration ?? 2), (timer) {
      _isShowButton = true;
      setState(() {});
      timer.cancel();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isShowButton) {
      return const SizedBox();
    }
    return Padding(
      padding: SizeApp.setEdgeInsetsOnly(top: SizeApp.SPACE_2X),
      // child: InkWell(
      //   onTap: () {
      //     CommonHelper.onTapHandler(callback: () {
      //       widget.callBack();
      //     });
      //   },
      //   child: Icon(
      //     Icons.close,
      //     size: SizeApp.setSize(percent: .03),
      //     color: ColorResources.WHITE.withOpacity(.3),
      //   ),
      // ),
    );
  }
}
