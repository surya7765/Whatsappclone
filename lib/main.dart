import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/pages/call_screen.dart';
import 'package:whatsapp/pages/camera_screen.dart';
import 'package:whatsapp/pages/chat_screen.dart';
import 'package:whatsapp/pages/status_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff25D366),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WhatsApp",
          style: TextStyle(color: Colors.grey.shade300),
        ),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.green,
          indicatorWeight: 3.0,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.camera_alt_rounded),
            ),
            Tab(
              child: Text(
                "CHATS",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15.0,
                ),
              ),
            ),
            Tab(
              child: Text(
                "STATUS",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15.0,
                ),
              ),
            ),
            Tab(
              child: Text(
                "CALLS",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Icon(
            Icons.search_rounded,
            color: Colors.grey.shade300,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Icon(Icons.more_vert_rounded, color: Colors.grey.shade300),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CameraScreen(),
          ChatScreen(),
          StatusScreen(),
          CallScreen(),
        ],
      ),
      floatingActionButton: _bottomButtons(),
    );
  }

  Widget _bottomButtons() {
    var _widgets;

    _callMe(url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
      }
    }

    if (_tabController.index == 0) {
      _widgets = FloatingActionButton(
        shape: StadiumBorder(),
        // ignore: deprecated_member_use
        onPressed: () => ImagePicker.pickImage(source: ImageSource.gallery),
        child: Icon(
          Icons.wallpaper,
          color: Colors.white,
        ),
      );
    } else if (_tabController.index == 1) {
      _widgets = FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: () => print("Chats"),
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.message_rounded,
          color: Colors.white,
        ),
      );
    } else if (_tabController.index == 2) {
      _widgets = FloatingActionButton(
        shape: StadiumBorder(),
        // ignore: deprecated_member_use
        onPressed: () => ImagePicker.pickImage(source: ImageSource.gallery),
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
        ),
      );
    } else if (_tabController.index == 3) {
      _widgets = FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: () {
          _callMe('tel:7667941731');
        },
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.add_call,
          color: Colors.white,
        ),
      );
    }
    return _widgets;
  }
}
