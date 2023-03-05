import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/weatherModelProvider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    //final orientation = MediaQuery.of(context).orientation;
    return MultiProvider(providers: [
      
      ChangeNotifierProvider(create: (_)=>WeatheModelProvider()),


    ],child: MaterialApp(
        theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(

                //   bodySmall:GoogleFonts.oswald(textStyle: textTheme.bodySmall) ,
                bodyMedium: GoogleFonts.oswald(
                    textStyle: textTheme.bodyMedium, color: Colors.white))),
        home: HomeScreen())
  ,);
  }
}

// Widget bottomDetailsSheet() {
// return DraggableScrollableSheet(
// 	initialChildSize: .4,
// 	minChildSize: .1,
// 	maxChildSize: .9,
// 	builder: (BuildContext context, ScrollController scrollController) {
// 	return  Container(
//       child: CustomPaint(
//                      painter: HeaderCurvedContainer(),
  
//                child: Container(
//                 //color: Colors.amber,
//                child:  ListView(
//         controller: scrollController,
//         children: [
//           ListTile(
//           title: Text(
//             "NAME",
//           ),
//           subtitle: Text(
//          'ss'
//           //	animalNames[selectedTile],
//           ),
//           ),
//           ListTile(
//           title: Text(
//             "FAMILY",
//           ),
//           subtitle: Text(
//                  'ss'
  
//           //	animalFamily[selectedTile],
//           ),
//           ),
//           ListTile(
//           title: Text(
//             "LIFESPAN",
//           ),
//           subtitle: Text(
//                  'ss'
  
//           //	animalLifeSpan[selectedTile],
//           ),
//           ),
//           ListTile(
//           title: Text(
//             "WEIGHT",
//           ),
//           subtitle: Text(
//                  'ss'
  
//           //	animalWeight[selectedTile],
//           ),
//           ),
//         ],
//         ),
      
//                ),
//              //  painter: HeaderCurvedContainer(),
             
      
//    ),
//     );
// 	},
// );
// }
// // // CustomPainter class to for the header curved-container


// class HeaderCurvedContainer extends CustomPainter {

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color =Colors.green;
//     var fs = Offset(size.width*0.17, size.height *0.47);
//     var fe = Offset(size.width*0.51,  size.height*0.55);

//     var sp = Offset(size.width*0.87, size.height *0.47);
//     var se = Offset(size.width*0.51, size.height *0.55);


//     Path path = Path()
//       ..moveTo(size.width *0.17, size.height)
//       //..cubicTo(fs.dx, y1, x2, y2, x3, y3)\
//     //  ..cubicTo(x1, y1, x2, y2, x3, y3)
//       ..quadraticBezierTo(fs.dx, fs.dy, fe.dx, fe.dy)
//       ..moveTo(size.width*0.83, size.height)
//       //..moveTo(size.width*51, size.h)

//      ..quadraticBezierTo(sp.dx, sp.dy, se.dx, se.dy)
     
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

// class WaveClipper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//     // TODO: implement getClip
//     var path = new Path();
//     path.lineTo(0, size.height);
//     var firstStart = Offset(size.width/5
//     , size.height);
//     var firstEnd = Offset(size.width /2.25, size.height-50);
  
//   path.quadraticBezierTo(firstStart.dx, firstStart.dy,
//    firstEnd.dx, firstEnd.dy);

//    path.close();

//    return path;


//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     throw UnimplementedError();
//   }




// }