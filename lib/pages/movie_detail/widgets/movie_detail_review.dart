import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_review_model.dart';

class MovieDetailReview extends StatelessWidget {
  const MovieDetailReview({super.key, required this.reviews});

  final List<MovieReview>? reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Reviews",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        reviews!.isEmpty
            ? const Text("No reviews")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text((reviews![0].content).toString()),
                  Text(
                    "- ${(reviews![0].author).toString()}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  reviews!.length == 1
                      ? SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text((reviews![1].content).toString()),
                            Text(
                              "- ${(reviews![1].author).toString()}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                ],
              ),
      ],
    );
  }
}
