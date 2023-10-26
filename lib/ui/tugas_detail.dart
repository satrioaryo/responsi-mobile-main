import 'package:flutter/material.dart';
import 'package:manajemen_tugas/bloc/tugas_bloc.dart';
import 'package:manajemen_tugas/model/tugas.dart';
import 'package:manajemen_tugas/ui/tugas_form.dart';
import 'package:manajemen_tugas/ui/tugas_page.dart';

class TugasDetail extends StatefulWidget {
  Tugas? tugas;

  TugasDetail({Key? key, this.tugas}) : super(key: key);

  @override
  _TugasDetailState createState() => _TugasDetailState();
}

class _TugasDetailState extends State<TugasDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Judul : ${widget.tugas!.title}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Deskripsi : ${widget.tugas!.description}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Deadline : ${widget.tugas!.deadline}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Edit
        // OutlinedButton(
        //   child: const Text("EDIT"),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => TugasForm(
        //           tugas: widget.tugas!,
        //         ),
        //       ),
        //     );
        //   },
        // ),
        // Tombol Hapus
        OutlinedButton(
          child: const Text("DELETE"),
          onPressed: () => confirmHapus(),
        ),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        // Tombol Hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            TugasBloc.deleteTugas(id: widget.tugas!.id)
                .then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TugasPage(),
                      ),
                    ));
          },
        ),
        // Tombol Batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }
}
