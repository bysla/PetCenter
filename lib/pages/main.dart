import 'package:flutter/material.dart';
import '../services/api.dart';
import '../class/class.dart';

import './info.dart';

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  List<Incident> incidents = new List<Incident>();
  ScrollController _scrollController = new ScrollController();
  int page = 1;
  int max;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page =1;
    getdata(page);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        page++;
        getdata(page);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  getdata(page) async {
    max = await GetTotal();
    if (max > incidents.length) {
      List<Incident> gincidents = new List<Incident>();
      gincidents.addAll(await GetIncidents(page));
      setState(() {
        incidents.addAll(gincidents);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double height = MediaQuery.of(context).size.height;

    return ListView.builder(
      padding: const EdgeInsets.all(30),
      itemCount: incidents.length,
      controller: _scrollController,
      itemBuilder: (context, i) {
        return Column(
          children: <Widget>[
            Card(
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,MaterialPageRoute(
                    builder: (context) => Info(city: incidents[i].location,
                    title: incidents[i].title,
                    description: incidents[i].description,
                    url: incidents[i].url,
                    whats: incidents[i].whatsapp,)),);
              },
              child: Container(
                  width: width * 0.8,
                  height: height * 0.6,
                  //color: Colors.amber,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          incidents[i].title,
                          style: TextStyle(fontSize: 28),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            incidents[i].url,
                            height: height * 0.4,
                          ),
                        ),
                        Text(incidents[i].description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  )),
            )),
            SizedBox(height: 10,)
          ],
        );
      },
    );
  }
}
