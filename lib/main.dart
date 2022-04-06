import 'package:flutter/material.dart';
import 'package:peliculas_app/provilder/movie_provider.dart';
import 'package:peliculas_app/screens/screen.dart';
import 'package:provider/provider.dart'; //recuerda exportar en Screen

void main() => runApp(const AppState());


class AppState extends StatelessWidget {
  const AppState({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy:  false,)
      ],
           child: MyApp(),
      );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  //asi es para correr la app
  
    return MaterialApp(
     
        debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: "home",
      routes: {
      
        "home": (_)=>  HomeScreen(), //pantalla de inicio
        "details":(_) =>  DetailsScreen(),
      },
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black38,
        
          
            
        appBarTheme:  AppBarTheme(
          centerTitle: true,
        color: Colors.deepPurple[400],
        )
      ),
      //  theme: ThemeData.dark().copyWith(  //aqui se pone el modo o tema para la App
      //    scaffoldBackgroundColor: Colors.black38,
      //    appBarTheme: AppBarTheme(
      //      color: Colors.purple[300],
         
      //      )   
      //  ),   
               
    );
  }
}