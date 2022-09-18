import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PostScreen extends StatelessWidget {
  const PostScreen(
      {Key? key,
      required this.id,
      required this.imgUrl,
      required this.title,
      required this.body})
      : super(key: key);

  final int id;
  final String imgUrl;
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Aster',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imgUrl,
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 30),
              child: Text(
                'Post id: $id',
                style: GoogleFonts.nunito(
                    fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: const Color.fromARGB(255, 1, 67, 96),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Text(
                body,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 1, 67, 96),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: TextButton.icon(
                onPressed: () => {debugPrint("Thumbsup clicked!!")},
                style: TextButton.styleFrom(
                    fixedSize:
                        Size.fromWidth(MediaQuery.of(context).size.width),
                    backgroundColor: const Color.fromARGB(255, 208, 235, 255),
                    primary: const Color.fromARGB(255, 1, 67, 96),
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                icon: const Icon(
                  Icons.thumb_up_alt_outlined,
                  color: Color.fromARGB(255, 1, 67, 96),
                ),
                label: Text(
                  'Give a thumbs up!',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
