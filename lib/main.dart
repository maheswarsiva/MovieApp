import 'package:flutter/material.dart';
import 'package:movie_app/screens/trending.dart';
import 'package:movie_app/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List trendingmovies = [];
  List topratedmovies = [];
  List searchmovies = [];
  final String apikey = '6268a8b67b61d96a3b9880d9d79367de';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MjY4YThiNjdiNjFkOTZhM2I5ODgwZDlkNzkzNjdkZSIsInN1YiI6IjYzNDUzYTcyNzFmZmRmMDA3ZmIwZWU2ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bAjbJ4qcYcy1uj-cOJwiSiWANNkOpPpN_HdMpTxzGuk';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedmoviesresult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    // ignore: avoid_print
    //print(searchmoviesresult);
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedmoviesresult['results'];
    });
    //print(searchmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const ModifiedText(
          text: 'Flutter Movie App',
          color: Colors.amberAccent,
          size: 18,
        ),
        actions: const [Icon(Icons.search_sharp)],
      ),
      body: ListView(
        children: [TrendingMovies(trending: trendingmovies)],
      ),
    );
  }
}
