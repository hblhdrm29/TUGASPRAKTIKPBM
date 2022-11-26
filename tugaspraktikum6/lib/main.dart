import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      darkTheme: themeData,
      title: "Tugas Praktikum 6",
      home: PageSatu(),
    );
  }
}

class PageSatu extends StatefulWidget {
  const PageSatu({super.key});

  @override
  State<PageSatu> createState() => _PageSatuState();
}

class _PageSatuState extends State<PageSatu> {
  final Future<SharedPreferences> _preference = SharedPreferences.getInstance();
  bool now = false;

  void _Boolean() async {
    final SharedPreferences prefs = await _preference;
    setState(() {
      now = !now;
      if(now == true){
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => DashboardPage(),));
        print("Already Login");
        print(now);
      }else{
        print("First Login");
        print(now);
      }
    });
    prefs.setBool('isbool', now);
  }

  _getBool() async {
    final SharedPreferences prefs = await _preference;
    setState(() {
      now = prefs.getBool('isbool') ?? now;
      if(now == true){
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => DashboardPage(),));
        print(now);
        print("Login Successfully");
      }else{
        print(now);
        print("You not Login");
      }
    });
  }

  void initState(){
    super.initState();
    _getBool();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(
              onPressed:_Boolean, 
              child: Text('Login')),
          ]) ,)),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(7.0),
                width: 300,
                height: 300,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/862091.jpg"),
                ),
              ),
              Container(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 6.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                      child: Container(
                        width: 200,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Habillah Darma" ,style: TextStyle(fontWeight: FontWeight.w900),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      elevation: 5.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                      child: Container(
                        width: 200,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("2010631170145",style: TextStyle(fontWeight: FontWeight.w900)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      elevation: 5.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                      child: Container(
                        width: 200,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("hdhmmz@gmail.com",style: TextStyle(fontWeight: FontWeight.w900)),
                          ],
                        ),
                      ),
                    ),
                ]),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 300,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ElevatedButton(onPressed:(() {}), child: Text("Log Out")),
                )),
          ]) ,) ),
    );
  }
}