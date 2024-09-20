import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_review_model.dart';

class MovieDetailReview extends StatelessWidget {
  const MovieDetailReview({super.key, required this.review});

  final MovieReview review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          review.content ?? "No reviews",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
