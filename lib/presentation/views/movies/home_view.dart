import 'package:cinecito/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView();

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    if (nowPlayingMovies.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(title: Text('Cinecito')),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final movie = nowPlayingMovies[index];
            return ListTile(
              title: Text(movie.title),
              subtitle: Text(movie.overview),
            );
          }, childCount: nowPlayingMovies.length),
        ),
      ],
    );
  }
}