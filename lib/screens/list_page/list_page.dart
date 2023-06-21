import 'package:flutter/material.dart';
import 'package:morning_diary/constant.dart';
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
        //delete(sample);
        setState(() {});
        //update();
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Color(0xFFE4DCCF),
        //컬러 지정해줘야 전체선택가능
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              color: Colors.white,
              width: 60,
              height: 60,
              child: Center(
                child: Text(
                  ' 6.\n25',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sample.promiseAns2.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  // Text(
                  //   sample.createAt.toIso8601String(),
                  //   style: const TextStyle(color: Colors.grey),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Sample>> _loadSampleList() async {
    var list = await SqlSampleCrudRepository.getList();
    return list;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'asdfad',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: kQuestionBackgroundColor,
        elevation: 0,
      ),
      body: Container(
        color: kQuestionBackgroundColor,
        child: FutureBuilder<List<Sample>>(
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
      ),
    );
  }
}
