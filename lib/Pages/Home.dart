import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> scaffolaKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffolaKey,
      appBar: new AppBar(
          backgroundColor: Colors.blue,
          title: Text('Title'),
          // actions: [
          //   IconButton(
          //       onPressed: () {},
          //       icon: CircleAvatar(
          //         child: Icon(
          //           Icons.person,
          //           color: Colors.white,
          //         ),
          //       )),
          // ],
          leading: IconButton(
              onPressed: () {
                scaffolaKey.currentState!.openDrawer();
              },
              icon: Icon(Icons.menu))),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.redAccent),
                accountName: Text('Subha'),
                accountEmail: Text('subha@gmail.com')),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(
                  Icons.home,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Edit'),
                leading: Icon(
                  Icons.edit,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Logs'),
                leading: Icon(
                  Icons.history,
                  color: Colors.redAccent,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(
                  Icons.logout,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
