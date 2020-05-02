import 'package:flutter/material.dart';
import '../services/api.dart';
import '../class/class.dart';

class ListMy extends StatefulWidget {
  ListMy({Key key}) : super(key: key);

  @override
  _ListMyState createState() => _ListMyState();
}

class _ListMyState extends State<ListMy> {
  List<Incident> incidents = new List<Incident>();
  ScrollController _scrollController = new ScrollController();
  int page = 1;
  int max;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        
        getdata();
      }
    });
  }

  getdata() async {
    max = await GetTotal();
    if (max > incidents.length) {
      List<Incident> gincidents = new List<Incident>();
      gincidents.addAll(await GetMyIncidents());
      setState(() {
        incidents = gincidents;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
                  onTap: () {},
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  incidents[i].title,
                                  style: TextStyle(fontSize: 28),
                                ),
                                IconButton(
                                  icon: Icon(Icons.restore_from_trash),
                                  tooltip: 'Deletar',
                                  onPressed: () {},
                                ),
                              ],
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
            SizedBox(
              height: 30,
            )
          ],
        );
        
      },
    );
  }
}
