import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'halu.dart';
import 'list_page.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key,required this.halu});

  final Halu halu;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 300,
          child: Text("Detail")),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 30),
                child: Container(
                  width: double.infinity,
                  child: Text(widget.halu.kegiatan,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30 , left: 30),
                child: Container(
                  width: double.infinity,
                  child: Text(widget.halu.waktu,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30 , left: 30),
                child: Container(
                  width: double.infinity,
                  child: Text(widget.halu.dimana,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: double.infinity,
                  child: Text(widget.halu.ngapain,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
          ),
    );
  }
}