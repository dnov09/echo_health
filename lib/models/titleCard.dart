import 'package:flutter/material.dart';
import 'package:echo_health/constants/custom_clipper.dart';
import 'package:echo_health/constants/style.dart';
import 'package:echo_health/screens/medicalPage.dart';

class TitleCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final Color color;
  final Color textColor;
  final String route;

  const TitleCard(
      {Key key,
      @required this.image,
      @required this.title,
      this.color = Colors.white,
      this.textColor,
      this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
        height: 72,
        width: MediaQuery.of(context).size.width - 60,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          color: color,
        ),
        child: Material(
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                Positioned(
                  child: ClipPath(
                    clipper: MyCustomClipper(clipType: ClipType.semiCircle),
                    child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.black.withOpacity(0.05),
                      ),
                      height: 120,
                      width: 75,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(width: 32, height: 32, image: image),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                color: Constants.textDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, route);
            },
          ),
          color: Colors.transparent,
        ),
      ),
    );
  }
}
