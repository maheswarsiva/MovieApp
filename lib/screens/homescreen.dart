import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/utils/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required List<List> trending,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List trending = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: "Trending Movies",
            color: Colors.amberAccent,
            size: 18,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: trending.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            height: 200,
                            imageUrl:
                                // ignore: prefer_interpolation_to_compose_strings
                                'https://image.tmdb.org/t/p/original' +
                                    trending[index]['poster_path'],
                            fit: BoxFit.fill,
                          ),
                          // Container(
                          //   height: 200,
                          //   decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //           image: NetworkImage(
                          //               // ignore: prefer_interpolation_to_compose_strings
                          //               'https://image.tmdb.org/t/p/original/w500' +
                          //                   trending![index][0]
                          //                       ['poster_path']))),
                          // ),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: ModifiedText(
                              text: trending[index]['title'] ?? 'Loading',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
