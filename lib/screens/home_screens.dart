import 'package:flutter/material.dart';
import 'package:peliculas_app/provilder/movie_provider.dart';
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
       title: const Text("Peliculas en carteleras"),
     
        elevation: 0,
        actions: [
            IconButton(
             
               icon: const Icon(Icons.search_outlined),
                onPressed: (){

                },
               )

          
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        children:  [
            //tarjetas grandes
         Card_swipe(movies:moviesProvilder.onDisplayMovies),

          //tarjetas pequeñas
          MovieSlider(
            movies: moviesProvilder.popularMovies,
            title: "Populares",
          ),
            
                
          

        ],
        ),
       ) 
    );
    
  }
}