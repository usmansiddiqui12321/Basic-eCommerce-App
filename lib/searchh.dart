import 'package:dsaproject/Screens/Components/list.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: TextField(
              controller: _textEditingController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Search here',
                  contentPadding: EdgeInsets.all(8)),
              onChanged: (value) {
                setState(() {
                  Binary_Search = productlst
                      .where((e) => e
                          .toString()
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          )),
      body: ListView.builder(
          itemCount: _textEditingController.text.isNotEmpty
              ? Binary_Search.length
              : productlst.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    child: Icon(Icons.image),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(_textEditingController.text.isNotEmpty
                      ? Binary_Search[index]
                      : productlst[index]),
                ],
              ),
            );
          }),
    );
  }
}
