import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediSage"),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Container(child: Image.asset("assets/images/banner.jpg")),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 4, 62, 110),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text("Upcoming",
                              style: TextStyle(color: Colors.white))),
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 4, 62, 110)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Past")),
                    )
                  ]),
            ),
            Container(
              height: 500,
              child: Center(
                  child: FutureBuilder(
                      future: DefaultAssetBundle.of(context)
                          .loadString('assets/Json/detail.json'),
                      builder: (context, snapshot) {
                        // Decode the JSON
                        var newData = json.decode(snapshot.data.toString());
                        return ListView.builder(
                          itemBuilder: (BuildContext contex, int index) {
                            return Card(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 16, right: 16),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Text(
                                                  newData[index]['title'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 50),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  newData[index]['sub_title'],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 200,
                                          width: 200,
                                          child: Image.asset(
                                              newData[index]['img']),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Text(newData[index]['detail']),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        child: Text(newData[index]['text']),
                                      ),
                                      Container(
                                        child: Text(newData[index]['time']),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                              child: Text("Register Now",
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                              child: Text("Details",
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        )
                                      ]),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 320,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 4, 62, 110)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text("Invite",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 4, 62, 110))),
                                    ),
                                  )
                                ],
                              ),
                            ));
                          },
                          itemCount: newData == null ? 0 : newData.length,
                        );
                      })),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
