import 'package:flutter/material.dart';
import 'halu.dart';
import 'db_provider.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatefulWidget {
  final Halu? halu;

  const UpdatePage({Key? key, this.halu}) : super(key: key);

  @override
  State<UpdatePage> createState() => _FormPageState();
}

class _FormPageState extends State<UpdatePage> {
  final TextEditingController _kegiatanController = TextEditingController();
  final TextEditingController _waktuController = TextEditingController();
  final TextEditingController _dimanaController = TextEditingController();
  final TextEditingController _ngapainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.halu!.id);
    _kegiatanController.text = widget.halu!.kegiatan;
    _waktuController.text = widget.halu!.waktu;
    _dimanaController.text = widget.halu!.dimana;
    _ngapainController.text = widget.halu!.ngapain;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit HALU"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                size: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _kegiatanController,
                  decoration: InputDecoration(
                    label: const Text('Kegiatan'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(08.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(08.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _waktuController,
                  decoration: InputDecoration(
                    label: const Text('Waktu'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(08.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(08.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _dimanaController,
                  decoration: InputDecoration(
                    label: const Text('Dimana'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(08.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(08.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _ngapainController,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: const Text('Ngapain'),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(08.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(08.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: FloatingActionButton.extended(
                      onPressed: () async {
                        final halu = Halu(
                            id: widget.halu!.id!,
                            kegiatan: _kegiatanController.text,
                            waktu: _waktuController.text,
                            dimana: _dimanaController.text,
                            ngapain: _ngapainController.text);
                        Provider.of<DbProvider>(context, listen: false)
                            .updateHalus(halu);
                        Navigator.pop(context);
                      },
                      label: Text("Buat HALU"),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ))
              ]),
        ),
      )),
    );
  }
}