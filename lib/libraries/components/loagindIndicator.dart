import 'package:flutter/material.dart';

///***************************************************************************
/// LoadingIndicator Implementation
///***************************************************************************
class LoadingIndicator extends StatefulWidget {
  final Color? color;
  final double? sized;

  const LoadingIndicator({this.color,this.sized});

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(color: widget.color ?? Theme.of(context).secondaryHeaderColor),
        height: widget.sized?? Theme.of(context).textTheme.headline2!.fontSize,
        width: widget.sized?? Theme.of(context).textTheme.headline2!.fontSize,
      ),
    );
  }
}