import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/modelss.dart';




class Card_swipe extends StatelessWidget {
 
  
    final List<Movie> movies;

  Card_swipe({Key? key,
   required this.movies}) :
    super(key: key);
  
  @override
  Widget build(BuildContext context) {

   final size = MediaQuery.of(context).size;
   if(this.movies.length == 0){
     return Container(
       width: double.infinity,
       height:size.height * 0.6,
       child: Center(
         child: CircularProgressIndicator(),
       ),
     );
   }


    return Container(
      width:  double.infinity,
      height: size.height * 0.6,
     
     child:Swiper(
       itemCount:movies.length,
      layout: SwiperLayout.STACK,
      itemWidth: size.width * 0.5,
      itemHeight:  size.height* 0.5,
      itemBuilder: (_, int index){

        final movie = movies[index];
        print(movie.FulPosterIMG);


       movie.heroId = "swiper-${movie.id}";

           return  GestureDetector( //cambio a otra pantalla
             onTap: ()=> Navigator.pushNamed(context,"details", arguments: movie) , //manda a esa pantalla al tocar
             child: Hero(
               tag: movie.heroId!,
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(30),
                 child:   FadeInImage(
                   placeholder: NetworkImage("http://web9.unl.edu.ar/noticias/img/loading1.gif"),
                   image: NetworkImage(movie.FulPosterIMG),
                   fit: BoxFit.cover, //tamaño del imagen Swipe
                     ),
               ),
             ),
           );
      },
       ),
    );
  }
}