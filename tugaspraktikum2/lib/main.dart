import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Flutter 1 dan 2',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: const MyHomePage(title: "hdhmmz"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// tugas perbesar angka ya
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 25;
  var textSize = 35.0;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text('$_counter', style: TextStyle(fontSize: 5 + textSize))
            ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
          textSize = textSize + 3.0;
            _counter++;
          });
        },
        icon: const Icon(Icons.add_circle_outline, color: Colors.white),
        label: const Text('Tambah dan Perbesar',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }

  // tugas ganti nama ya
// class _MyHomePageState extends State<MyHomePage> {
//   bool kondisi = true;

//   void gantiNama() {
//     setState(() {
//       if (kondisi) {
//         kondisi = false;
//       } else {
//         kondisi = true;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title, style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             kondisi == true
//                ? Text('Habillah Darma', style: TextStyle(fontSize: 50))
//                 : Text('hdhmmz', style: TextStyle(fontSize: 15)),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: gantiNama,
//         icon: const Icon(Icons.edit_attributes, color: Color.fromARGB(255, 255, 255, 255)),
//         label: const Text('Ubah',
//             style: TextStyle(color: Color.fromARGB(255, 5, 0, 0), fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.lightBlue,
//       ),
//     );
}