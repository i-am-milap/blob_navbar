import 'package:blob_navbar/models/bootomTabModel.dart';
import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

class BlobBootomNav extends StatefulWidget {
  final int activePage;
  final Function onNavTabChange;
  BlobBootomNav({this.activePage, this.onNavTabChange});

  @override
  _BlobBootomNavState createState() => _BlobBootomNavState();
}

class _BlobBootomNavState extends State<BlobBootomNav> {
  List<Map<String, dynamic>> navData = [
    {
      "icon": Icons.home,
      "title": "Home",
      "color": Colors.blue,
    },
    {
      "icon": Icons.person,
      "title": "Profile",
      "color": Colors.purple,
    },
    {
      "icon": Icons.settings,
      "title": "Settings",
      "color": Colors.red,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buildNavItems(),
    );
  }

  List buildNavItems() {
    List<Widget> navItems = List();
    for (int i = 0; i < navData.length; i++) {
      BottomTabModel data = BottomTabModel.fromJson(navData[i]);
      navItems.add(
        customTabBuilder(
          icon: data.icon,
          title: data.title,
          isActive: (widget.activePage == i),
          color: data.color,
          index: i,
        ),
      );
    }
    return navItems;
  }

  Widget customTabBuilder({
    @required IconData icon,
    @required String title,
    @required bool isActive,
    @required Color color,
    @required int index,
  }) {
    return Tooltip(
      message: title,
      textStyle: TextStyle(color: Colors.white),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () => widget.onNavTabChange(index),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Positioned(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  direction: Axis.vertical,
                  children: <Widget>[
                    Icon(
                      icon,
                      color: (isActive) ? color : Colors.black.withOpacity(0.7),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: (isActive) ? color : Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    )
                  ],
                ),
              ),
            ),
            (isActive)
                ? Blob.animatedRandom(
                    size: 55,
                    duration: Duration(milliseconds: 500),
                    styles: BlobStyles(
                      color: color.withOpacity(0.2),
                    ),
                  )
                : Container(
                    width: 85,
                  ),
          ],
        ),
      ),
    );
  }
}
