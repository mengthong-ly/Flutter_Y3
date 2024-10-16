import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/W6/Ex2/data/profile_data.dart';
import 'package:money_app/W6/Ex2/model/profile_tile_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileApp(
        data: ronanProfile,
        // data: ProfileData(
        //   avatarUrl: 'assets/vichet.jpg',
        //   name: "Mengthong",
        //   position: 'Flutter Dev',
        //   tiles: [
        //     TileData(
        //       icon: Icons.call,
        //       title: "Mengthong",
        //       value: "+855 78785339",
        //     ),
        //     TileData(
        //       icon: Icons.location_on_outlined,
        //       title: "CADT",
        //       value: "+855 12959166",
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({
    super.key,
    required this.data,
  });
  final ProfileData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff12284c),
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(data.avatarUrl),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data.name,
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Text(
                data.position,
                style: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
              ...data.tiles.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(
                    top: 13,
                  ),
                  child: ProfileTitle(data: e),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTitle extends StatelessWidget {
  final TileData data;
  const ProfileTitle({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(9, 0, 0, 0),
              spreadRadius: 5,
              blurRadius: 10,
            )
          ]),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Icon(data.icon),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                data.value,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
