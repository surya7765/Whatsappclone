import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://miro.medium.com/max/750/1*l-Hx4YcRg9e9dy7ITBrCEA.jpeg'),
                backgroundColor: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 8.0, 0.0, 8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "My Status",
                      style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          letterSpacing: 1.0,
                          wordSpacing: 2.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(
                          "2 minutes ago",
                          style: TextStyle(color: Colors.grey[350]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130.0),
                child: Container(
                  child: Icon(Icons.more_vert),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
