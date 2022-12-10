// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors

import 'package:flutter/material.dart';

import '../model/celebrity.dart';
import '../service/celebrity_service.dart';

class SearchDetail extends StatefulWidget {
  @override
  State<SearchDetail> createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  final TextEditingController _controller = TextEditingController();
  String name = "";
  List<Celebrity>? celebrity;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData(name);
  }

  getData(String name) async {
    celebrity = await CelebrityService().getDetails(name);
    if (celebrity != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: Text("Search Celebrity"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  border: Border.all(
                    color: Colors.grey,
                  )),
              child: TextField(
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                controller: _controller,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(width: 2),
                  // ),
                  hintText: "Search Celebrity Name e.g Michael Jordan",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () async {
                name = _controller.text;
                getData(name);
                print(name);
              },
              child: Text(
                "Submit",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Visibility(
                visible: isLoaded,
                replacement: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Search Celebrity Details From Above SearchBar",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                child: ListView.builder(
                  itemCount: celebrity?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            "Name: ${celebrity![index].name}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Gender: ${celebrity![index].gender}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Nationality: ${celebrity![index].nationality}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Net Worth: ${celebrity![index].netWorth.toString()}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Nationality: ${celebrity![index].age.toString()} years",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Birthday: ${celebrity![index].birthday.toString()}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Occupation: ${celebrity![index].occupation[0].toString()}, ${celebrity![index].occupation[1].toString()},${celebrity![index].occupation[2].toString()} ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Height: ${celebrity![index].height.toString()} meters",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
