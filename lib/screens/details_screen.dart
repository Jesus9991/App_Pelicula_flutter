import 'package:flutter/material.dart';
import 'package:peliculas_app/models/modelss.dart';
import 'package:peliculas_app/widgests/widgest.dart';



class DetailsScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    

    //Todo cambiar luego por una instancia de movie
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    print(movie.title);

     return  Scaffold(
      body: CustomScrollView(
        slivers:[
            _CustomAppBar(movie),
            SliverList(
            delegate: SliverChildListDelegate([
           _PosterAndTitle(movie),
            OverView(movie),
            // OverView(movie),
            // OverView(movie),
            CastingCArd(movie.id),
            
            
                   

            ]),
            )
        ],
      ),
    );
  }
}
class _CustomAppBar extends StatelessWidget {

 final Movie movie ;


 _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar( //AppBAr que se le puede ajustar el tamaño
      //backgroundColor: Colors.deepPurple[400],
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace:  FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
       title: Container( 
         alignment: Alignment.bottomCenter,
         color: Colors.black45, //color opaco a la img de las peliculas
         width: double.infinity,
         child: Text(movie.title, style: TextStyle(fontSize: 20),),
          padding: EdgeInsets.only(bottom: 20),
         

         ), 
       background: FadeInImage(
         placeholder: NetworkImage("http://web9.unl.edu.ar/noticias/img/loading1.gif" ),
         image: NetworkImage(movie.fullBackdropPack),
         fit: BoxFit.cover,
         

         ),

        ),

    );
  }
}



class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle( this.movie);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin:  EdgeInsets.only( top: 20), //separacion
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect( //para bordes redondeados
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                
                placeholder: NetworkImage("http://web9.unl.edu.ar/noticias/img/loading1.gif"), 
                image: NetworkImage(movie.FulPosterIMG,),
                height: 200,
                
                ),
            ),
          ),
          SizedBox( //separacion entre imagenes
            width: 20,
          ),
          ConstrainedBox( constraints:BoxConstraints(maxWidth: size.width- 250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text(movie.title, style: textTheme.headline5, overflow:  TextOverflow.ellipsis, maxLines: 2,),
                Text(movie.originalTitle, style: textTheme.subtitle1, overflow:  TextOverflow.ellipsis, maxLines: 2,),
          
                Row(
                      children: [
                        Icon(Icons.star_outlined, color: Colors.amber[300],size: 25,), //estrella color 
                      SizedBox( width: 4),
                          Text("${movie.voteAverage}",style: textTheme.caption,)
                      ],
                )
          
              ],
            ),
          )
        ]
        ),
    );
  }
}

class OverView extends StatelessWidget {
  final Movie movie;

  const OverView(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20, vertical: 50),
     child: Text(movie.overview, 
     textAlign: TextAlign.justify,                 //tamaño letra
     style: Theme.of(context).textTheme.subtitle1, textScaleFactor: 1.5, 
    
     ),
     
    );
  }
}