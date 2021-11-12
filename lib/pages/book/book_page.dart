import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/model/books.dart';

class BookPage extends StatefulWidget {
  static const routeName = '/detail';

  const BookPage({Key? key}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  Icon customIcon = const Icon(Icons.favorite_border_outlined);
  var _subPageIndex = 0;
  dynamic item;

  @override
  Widget build(BuildContext context) {
    item = ModalRoute.of(context)!.settings.arguments as Books;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          item.name,
          style: GoogleFonts.fredokaOne(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Image.asset('assets/images/${item.image}'),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: customIcon,
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () {
                        setState(() {
                          if (customIcon.icon == Icons.favorite_border_outlined) {
                            customIcon = const Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                            );
                          } else {
                            customIcon = const Icon(Icons.favorite_border_outlined);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 15,
              thickness: 5,
              indent: 30,
              endIndent: 30,
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: _subPageIndex == 0 ? Colors.white : Colors.black,
                    side: const BorderSide(color: Colors.white, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => _showSubPage(0),
                  child: Text(
                    'ตอนที่',
                    style: GoogleFonts.fredokaOne(
                        fontSize: 12,
                        color:
                            _subPageIndex == 0 ? Colors.black : Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: _subPageIndex == 1 ? Colors.white : Colors.black,
                    side: const BorderSide(color: Colors.white, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => _showSubPage(1),
                  child: Text(
                    'ข้อมูล',
                    style: GoogleFonts.fredokaOne(
                        fontSize: 12,
                        color:
                            _subPageIndex == 1 ? Colors.black : Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: _subPageIndex == 2 ? Colors.white : Colors.black,
                    side: const BorderSide(color: Colors.white, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => _showSubPage(2),
                  child: Text(
                    'ความคิดเห็น',
                    style: GoogleFonts.fredokaOne(
                        fontSize: 12,
                        color:
                            _subPageIndex == 2 ? Colors.black : Colors.white),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 5,
              indent: 30,
              endIndent: 30,
              color: Colors.white,
            ),
            _buildSubPage(),
            const Divider(
              height: 15,
              thickness: 5,
              indent: 30,
              endIndent: 30,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0:
        return _buildChapter();
      case 1:
        return _buildInformation();
      case 2:
        return _buildComment();
      default:
        return const SizedBox.shrink();
    }
  }

  Column _buildChapter() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Coming soon!!',
            style: GoogleFonts.mali(fontSize: 13.0, color: Colors.grey),
          ),
        )
      ],
    );
  }

  Column _buildInformation() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.redAccent),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          item.status,
                          style: GoogleFonts.mali(
                              fontSize: 11.0, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          item.update,
                          style: GoogleFonts.mali(
                              fontSize: 11.0, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'เรื่อง : ${item.author}',
                  style: GoogleFonts.mali(fontSize: 13.0, color: Colors.white),
                ),
                Text(
                  'ภาพ : ${item.artist}',
                  style: GoogleFonts.mali(fontSize: 13.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column _buildComment() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'ยังไม่มีความคิดเห็น',
            style: GoogleFonts.mali(fontSize: 13.0, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
