import 'dart:convert';

import 'package:aster/model/postmodel.dart';
import 'package:aster/postpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Postmodel> postLists = <Postmodel>[];
  Future<List<Postmodel>> getPosts() async {
    const postUrl = "https://jsonplaceholder.typicode.com/posts";

    final response = await get(Uri.parse(postUrl));
    postLists = [];
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      for (var post in jsonResponse) {
        var p = Postmodel.fromMap(post);
        postLists.add(p);
      }
      return postLists;
    } else {
      throw Exception("Couldn't load Posts");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "Today's Post",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 220, 240, 255),
                  filled: true,
                  prefix: const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search_rounded),
                    color: const Color.fromARGB(255, 1, 67, 96),
                    onPressed: () {
                      /* Clear the search field */
                    },
                  ),
                  hintText: 'Search',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 1, 67, 96),
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: getPosts(),
                builder: (context, AsyncSnapshot<List<Postmodel>> snapshot) {
                  List<Postmodel>? data = snapshot.data;
                  if (snapshot.hasData) {
                    debugPrint("LENGTH: ${snapshot.data!.length}");
                    return ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, i) {
                          return postCard(
                              id: data![i].id,
                              imgUrl:
                                  'https://source.unsplash.com/random?sig=${i}',
                              title: data[i].title,
                              body: data[i].body);
                        }));
                  } else if (snapshot.hasError) {
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'Something went wrong 😣',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      'Loading... Amaizing posts..',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  Widget postCard(
      {required int id,
      required String imgUrl,
      required String title,
      required String body}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: const Color.fromARGB(97, 217, 221, 225),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            imgUrl,
            height: 150,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color.fromARGB(255, 1, 67, 96),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        onTap: ()=>{
          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostScreen(id: id, imgUrl: imgUrl, title: title, body: body)),
                  )
        },
      ),
    );
  }
}
