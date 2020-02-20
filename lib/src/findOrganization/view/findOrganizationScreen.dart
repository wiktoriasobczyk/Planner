import 'package:flutter/material.dart';
import 'package:timetable_schedule_app/src/common/green_button.dart';
import 'package:timetable_schedule_app/src/drawer/view.dart';
import 'dart:core';
import 'package:timetable_schedule_app/src/findOrganization/controller/find-organization-controller.dart';
import 'package:timetable_schedule_app/src/findOrganization/model.dart';

class FindOrganizationScreen extends StatefulWidget {
  @override
  _FindOrganizationScreenState createState() => _FindOrganizationScreenState();
}

class _FindOrganizationScreenState extends State<FindOrganizationScreen> {
  TextEditingController _c;
  FindOrganizationCtrl ctrl = new FindOrganizationCtrl();
  String orgCode = "";
  bool isButtonPressed = false;
  Future<String> organiations;
  // Future<List<Organization>> organiations;
  @override
  void initState() {
    _c = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _c?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      body: CustomScrollView(slivers: <Widget>[
        const SliverAppBar(
          expandedHeight: 10.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Wyszukaj organizację'),
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Wrap(alignment: WrapAlignment.center, children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Container(
                                  child: Text(
                                    'Wpisz kod organizacji',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ])
                      ],
                    ),
                  )
                ]))),
        SliverFillRemaining(
          child: new Container(
              child: new Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(150, 2, 150, 20),
                child: new TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (v) => setState(() {
                    orgCode = v;
                  }),
                  controller: _c,
                ),
              ),
              new GreenButton(
                labelText: 'Szukaj',
                onPressed: () {
                  setState(() {
                    isButtonPressed = true;
                    print(orgCode);
                    organiations = ctrl.getOrganizationByCode(orgCode);
                  });
                },
              ),
              // new Text("Text Input: $orgCode"),
              if (isButtonPressed = true)
                FutureBuilder(
                  future: organiations,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (isButtonPressed == true) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                        case ConnectionState.active:
                          // return Center(child: CircularProgressIndicator());
                          return Text("");
                        case ConnectionState.done:
                          if (snapshot.hasError)
                            return Text(
                                "There was an error: ${snapshot.error}");
                          String organiations = snapshot.data.toString();
                
                          return ListTile(
                            title: Text(organiations),
                            subtitle: Text(''),
                            isThreeLine: true,
                            // trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () => null,
                          );
                      }
                    }
                  },
                ),
            ],
          )),
        ),
      ]),
    );
  }
}
