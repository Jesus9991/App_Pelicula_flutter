import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/helpers/debouncer.dart';
import 'package:peliculas_app/models/modelss.dart';
import 'package:peliculas_app/models/popular_response.dart';
import 'package:peliculas_app/models/search_response.dart';


class MoviesProvider extends ChangeNotifier{

String _apiKey  = "e3c95469816c37a55f729c540f2a2822";
String _baseUrl  = "api.themoviedb.org"; //dominio
String _lenguaje = "es-ES";


List<Movie> onDisplayMovies= [];
List<Movie> popularMovies= [];
  Map<int,  List<Cast>> movie_Cast={};

int _popularPage = 0;

final debouncer = Debouncer(duration:  Duration(milliseconds: 500),


);

final StreamController<List<Movie>> _suggestionStreamController = new StreamController.broadcast();
                                           //this.
 Stream<List<Movie>> get suggestionStream=> _suggestionStreamController.stream;


MoviesProvider(){ 

print("movies Provider intial");

this.getOndisplayMovies();
this.getPopularMovies();

 //_suggestionStreamController.close(); 
}

   Future<String> _getJsonData(String endPoint, [int page = 1] )async{
final url = Uri.https(_baseUrl, endPoint, {
    "api_key":_apiKey,
    "language": _lenguaje,
   "page": "$page",
  });

  // Await the http get response, then decode the json-formatted response.
 final response = await http.get(url);
  return response.body;
    }

getOndisplayMovies() async {

  final jsonData = await _getJsonData("3/movie/now_playing");            //dominio de donde se llama  //segmento
  
 final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

 // final Map <String, dynamic> decodedData = json.decode(response.body) ;
  // print(nowPlayingResponse.results[0].title);

   onDisplayMovies = nowPlayingResponse.results;
   notifyListeners();
 }
 getPopularMovies() async{
   _popularPage++;
    final jsonData = await _getJsonData("3/movie/popular",_popularPage );  
 final popularResponse = PopularResponse.fromJson(jsonData);

 // final Map <String, dynamic> decodedData = json.decode(response.body) ;
  // print(nowPlayingResponse.results[0].title);

  popularMovies = [...popularMovies, ...popularResponse.results];
 
   notifyListeners();
 }

 Future <List<Cast>> getMovieCast(int movieId)async{
   //todo revisar el mapa 

   if (movie_Cast.containsKey(movieId)) return movie_Cast[movieId]!;
   print("pidiendo info al servidor");

    final jsonData = await _getJsonData("3/movie/$movieId/credits"); 
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    movie_Cast[movieId] = creditsResponse.cast;
      
    return creditsResponse.cast;

 }

 Future<List<Movie>> searchMovie (String query)async{

  final url = Uri.https(_baseUrl,"3/search/movie", {
    "api_key":_apiKey,
    "language": _lenguaje,
      "query": query,
    
  });

    final response = await http.get(url);
   final searchResponse = SearchResponse.fromJson(response.body);
   return searchResponse.results; 


 }
 void getSuggestionByQuery(String searchTeam){

debouncer.value ="";
debouncer.onValue = (value)async{
  //print("tenemos valor a buscar: $value");
  final results = await this.searchMovie(value);
  this._suggestionStreamController.add(results);

  };

 
 final timer = Timer.periodic(Duration(milliseconds: 300), (_){
  
  debouncer.value =  searchTeam;
 }
 );
 Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
 }
}