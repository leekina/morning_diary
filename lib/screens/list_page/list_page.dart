import 'package:flutter/material.dart';
import 'package:morning_diary/models/sample.dart';
import 'package:morning_diary/repository/sql_database_crud.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  void update() => setState(() {});

  void delete(Sample sample) async {
    await SqlSampleCrudRepository.delete(sample.id!);
  }

  Widget _sampleOne(Sample sample) {
    return GestureDetector(
      onTap: () async {
        // await Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailView(sample: sample),
        //   ),
        // );
        // update();
        delete(sample);
        setState(() {});
        //update();
      },
      child: Container(
        color: Colors.white,
        //컬러 지정해줘야 전체선택가능
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 7),
                Text(sample.createAt.toString()),
                Text(sample.promiseAns1.toString()),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              sample.createAt.toIso8601String(),
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Sample>> _loadSampleList() async {
    return await SqlSampleCrudRepository.getList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("sqflite Sample"),
      ),
      body: FutureBuilder<List<Sample>>(
        future: _loadSampleList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("SQflite Error"),
            );
          }
          if (snapshot.hasData) {
            var datas = snapshot.data;
            return ListView(
              children: List.generate(
                datas!.length,
                (index) => _sampleOne(datas[index]),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
