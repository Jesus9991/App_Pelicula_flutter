import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/modelss.dart';
import 'package:peliculas_app/models/popular_response.dart';


class MoviesProvider extends ChangeNotifier{

String _apiKey  = "e3c95469816c37a55f729c540f2a2822";
String _baseUrl  = "api.themoviedb.org"; //dominio
String _lenguaje = "es-ES";


List<Movie> onDisplayMovies= [];
List<Movie> popularMovies= [];

MoviesProvider(){ 

print("movies Provider intial");

this.getOndisplayMovies();
this.getPopularMovies();

}
getOndisplayMovies() async {

                      //dominio de donde se llama  //segmento
  var url = Uri.https(this._baseUrl, '3/movie/now_playing', {
    "api_key":_apiKey,
    "language": _lenguaje,
   "page": "1",
  });

  // Await the http get response, then decode the json-formatted response.
 final response = await http.get(url);
 final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

 // final Map <String, dynamic> decodedData = json.decode(response.body) ;
  // print(nowPlayingResponse.results[0].title);

   onDisplayMovies = nowPlayingResponse.results;
   notifyListeners();
 }
 getPopularMovies() async{
  var url = Uri.https(this._baseUrl, '3/movie/popular', {
    "api_key":_apiKey,
    "language": _lenguaje,
   "page": "1",
  });

  // Await the http get response, then decode the json-formatted response.
 final response = await http.get(url);
 final popularResponse = PopularResponse.fromJson(response.body);

 // final Map <String, dynamic> decodedData = json.decode(response.body) ;
  // print(nowPlayingResponse.results[0].title);

  popularMovies = [...popularMovies, ...popularResponse.results];
  print(popularMovies[0]);
   notifyListeners();
 }
}