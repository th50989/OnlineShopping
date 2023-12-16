import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/pages/crud/values.dart';
import 'package:flutter_application_1/pages/foodPage.dart';
import 'package:flutter_application_1/pages/mobilePage.dart';
import 'package:flutter_application_1/pages/tiviPage.dart';
import '././pages/homePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    TabBarView(
      children: [MyHomePage(), MyMobilePage(), MyTiViPage(), MyFoodPage()],
    ),
    MyCart()
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_rounded),
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Orders',
                )
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
            appBar: AppBar(
              backgroundColor: Colors.amber[800],
              title: Center(child: Text("Ứng dụng bán hàng online")),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.phone_android_sharp)),
                  Tab(icon: Icon(Icons.tv)),
                  Tab(icon: Icon(Icons.food_bank_outlined)),
                ],
              ),
            ),
            body: _widgetOptions.elementAt(_selectedIndex),
            //const TabBarView(
            //   children: [
            //     MyHomePage(),
            //     MyMobilePage(),
            //     MyTiViPage(),
            //     MyFoodPage()
            //   ],
            // ),
          )),
    );
  }
}

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đơn hàng đã đặt'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Orders').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          // Access the documents in the collection
          var documents = snapshot.data?.docs;

          return ListView.builder(
            itemCount: documents?.length,
            itemBuilder: (context, index) {
              var data = documents?[index].data();
              return ListTile(
                leading: Container(
                  height: 200,
                  width: 100,
                  child: Image.network(fit: BoxFit.fill, '${data?['URL']}'),
                ),
                title: Text(data?['Ten']),
                subtitle: Text(data!['Gia'].toString()),
                trailing: Text('Đã order'),
              );
            },
          );
        },
      ),
    );
  }
}
