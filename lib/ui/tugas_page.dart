import 'package:flutter/material.dart';
import 'package:manajemen_tugas/bloc/tugas_bloc.dart';
import 'package:manajemen_tugas/model/tugas.dart';
import 'package:manajemen_tugas/ui/tugas_detail.dart';
import 'package:manajemen_tugas/ui/tugas_form.dart';

class TugasPage extends StatefulWidget {
  const TugasPage({Key? key}) : super(key: key);

  @override
  _TugasPageState createState() => _TugasPageState();
}

class _TugasPageState extends State<TugasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Tugas'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.add, size: 26.0),
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TugasForm()));
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: TugasBloc.getTugas(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListTugas(
                  list: snapshot.data,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListTugas extends StatelessWidget {
  final List? list;

  const ListTugas({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return ItemTugas(
          tugas: list![i],
        );
      },
    );
  }
}

class ItemTugas extends StatelessWidget {
  final Tugas tugas;

  const ItemTugas({Key? key, required this.tugas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TugasDetail(
              tugas: tugas,
            ),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(tugas.title!),
          subtitle: Text(tugas.description!),
        ),
      ),
    );
  }
}
