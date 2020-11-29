import 'package:flutter/material.dart';
import 'package:echo_health/constants/style.dart';
import 'package:echo_health/models/titleCard.dart';
import 'package:echo_health/models/vitalsCard.dart';
import 'package:echo_health/screens/insurancePage.dart';
import 'package:echo_health/screens/medicalPage.dart';
import '../widgets/appbar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'bloodPressureDetails.dart';

class HomePage extends StatelessWidget {
  static String route = '/home';

  // get _crossAxisCount => _crossAxisCount;
  // get _crossAxisSpacing => _crossAxisSpacing;
  // get _mainAxisSpacing => _mainAxisSpacing;
  // get _aspectRatio => _aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: HomeBody(),
    );
  }

  MyDrawer() {}
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool pressed = true;

  @override
  Widget build(BuildContext context) {
    double _crossAxisSpacing = 16, _mainAxisSpacing = 16, _cellHeight = 150.0;
    int _crossAxisCount = 2;

    double _width = (MediaQuery.of(context).size.width -
            ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    double _aspectRatio =
        _width / (_cellHeight + _mainAxisSpacing + (_crossAxisCount + 1));
    return Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: ListView(
          children: [
            const DividerText(label: 'Main Hub'),
            Card(
              elevation: 3.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      'assets/arduino.png',
                      height: 90,
                      // width: 60,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    child: Center(
                      child: Text(
                        'Status: Good',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Constants.mistyGreen.withOpacity(0.7),
                        border:
                            Border.all(color: Constants.neonGreen, width: 1.9),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ],
              ),
            ),
            const DividerText(label: 'Upcoming Appointments'),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: appointmentCard(),
            ),
            const DividerText(label: "Vitals"),
            Container(
              child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _crossAxisCount,
                  crossAxisSpacing: _crossAxisSpacing,
                  mainAxisSpacing: _mainAxisSpacing,
                  childAspectRatio: _aspectRatio,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int idx) {
                  switch (idx) {
                    case 0:
                      return CardMain(
                        image: AssetImage('assets/heartbeat.png'),
                        title: "Heartbeat",
                        value: "66 ",
                        unit: " bpm",
                        color: Constants.lightGreen,
                      );
                      break;
                    // SizedBox(height: 16),
                    case 1:
                      return CardMain(
                        image: AssetImage('assets/blooddrop.png'),
                        title: "Blood Pressure",
                        value: "66/123 ",
                        unit: " mmHg",
                        color: Constants.gold,
                        path: BloodPressureDetails.route,
                      );
                      break;
                    // SizedBox(height: 16),
                    case 2:
                      return CardMain(
                        image: AssetImage('assets/temp.png'),
                        title: "Temperature",
                        value: "96.7 ",
                        unit: " °C",
                        color: Constants.tiffBlue,
                      );
                      break;
                    case 3:
                      return CardMain(
                        image: AssetImage('assets/sugar.jpg'),
                        title: "Blood Sugar",
                        value: "101",
                        unit: " °mg/dL",
                        color: Colors.purple[100],
                      );
                      break;
                    default:
                      return CardMain(
                        image: AssetImage('assets/temp.png'),
                        title: "Blood Sugar",
                        value: "101",
                        unit: " °mg/dL",
                        color: Constants.tiffBlue,
                      );
                      break;
                  }
                },
              ),
            ),
            const DividerText(label: 'Personal'),
            TitleCard(
              image: AssetImage('assets/health.png'),
              title: 'Medical ID',
              route: MedicalPage.route,
            ),
            SizedBox(height: 16),
            TitleCard(
              image: AssetImage('assets/insurance.png'),
              title: 'Insurance',
              route: InsurancePage.route,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Card appointmentCard() {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 3.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xFFD9D9D9),
                backgroundImage: NetworkImage(Constants.userImage),
                radius: 36.0,
              ),
              RichText(
                text: TextSpan(
                  text: 'Dr Thomas Carmody',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nSaturday, Nov 14th at 3:00 PM',
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      text: '\nGunsaulus Medical Care \nIIT Campus Drive',
                      style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Divider(
            color: Colors.grey[200],
            height: 3,
            thickness: 1,
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _iconBuilder(Icons.calendar_today, 'Calender',
                  color: Constants.lightGreen),
              pressed ? checkinBox() : checkedinBox(),
              _iconBuilder(
                Icons.cancel,
                'Cancel',
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  SizedBox checkinBox() {
    return SizedBox(
      height: 36,
      width: 100,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          setState(() {
            pressed = !pressed;
          });
        },
        padding: EdgeInsets.all(12),
        color: Colors.cyan,
        child: Text('Check in',
            style: TextStyle(color: Colors.white, fontSize: 13)),
      ),
    );
  }

  SizedBox checkedinBox() {
    return SizedBox(
      height: 36,
      width: 100,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          setState(() {
            pressed = !pressed;
          });
        },
        padding: EdgeInsets.all(12),
        color: Colors.green[400],
        child: Text('Checked in',
            style: TextStyle(color: Colors.white, fontSize: 13)),
      ),
    );
  }

  Column _iconBuilder(icon, title, {color = Colors.black}) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 28,
          color: color,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class DividerText extends StatelessWidget {
  const DividerText({
    Key key,
    @required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: Constants.grey,
              height: 50,
            ),
          ),
        ),
        Text(label,
            style: TextStyle(
              color: Constants.grey,
              fontFamily: 'OpenSans',
            )),
        Expanded(
          child: new Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: Constants.grey,
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
