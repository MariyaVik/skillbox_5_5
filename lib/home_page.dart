import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<TabItem> tabBar = [
    TabItem(title: "Home", icon: Icon(Icons.home)),
    TabItem(title: "Chat", icon: Icon(Icons.chat)),
    TabItem(title: "Photo", icon: Icon(Icons.photo)),
  ];

  int _selectedIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabBar.length);
    _tabController.addListener(() {
      _selectedIndex = _tabController.index;
      setState(() {});
    });
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => _myBottomSheet());
  }

  void _onItemTapped(int index) {
    _tabController.index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homework 5.5"),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          })
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
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                  ),
                ),
                ListTile(
                  title: Text("Profile"),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Images"),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Files"),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {},
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Выход"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Регистрация"),
                    ),
                  ]),
            )
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.blue,
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            for (var item in tabBar)
              BottomNavigationBarItem(
                icon: item.icon,
                label: item.title,
              )
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openBottomSheet(context),
        child: Icon(Icons.add),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://picsum.photos/200'),
              ),
              Text('My name is...'),
            ],
          ),
        ),
      ),
    );
  }
}

class _myBottomSheet extends StatelessWidget {
  const _myBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 200,
      child: Column(children: [
        Row(
          children: [
            Icon(Icons.payment),
            SizedBox(width: 10),
            Expanded(child: Text("Сумма")),
            Text("200 руб."),
          ],
        ),
        ElevatedButton(
          child: Text("Оплатить"),
          onPressed: () {},
        )
      ]),
    );
  }
}

class TabItem {
  String title;
  Icon icon;
  TabItem({required this.title, required this.icon});
}
