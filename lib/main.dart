import 'package:chapterapp/reader_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Chapter Reader App',
    home: HomePage(),
  ));
}

var chapterLists = [
  'Chapter 1',
  'Chapter 2',
  'Chapter 3',
  'Chapter 4',
  'Chapter 5',
  'Chapter 6',
  'Chapter 7',
  'Chapter 8',
  'Chapter 9',
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chapter Reader App'),
          centerTitle: true,
          backgroundColor: Colors.indigo[700],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: GridView.builder(
              itemCount: chapterLists.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (chapterLists[index] == "Chapter 1") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReaderScreen(1)));
                    } else if (chapterLists[index] == "Chapter 2") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReaderScreen(2)));
                    }
                  },
                  child: Card(
                    elevation: 2.0,
                    color: Colors.blue[500],
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Icon(
                          Icons.book,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text(
                          chapterLists[index],
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
