// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    this.name,
    this.description,
    this.posterurl,
    this.title,

    // ignore: non_constant_identifier_names
  }) : super(key: key);
  final String? name, description, posterurl, title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: ModifiedText(
      //       text: name ?? 'Not Loading',
      //       size: 20,
      //       color: Colors.lightGreenAccent),
      // ),
      body: SafeArea(
        child: Container(
          child: ListView(
            // ignore: duplicate_ignore
            children: [
              Container(
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(15),
                child: Stack(
                  children: [
                    Positioned(
                        child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        posterurl!,
                        fit: BoxFit.cover,
                      ),
                    )),
                    // Positioned(
                    //     child: ModifiedText(text: 'Average Rating - $vote'))
                    Positioned(
                      left: 2,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.maybePop(context);
                              },
                              icon: const Icon(Icons.arrow_back_rounded)),
                          Container(
                            padding: const EdgeInsets.all(12),
                            child: ModifiedText(
                                text: title ?? 'Not Loading',
                                size: 24,
                                color: Colors.lightGreenAccent),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'Overview',
                  style:
                      TextStyle(fontSize: 20, color: Colors.lightGreenAccent),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: ModifiedText(
                  text: description!,
                  size: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
