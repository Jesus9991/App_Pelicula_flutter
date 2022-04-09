import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/credits_response.dart';
import 'package:peliculas_app/provilder/movie_provider.dart';
import 'package:provider/provider.dart';


class CastingCArd extends StatelessWidget {

 final int movieId;

  const CastingCArd (this.movieId);

  @override
  Widget build(BuildContext context) {

    final  moviesProvider = Provider.of<MoviesProvider>(context, listen:  false);
    
       return FutureBuilder(
         future: moviesProvider.getMovieCast(movieId),

         builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
           
           if(!snapshot.hasData){
             return Container(
               constraints: BoxConstraints(maxWidth: 120),
                    height: 190,
                    child: CupertinoActivityIndicator(),
             );
           }
       final List<Cast>  cast= snapshot.data!;

      return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 190,
     
      
      child: ListView.builder(
        itemCount: cast.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) =>_CastCard(cast[index]), 
         
      
      ),
    );

         },
       );
     

  
  }
}
class _CastCard extends StatelessWidget {

  final Cast actor;

  const _CastCard( this.actor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: 100,
      height: 100,
    
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
  
              placeholder: NetworkImage("http://web9.unl.edu.ar/noticias/img/loading1.gif") ,
              image:NetworkImage(actor.fullProfilePath),
              height: 150,
              width: 100,
              fit: BoxFit.cover,

            ),
          ),
          SizedBox(height: 5,),
          Text(actor.name, maxLines: 2,overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}