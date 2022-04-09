import 'package:flutter/material.dart';
import 'package:peliculas_app/models/modelss.dart';
import 'package:peliculas_app/provilder/movie_provider.dart';
import 'package:provider/provider.dart';
import '../provilder/movie_provider.dart';
import "package:flutter/src/material/theme_data.dart";


class MovieSearchDelege extends SearchDelegate{  //hacer un buscador, enlazado al icono de buscador(enlazar al icono)

@override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => "Buscar"; //cambiiar idioma del buscador 
   
  @override  
  List<Widget>? buildActions(BuildContext context) { //para iconos
    
    return 
    [
     IconButton(
      
       icon: Icon(Icons.clear_outlined, size: 35,color: Colors.white70),
       onPressed:(){
        query= ""; //al precionar la el icon de X se borra la busqueda
       },
     )
     ];
     
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton(
     
       icon: Icon(Icons.arrow_back, size: 35,color: Colors.white70,), //cerrar la busqueda al precionar el icon X
        onPressed: (){
          close(context, null);
        },
       
       );
  }

  @override
  Widget buildResults(BuildContext context) { //resultado de la busqueda
     return  Text("BuildResult");
  }
  Widget _emptyContainer(){
    return Container(
          child:  const Center(
            child: Icon(Icons.movie_creation_outlined, color: Colors.white60,size: 200,),
        ),
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) { //sugurencia de busdqueda 

      if(query.isEmpty){
        return _emptyContainer();
      }
      final moviesProvider = Provider.of<MoviesProvider>(context,listen: false);
      moviesProvider.getSuggestionByQuery(query);  

       return StreamBuilder(
       
      stream:  moviesProvider.suggestionStream,
       builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
           
           if(!snapshot.hasData) return _emptyContainer();

           final movies = snapshot.data!;

         return ListView.builder(
           itemCount: movies.length ,
           itemBuilder: (_, int index) => _MovieItem(movies[index ]),

           );


       },
     );
   }
}
class _MovieItem extends StatelessWidget {

  final Movie movie;
  

  const _MovieItem( this.movie);
  
  @override
  Widget build(BuildContext context) {

    movie.heroId ="search-${movie.id}";
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: NetworkImage("https://i.stack.imgur.com/GNhxO.png"),
          image: NetworkImage(movie.FulPosterIMG),
          width: 50,
          fit: BoxFit.contain,
          ),
      ),
        title: Text(movie.title),
        onTap: (){
         Navigator.pushNamed(context, "details",arguments: movie);
        },

    );
  }
}