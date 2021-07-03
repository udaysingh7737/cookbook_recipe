import 'package:cookbook_recipe/models/MyBottamNavBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Recipe_Detail extends StatefulWidget {


  const Recipe_Detail( {Key key, }) : super(key: key);

  @override

  _Recipe_DetailState createState() => _Recipe_DetailState();
}

class _Recipe_DetailState extends State<Recipe_Detail> {


  Future<void> getdata() async{
    final apiUrl= "https://api.github.com/users/desi-programer";
    var res = await http.get(Uri.https(apiUrl, 'albums/1'));
    print(res.statusCode);
    print(res.body);
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar:MyBottomNavBar(),
        body: RecipePage(size: size));
  }
}

class RecipePage extends StatelessWidget {
  const RecipePage({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(
        children: [
          MaterialButton(onPressed: (){},
          child: Text("GEt Data"),),
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Container(
              height: size.height*0.32,
              child: Image.asset("assets/images/image_1.png", fit: BoxFit.cover,),
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.8,
            minChildSize: 0.3,
            initialChildSize: 0.4,
            builder: (context,ScrollController scrollController) {

              return SingleChildScrollView(


                child: Container(
                  color: Colors.lime,
                  child: Column(

                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                            child: Text(
                                "Vegetable Rava Upma Recipe from Tamil Nadu")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Container(
                            child: Text(
                                "Vegetable Rava Upma Recipe from Tamil Nadu")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 500.0),
                        child: Container(
                            child: Text(
                                "Vegetable Rava Upma Recipe from Tamil Nadu")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Container(
                            child: Text(
                                "Vegetable Rava Upma Recipe from Tamil Nadu")),
                      ),


                    ],
                  ),
                ),

              );
            }
          ),

        ],
      ),
    );
  }
}

