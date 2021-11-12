import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/model/books.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  var items = [];
  var item;

  @override
  Widget build(BuildContext context) {
    item = ModalRoute.of(context)!.settings.arguments as Books;

    return Scaffold(
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
                    // width: 260,
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