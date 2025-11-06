class MoviedbResponse {
  final int page;
  final Dates? date;
  final int totalresults;

  MoviedbResponse({
    required this.page,
    required this.dates,
    required this.results,
    required this.totalpages,
    required this.totalresults,
  })
}