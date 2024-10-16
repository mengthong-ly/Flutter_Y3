// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           body: Column(
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             height: 200,
//             decoration: const BoxDecoration(
//               color: Colors.blue,
//             ),
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 100,
//                   color: Colors.green,
//                 ),
//               ),
//               Container(
//                 width: 100,
//                 height: 100,
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 255, 0, 183),
//                 ),
//               ),
//             ],
//           ),
//           // Container(
//           //   width: 100,
//           //   height: 100,
//           //   decoration: const BoxDecoration(
//           //     color: Colors.red,
//           //   ),
//           // )
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 100,
//                   color: const Color.fromARGB(255, 244, 181, 44),
//                 ),
//               ),
//               const SizedBox(
//                 width: 20,
//               ),
//               Expanded(
//                 child: Container(
//                   height: 100,
//                   color: const Color.fromARGB(255, 244, 181, 44),
//                 ),
//               ),
//               const SizedBox(
//                 width: 20,
//               ),
//               Expanded(
//                 child: Container(
//                   height: 100,
//                   color: const Color.fromARGB(255, 244, 181, 44),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           Expanded(
//             child: Container(
//               color: Colors.pink,
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
 

  runApp(
    MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: 500,
              child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: Colors.green, height: 200),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(color: Colors.blue, height: 200),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: Colors.red, height: 200),
                )
              ],
                      ),
            ),
          ),
      )),
  );
}