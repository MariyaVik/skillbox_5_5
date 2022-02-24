import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              color: Colors.purple,
              height: 200,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homework 5.5"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(children: [
                DrawerHeader(
                  child: CircleAvatar(
                    backgroundColor: Colors.purple,
                  ),
                ),
                ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {},
                )
              ]),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Вход"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Регистрация"),
              ),
            ])
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "1",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: "2",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo),
          label: "3",
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openBottomSheet(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
