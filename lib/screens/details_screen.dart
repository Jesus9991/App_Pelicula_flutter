import 'package:flutter/material.dart';
import 'package:peliculas_app/widgests/widgest.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    //Todo cambiar luego por una instancia de movie
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? "no-movie";

     return  Scaffold(
      body: CustomScrollView(
        slivers:[
          const _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
             _PosterAndTitle(),
            OverView(),
            OverView(),
            OverView(),
            CastingCArd(),
            
                   

            ]),
            )
        ],
      ),
    );
  }
}
class _CustomAppBar extends StatelessWidget {

  const _CustomAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar( //AppBAr que se le puede ajustar el tamaño
      backgroundColor: Colors.deepPurple[400],
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace:  FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
       title: Container( 
         alignment: Alignment.bottomCenter,
         color: Colors.black26,
         width: double.infinity,
         child: Text("Titulo-movie", style: TextStyle(fontSize: 20),),
           padding: EdgeInsets.only(bottom: 20),
         

         ), 
       background: FadeInImage(
         placeholder: NetworkImage("http://web9.unl.edu.ar/noticias/img/loading1.gif" ),
         image: NetworkImage("https://p4.wallpaperbetter.com/wallpaper/380/574/425/blur-gaussian-purple-wallpaper-preview.jpg"),
         fit: BoxFit.cover,
         

         ),

        ),

    );
  }
}



class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin:  EdgeInsets.only( top: 20), //separacion
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect( //para bordes redondeados
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: NetworkImage("http://web9.unl.edu.ar/noticias/img/loading1.gif"), 
              image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUCXWsJpXDbh_t__smWFiWxDdHZGNeI0Uxcg&usqp=CAU"),
              height: 300,
              ),
          ),
          SizedBox( //separacion entre imagenes
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Info movie- title", style: textTheme.headline5, overflow:  TextOverflow.ellipsis, maxLines: 2,),
              Text("Original title", style: textTheme.subtitle1, overflow:  TextOverflow.ellipsis, maxLines: 1,),

              Row(
                    children: [
                      Icon(Icons.star_outlined, color: Colors.amber[300],size: 20,),
                    SizedBox( width: 4),
                        Text("movie. voteAvarage", style: textTheme.caption,)
                    ],
              )

            ],
          )
        ]
        ),
    );
  }
}

class OverView extends StatelessWidget {
  const OverView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
     child: Text("Do aliqua exercitation ullamco eu do. Aliqua nisi dolor enim dolor ex fugiat ad sit aute. Enim elit laboris labore ut. Occaecat non incididunt deserunt ad ipsum. Eu sit est consequat proident magna pariatur reprehenderit consequat ipsum tempor. Labore excepteur dolor exercitation consectetur ex officia sit eiusmod veniam eu fugiat sint adipisicing aliquip. Et labore et irure esse aliqua mollit non et ex velit labore exercitation ullamco.",
     textAlign: TextAlign.justify,
     style: Theme.of(context).textTheme.subtitle1,
     ),
    );
  }
}