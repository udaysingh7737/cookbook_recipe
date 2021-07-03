import 'package:cookbook_recipe/services/searchScreen.dart';
import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  final String  text;
  final String  tip;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    @required this.text,
    @required this.tip,
    @required this.onClicked
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Tooltip(
      message: tip,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: size.height* 0.02,horizontal: size.width* 0.15)
        ),
          onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
          },
          child: Text(text,style: TextStyle(fontSize: 15),)),
    );
  }
}


class RecordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context , "#1" ,"Ranking"),
          buildDivider(),
          buildButton(context , "05" ,"Recipes" ),
          buildDivider(),
          buildButton(context , "56" ,"Followers"),
        ],
      ),
    );
  }

  Widget buildDivider(){
    return
    Container(height: 25,
        child: VerticalDivider());
  }

  Widget buildButton(BuildContext context,String value, String title){
    return MaterialButton(onPressed: (){},
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(value,
          style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 20,
          ),
        ),
        SizedBox(height: 8,),

        Text(title,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
        )
      ],
    ),
    );
  }



}

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("About" ,
            style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),

          SizedBox(height: 10,
          ),

          Text("My Name Uday singh. hello i am udaY singh,"
              "My Name Uday singh. hello i am udaY singh"
              "My Name Uday singh. hello i am udaY singh"
              "My Name Uday singh. hello i am udaY singh ", style: TextStyle(fontSize: 15),)

        ],
      ),
    );
  }
}


