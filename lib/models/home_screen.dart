import 'package:cookbook_recipe/models/Mydrawer.dart';
import 'package:cookbook_recipe/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'MyBottamNavBar.dart';
import 'body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;


  bool _folded = true;
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Image.asset("assets/images/App_logo1.png",height:80,width: 140,);

  SearchPressfunction() {
    setState(() {
      if(this.cusIcon.icon == Icons.search){
        this.cusIcon = Icon(Icons.cancel_sharp);
        this.cusSearchBar = TextField(
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            border: InputBorder.none
          ),
          style: TextStyle(
            fontSize: 16.0
          ),
        );
      }
      else{
        cusIcon = Icon(Icons.search);
        cusSearchBar = Image.asset('assets/images/prasadam_logo1.jpg');
      }
    }
    );
  }

  @override
  void initState(){
    super.initState();
    _scrollController =ScrollController();
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top:SizeConfig.defaultSize *0.3, bottom: 3),
        child: Body(),

      ),
      bottomNavigationBar: MyBottomNavBar(),
      drawer: myDrawer(),
    );
  }

  AppBar buildAppBar() {
Size size =MediaQuery.of(context).size;
    return AppBar(
      toolbarHeight: 65,
      leading: Builder(builder: (context)=>
      IconButton(
          icon: SvgPicture.asset('assets/icons/menu.svg'),
          splashColor: Colors.white38,
          onPressed:()=>
            Scaffold.of(context).openDrawer(),

      )),
      centerTitle: true,
      title: cusSearchBar ,

      actions: <Widget>[

        Padding(
          padding: const EdgeInsets.only(bottom: 2.0,top: 8),
          child: AnimatedContainer(duration: Duration(milliseconds: 250),
          width: _folded ? 56 :  size.width* 0.86,
            height: size.height * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(29),
              color: Colors.white,
              boxShadow:  kElevationToShadow[8],
            ),
            child: Row(
              children: <Widget>[
                Expanded(child: Container(
                  padding: EdgeInsets.only(left: 25 ,bottom: 2),
                  child: !_folded
                      ? TextField(
                      decoration: InputDecoration(
                        hintText: " Search ....",
                        hintStyle: TextStyle(color: Color(0xFFA336F8)),
                        border: InputBorder.none,
                      ),
                      )
                      : null,
                ),
                ),
                AnimatedContainer(duration: Duration(milliseconds: 380),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_folded ? 32 : 0),
                      topRight: Radius.circular(32),
                      bottomLeft: Radius.circular(_folded ? 32 : 0),
                      bottomRight: Radius.circular(32),
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(

                          _folded ? Icons.search : Icons.close,
                          color: Color(0xFFA336F8),),
                      ),
                    onTap: (){
                        setState(() {
                          _folded =!_folded;
                        });
                    },
                  ),
                ),
                ),
              ],
            ),
          ),
        )

        /*IconButton(icon: cusIcon,

          tooltip: "Search",
          splashColor: Colors.white38,
          onPressed: SearchPressfunction(),
          ),
        SizedBox(width: SizeConfig.defaultSize * 0.5)

         */
      ],
    );
  }
}


