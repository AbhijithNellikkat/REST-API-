import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_api_app/services/remote_services.dart';

import '../models/post.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Photos>? photos;

  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    // Fetch the data form API
    getData();
  }

  getData() async {
    photos = await RemoteServices().getPhotos();
    if (photos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'REST API',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.transparent),
            itemCount: photos!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    maxRadius: 25,
                    child: Image.network(
                      '${photos?[index].thumbnailUrl}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    '${photos?[index].title}',
                    style: GoogleFonts.poppins(
                        fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Id :  ${photos?[index].id}',
                    style: GoogleFonts.poppins(fontSize: 10),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
