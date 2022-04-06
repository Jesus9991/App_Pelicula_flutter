import 'package:flutter/material.dart';
import 'package:peliculas_app/models/modelss.dart';

class MovieSlider extends StatelessWidget {
 final List <Movie> movies;
 final String? title;

  const MovieSlider({Key? key,
  required this.movies,
  this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
 
            if(this.title != null)
           Padding(
           
            padding:EdgeInsets.symmetric(horizontal: 20),
            child: Text(this.title!,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),
          
             ),
             SizedBox(height: 6,), 
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal, //direccion del scroll
              itemCount: movies.length,
              itemBuilder: (_, int index) => _moviePoster(movies[index])
            ),
          ),
        ],
      ),
    );
  }
}
class _moviePoster extends StatelessWidget {

   final Movie movie;

  const _moviePoster( this.movie  );

  @override
  Widget build(BuildContext context) {
    return Container(
   width: 130,
   height: 190,
   
   margin:  EdgeInsets.symmetric(horizontal: 10),
  child: Column( 
    children: [
          
      GestureDetector(
        onTap: () => Navigator.pushNamed(context,"details", arguments: "movie-instance"), //manda a esa pantalla al tocar
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: NetworkImage("http://web9.unl.edu.ar/noticias/img/loading1.gif"),
            image: NetworkImage(movie.FulPosterIMG),
            width: 130,
            height:190,
            fit: BoxFit.cover,
            ),
        ),
      ),
        SizedBox(height: 5,),
      
          Text(movie.title,
         maxLines: 2, overflow: TextOverflow.ellipsis, 
         textAlign: TextAlign.center,), //para poner ... esos 3 puntos a un texto 
        
    ],
  ),


  );
    
  }
}