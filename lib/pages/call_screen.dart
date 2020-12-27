import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0,0.0,40.0,0.0),
      child: Center(
        child: Container(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text:
                  "Your call history will show here but it seems you haven't called yet. Tap ",
                  style: TextStyle(color: Colors.grey[400],fontSize: 16.0,fontWeight: FontWeight.w400)
                ),
                WidgetSpan(
                  child: Icon(Icons.add_ic_call,color: Colors.grey[400])
                ),
                TextSpan(
                  text:
                  "  to call your frnds.",
                  style: TextStyle(color: Colors.grey[400],fontSize: 16.0,fontWeight: FontWeight.w400)
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
