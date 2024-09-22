import 'package:flutter/material.dart';
import 'package:movie_app/models/series_model.dart';
import 'package:movie_app/pages/series/widgets/series_widget.dart';
import 'package:movie_app/services/api_services.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({super.key});

  @override
  State<SeriesPage> createState() => _ActorsPageState();
}

class _ActorsPageState extends State<SeriesPage> {
  ApiServices apiServices = ApiServices();
  late Future<SeriesModel> actorsFuture;

  @override
  void initState() {
    actorsFuture = apiServices.getPopularSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Series'),
      ),
      body: FutureBuilder(
          future: actorsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            if (snapshot.hasData) {
              final series = snapshot.data?.results;
              return ListView.builder(
                itemCount: series!.length,
                itemBuilder: (context, index) {
                  return SeriesWidget(
                    series: series[index],
                  );
                },
              );
            }

            return const Center(
              child: Text('No data found'),
            );
          }),
    );
  }
}
