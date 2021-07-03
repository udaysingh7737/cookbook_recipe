import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class OnBoardingScreen extends StatefulWidget {


  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final int numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1,0.4,0.7,0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF5528BF),
                Color(0xFFAB35DD),
                Color(0xFFDDC135),

              ]
            )
          ),

          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    onPressed: (){return print("Skip");},

                    child: Text("Skip",style: TextStyle(color: Colors.white,
                    fontSize: 20.4,

                    ),
                    ),
                  ),
                ),

                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page){
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child:  Image.network(
                              "https://firebasestorage.googleapis.com/v0/b/cookbook-edca4.appspot.com/o/Chef-cuate.png?alt=media&token=f596c7c7-4a16-4e29-a8c2-a9ab23c1c72a"
                          ),

                        ),
                        SizedBox(
                          height: 30.0,
                        ),


                      ],
                    )
                  ],),
                )
              ],
            ),
          ),

        ),
      ),
    );
  }
}
