// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/description.dart';

import '../utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ModifiedText(
              text: "Trending Movies",
              color: Colors.amberAccent,
              size: 25,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 650,
              //width: double.infinity,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: trending.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: trending[index]['name'],
                                      title: trending[index]['title'],
                                      posterurl:
                                          // ignore: prefer_interpolation_to_compose_strings
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path'],
                                      description: trending[index]['overview'],
                                    )));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    height: 310,
                                    width: double.infinity,
                                    imageUrl:
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  bottom: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: ModifiedText(
                                      text: trending[index]['name'] ??
                                          trending[index]['title'],
                                      size: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
