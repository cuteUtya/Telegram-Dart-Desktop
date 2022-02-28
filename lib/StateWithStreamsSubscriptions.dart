import 'dart:async';
import 'package:flutter/cupertino.dart';

class StateWithStreamsSubscriptions<T extends StatefulWidget> extends State<T> {
  final List<StreamSubscription> streamSubscriptions = [];

  @override
  void dispose() {
    for(final i in streamSubscriptions){
      i.cancel()
      ;    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => throw UnimplementedError();
}