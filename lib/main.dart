// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'helpers/colorsys.dart';
import 'helpers/strings.dart';


void main() {
  runApp( const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0
    );
    super.initState();
  }

    @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
              child: Text('Saltar', style: TextStyle(
              color: ColorSys.grey,
              fontSize: 18,
              fontWeight: FontWeight.w400
              ),),
            ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              currentIndex = page;
              setState(() { });
            },
            controller: _pageController,
            children: [
              slidePage(
                image: 'assets/images/presentacion_uno.svg',
                title:  Strings.steUnoTitulo,
                content: Strings.steUnoContenido
              ),
              slidePage(
                  image: 'assets/images/presentacion_dos.svg',
                  title: Strings.steDosTitulo,
                  content: Strings.steDosContenido
              ),
               slidePage(
                  image: 'assets/images/presentacion_tres.svg',
                  title: Strings.steTresTitulo,
                  content: Strings.steTresContenido
              ),

            ],
          ),
          Container(
                margin: const EdgeInsets.only(bottom: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  _buildIndicator(),
                ),
              )
        ],
      ),
    );
  } 


Widget slidePage({image, title, content}) {
  return Container(
    padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5 ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SvgPicture.asset(image, height: 450, width: 300,)
              )
          ],
        ),
        Text(title, style: TextStyle(
          color: ColorSys.primary,
          fontSize: 30,
          fontWeight: FontWeight.bold), 
          textAlign: TextAlign.center
          ),
          const SizedBox(height: 280),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorSys.primary,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),

      ],
    ),
  );
}

Widget _indicator(bool isActive){
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 6,
    width: isActive ? 30 : 6,
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      color: ColorSys.primary,
      borderRadius: BorderRadius.circular(5)
    ),
  );
}

List<Widget> _buildIndicator(){
  List<Widget> indicators = [];
  for (int i = 0; i < 3; i++) {
    if ( currentIndex == i ) {
      indicators.add(_indicator(true));
    }else{
      indicators.add(_indicator(false));
    }
  }
  return indicators;
}

} 