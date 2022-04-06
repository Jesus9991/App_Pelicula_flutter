import 'package:flutter/material.dart';


class CastingCArd extends StatelessWidget {
  const CastingCArd({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 190,
     
      
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) =>_CastCard(), 
         
      
      ),
    );
  }
}
class _CastCard extends StatelessWidget {
  const _CastCard({ Key? key }) : super(key: key);

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
              image:NetworkImage("https://upload.wikimedia.org/wikipedia/commons/b/b3/Adrien_Brody_Cannes_2017.jpg"),
              height: 150,
              width: 100,
              fit: BoxFit.cover,

            ),
          ),
          SizedBox(height: 5,),
          Text("actor.name", maxLines: 2,overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}