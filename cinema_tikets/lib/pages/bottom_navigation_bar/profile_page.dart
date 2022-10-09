import 'package:cinema_tikets/api/movie_api.dart';
import 'package:cinema_tikets/models/movie_model.dart';
import 'package:cinema_tikets/notifiers/movie_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    MovieNotifier movieNotifier =
        Provider.of<MovieNotifier>(context, listen: false);
    getMovie(movieNotifier);
    // TODO: implement initStateO 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MovieNotifier movieNotifier = Provider.of<MovieNotifier>(context);
    return Container(
        child: Center(
            child: Container(
                width: 500,
                height: 700,
                child: ListView.builder(
                  itemCount: movieNotifier.movieList.length,
                  itemBuilder: (_, index) {
                  return Container(
                    child:Column(
                      children: [
                        Text("${movieNotifier.movieList[index].name}"),
                        Text("${movieNotifier.movieList[index].description}"),
                        Image.network(movieNotifier.movieList[index].image)
                      ],
                    )
                  );
                }))));
  }
}
