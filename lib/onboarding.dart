import 'package:aster/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                height: 50,
              ),
            ),
            Center(
              child: Text(
                'Aster',
                style: GoogleFonts.poppins(
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SvgPicture.asset('assets/images/bg.svg'),
            Text(
              'Get latest News and posts',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: TextButton.icon(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  )
                },
                style: TextButton.styleFrom(
                    fixedSize:
                        Size.fromWidth(MediaQuery.of(context).size.width),
                    backgroundColor: const Color.fromARGB(255, 208, 235, 255),
                    primary: const Color.fromARGB(255, 1, 67, 96),
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                icon: const Icon(
                  Icons.celebration_outlined,
                  color: Color.fromARGB(255, 1, 67, 96),
                ),
                label: Text(
                  'Get started',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            
          ],
        ),
      )),
    );
  }
}
