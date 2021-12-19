import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_trailer/models/detail_argrument.dart';
import 'package:movie_trailer/providers/movie_provider.dart';
import 'package:movie_trailer/screens/detail_screen/detail_screen.dart';
import 'package:tlrt_lib/text_contrast/text_contrast.dart';
import 'package:provider/provider.dart';

class MovieCard extends StatefulWidget {
  final String? movieTitle;
  final int movieId;
  const MovieCard({
    Key? key,
    required this.movieTitle,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool _isLoaded = false;
  String imagePosterPath = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => getImage(widget.movieId));
  }

  getImage(int movieId) {
    Provider.of<MovieProvider>(context, listen: false)
        .fetchPathImage(widget.movieId)
        .then((response) {
      if (response.isNotEmpty) {
        setState(() {
          imagePosterPath = response;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(DetailScreen.routeName,
          arguments: DetailArgrument(
              imagePath: imagePosterPath, tag: widget.movieTitle!)),
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            if (imagePosterPath.isNotEmpty)
              Center(
                child: Hero(
                  tag: widget.movieTitle!,
                  child: Image.network(
                    imagePosterPath,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black54,
                child: TextContrast(
                  data: widget.movieTitle!,
                  backgroundColor: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
