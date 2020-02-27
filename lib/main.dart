import 'package:flutter/material.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tab Bar App",
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  int _count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tab Bar App"),
        bottom: new TabBar(
          controller: _tabController,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.home),
            ),
            
            new Tab(
              icon: new Icon(Icons.favorite),
            ),
            
            new Tab(
              icon: new Icon(Icons.music_video),
            ),
            
          ],
        ),
      ),

      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new NewPage("Page One"),
          new NewPage("Page Two"),
          new NewPage("Page Three"),
        ],
      ),

      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: (){
          _count++;
          print(_count);
          },
      ),
    );
  }
}

class NewPage extends StatelessWidget {

  final String title;
  NewPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Text(title),
      )
    );
  }
}
