import 'package:flutter/material.dart';
import 'package:peliculas_app/provilder/movie_provider.dart';
import 'package:peliculas_app/seach/search_delegate.dart';
import 'package:peliculas_app/widgests/widgest.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final moviesProvilder =Provider.of<MoviesProvider>(context,);
    print(moviesProvilder.onDisplayMovies);

        return Scaffold(
          
      appBar: AppBar( 
        //centerTitle: true, //centrar textos
       title:  const Text("Cartelera",style: TextStyle(fontSize: 30,color: Colors.white70,),),
         leading:  Icon(Icons.movie_filter_outlined,size: 35,color:Colors.white54,),
       elevation: 0,
        actions: [
            IconButton(
             
               icon: const Icon(Icons.search_outlined,size: 35,color: Colors.white70,),
                onPressed: () => showSearch(context: context, delegate: MovieSearchDelege()),
                
               ),
          
        ],  
        
      ),
      body: SingleChildScrollView(
        child: Column(
        children:  [
            //tarjetas grandes
         Card_swipe(movies:moviesProvilder.onDisplayMovies), //icono barra 
           
          //tarjetas pequeñas
          MovieSlider(
            
            movies: moviesProvilder.popularMovies,
            title: "Populares", 
            onNextPage: () => moviesProvilder.getPopularMovies(),
            
          ),
            
                
          

        ],
        ),
       ) 
    );
    
  }
}