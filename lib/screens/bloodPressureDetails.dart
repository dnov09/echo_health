import 'package:echo_health/models/grid_item.dart';
import 'package:echo_health/models/progress_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:echo_health/constants/custom_clipper.dart';
import 'package:echo_health/constants/style.dart';
import 'package:echo_health/widgets/appbar.dart';
import 'package:echo_health/constants/style.dart';

class BloodPressureDetails extends StatefulWidget {
  static String route = '/blood-pressure';
  @override
  _BloodPressureDetailsState createState() => _BloodPressureDetailsState();
}

class _BloodPressureDetailsState extends State<BloodPressureDetails> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    // For Grid Layout
    double _crossAxisSpacing = 16, _mainAxisSpacing = 16, _cellHeight = 150.0;
    int _crossAxisCount = 2;

    double _width = (MediaQuery.of(context).size.width -
            ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    double _aspectRatio =
        _width / (_cellHeight + _mainAxisSpacing + (_crossAxisCount + 1));

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(clipType: ClipType.bottom),
            child: Container(
              color: Constants.gold,
              height: Constants.headerHeight + statusBarHeight,
            ),
          ),

          Positioned(
            right: -45,
            top: -30,
            child: ClipOval(
              child: Container(
                color: Colors.black.withOpacity(0.05),
                height: 220,
                width: 220,
              ),
            ),
          ),

          // BODY
          Padding(
            padding: EdgeInsets.all(Constants.paddingSide),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // Back Button
                        SizedBox(
                          width: 34,
                          child: RawMaterialButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios,
                                size: 15.0, color: Colors.white),
                            shape: CircleBorder(
                              side: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                  style: BorderStyle.solid),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Blood Pressure",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              mainAxisAlignment: MainAxisAlignment.start,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  "66/123",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "mmHg",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/blooddrop.png'),
                        height: 53,
                        width: 60,
                        color: Colors.white.withOpacity(1)),
                  ],
                ),
                SizedBox(height: 30),
                // Chart
                Material(
                  shadowColor: Colors.grey.withOpacity(0.01), // added
                  type: MaterialType.card,
                  elevation: 10, borderRadius: new BorderRadius.circular(10.0),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    height: 300,
                    child: Column(
                      children: <Widget>[
                        // Rest Active Legend
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10.0),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Constants.lightGreen,
                                  shape: BoxShape.circle),
                            ),
                            Text("SYS"),
                            Container(
                              margin: EdgeInsets.only(left: 10.0, right: 10.0),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Constants.darkGreen,
                                  shape: BoxShape.circle),
                            ),
                            Text("DIA"),
                          ],
                        ),
                        SizedBox(height: 20),
                        // Main Cards - Heartbeat and Blood Pressure
                        Container(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              ProgressVertical(
                                value: 50,
                                date: "11/20",
                                isShowDate: true,
                              ),
                              ProgressVertical(
                                value: 50,
                                date: "11/21",
                                isShowDate: false,
                              ),
                              ProgressVertical(
                                value: 45,
                                date: "11/22",
                                isShowDate: false,
                              ),
                              ProgressVertical(
                                value: 30,
                                date: "11/23",
                                isShowDate: true,
                              ),
                              ProgressVertical(
                                value: 50,
                                date: "11/24",
                                isShowDate: false,
                              ),
                              ProgressVertical(
                                value: 20,
                                date: "11/25",
                                isShowDate: false,
                              ),
                              ProgressVertical(
                                value: 45,
                                date: "11/26",
                                isShowDate: true,
                              ),
                              ProgressVertical(
                                value: 67,
                                date: "11/27",
                                isShowDate: false,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        // Line Graph
                        Expanded(
                          child: Container(
                              decoration: new BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                shape: BoxShape.rectangle,
                                color: Constants.darkGreen,
                              ),
                              child: ClipPath(
                                clipper: MyCustomClipper(
                                    clipType: ClipType.multiple),
                                child: Container(
                                    decoration: new BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  shape: BoxShape.rectangle,
                                  color: Constants.lightGreen,
                                )),
                              )),
                        ),
                      ],
                    ),
                  ), // added
                ),
                SizedBox(height: 30),
                Container(
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Your blood pressure is ",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        TextSpan(
                          text: "66/123 mmHg ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.amber[600],
                              fontFamily: 'OpenSans'),
                        ),
                        TextSpan(
                          text: "today.\n",
                          style:
                              TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
                        ),
                        TextSpan(
                          text:
                              "This is better than yesterday's readings but continue to take your medication as prescribed.",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                syncButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

SizedBox syncButton() {
  return SizedBox(
    height: 40,
    width: 60,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {},
      padding: EdgeInsets.all(12),
      color: Colors.cyan,
      child: Text('Sync with hub',
          style: TextStyle(color: Colors.white, fontSize: 13)),
    ),
  );
}
