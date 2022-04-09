import 'package:flutter/material.dart';
import 'package:peliculas_app/models/modelss.dart';

class MovieSlider extends StatefulWidget {
 final List <Movie> movies;
 final String? title;
 final Function onNextPage;

  const MovieSlider({Key? key,
  required this.movies,
  this.title, 
  required this.onNextPage}) 
  : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}  
   final ScrollController scrollcontroller = new ScrollController();

class _MovieSliderState extends State<MovieSlider> {
  @override
  void initState() { //sirve para ejecutar codigo la primera vez que va hacer construido
    // TODO: implement initState
    super.initState();
    scrollcontroller.addListener(() {

      if(scrollcontroller.position.pixels >=scrollcontroller.position.maxScrollExtent- 500){

        widget.onNextPage();
      }
     
    });
  }
  @override
  void dispose() { //cuando el widge va hacer destuido
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
 
            if(this.widget.title != null)
           Padding(
           
            padding:EdgeInsets.symmetric(horizontal: 20),
            child: Text(this.widget.title!,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),
          
             ),
             SizedBox(height: 6,), 
          Expanded(
            child: ListView.builder(
              controller: scrollcontroller,
              scrollDirection: Axis.horizontal, //direccion del scroll
              itemCount: widget.movies.length,
              itemBuilder: (_, int index) => _moviePoster(widget.movies[index],"${widget.title}-$index-${widget.movies[index].id}")
            ),
          ),
        ],
      ),
    );
  }
}
class _moviePoster extends StatelessWidget {

   final Movie movie;
   final String heroId;

   _moviePoster( this.movie, this.heroId  );
   

  @override
  Widget build(BuildContext context) {
       
       movie.heroId =heroId;

    return Container(
   width: 130,
   height: 190,
   
   margin:  EdgeInsets.symmetric(horizontal: 10),
  child: Column( 
    children: [
          
      GestureDetector(
        onTap: () => Navigator.pushNamed(context,"details", arguments: movie), //manda a esa pantalla al tocar
        child: Hero(
          tag: movie.heroId!,
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