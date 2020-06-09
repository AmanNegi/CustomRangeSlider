import 'package:custom_range_slider/customSliderThumb.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //TODO: Add your custom values here...
  RangeValues _values = RangeValues(100, 10000);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SliderTheme(
              data: SliderThemeData().copyWith(
                  showValueIndicator: ShowValueIndicator.always,
                  overlappingShapeStrokeColor: Colors.green,
                  //* added custom icon here..
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 5.0,
                  rangeThumbShape: CustomSliderThumbCircle(
                      thumbRadius: 25.0, icon: Icons.format_align_center),
                  thumbColor: Colors.red),
              child: RangeSlider(
                max: 10000,
                min: 100,
                divisions: 6,
                //? If you dont want the popping labels comment the label parameter
                labels: RangeLabels("\$  ${_values.start.round()}",
                    "\$  ${_values.end.round()}"),
                values: _values,
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    this._values = value;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\$ ${_values.start.round()}",
                    style: TextStyle(
                        color: Colors.red[400],
                        fontSize: 20,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\$ ${_values.end.round()}",
                    style: TextStyle(
                        color: Colors.red[400],
                        fontSize: 20,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
