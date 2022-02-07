import 'package:flutter/material.dart';
import 'package:peli_app/models/models.dart';
import 'package:peli_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(
          movie,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAndTitle(movie: movie),
            _OverView(
              movieOverview: movie.overview,
            ),
            CastingCards(movie.id)
          ]),
        )
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar(this.movie);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.green,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Text(
            movie.title,
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackDropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: size.width - 200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: textTheme.headline5),
                Text(movie.originalTitle,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.subtitle1),
                Row(
                  children: [
                    Text(
                      movie.voteAverage.toString(),
                      style: textTheme.caption,
                    ),
                    SizedBox(width: 5),
                    const Icon(Icons.star_border),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  final movieOverview;

  const _OverView({Key? key, required this.movieOverview}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        movieOverview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
