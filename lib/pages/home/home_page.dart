import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/model/books.dart';
import '../search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var items = [
    Books('Solo Leveling', 'book1.jpg', 'ยังไม่จบ', 'Wed', 'Chu-Gong', 'Jang Sung-rak'),
    Books('Death Is The Only Ending For The Villainess', 'book2.jpg', 'ยังไม่จบ', 'Fri', 'Gwon Gyeoeul', 'SUOL'),
    Books("Trash Of The Count's Family", 'book3.jpg', 'ยังไม่จบ', 'Mon', 'PING', 'PAN4'),
    Books('Beware Of The Villainess', 'book4.jpeg', 'ยังไม่จบ', 'Sun', 'Berry, Soda Ice', 'Blue Canna'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('YUUBEE', style: GoogleFonts.fredokaOne(color: Colors.indigo)),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SearchPage())),
            icon: const Icon(Icons.search),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                goDetail(items[index]);
              },
              splashColor: Colors.blueGrey.withOpacity(0.2),
              child: Stack(
                children: [
                  Ink(
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: FractionalOffset.topCenter,
                        image:
                            AssetImage('assets/images/${items[index].image}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 20,
                    child: Container(
                      color: Colors.black.withOpacity(0.7),
                      height: 50,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            items[index].name,
                            style: GoogleFonts.righteous(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  void goDetail(Books item) {
    Navigator.pushNamed(
      context,
      "/detail",
      arguments: item,
    );
  }
}
