// ignore_for_file: use_key_in_widget_constructors

//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xclub/widgets/barchart.dart';

//providers
import '/provider/anaylsis.dart';

//widgets
import '/widgets/linechart.dart';
import '/widgets/radarchart.dart';

class AnalysisScreen extends StatefulWidget {
  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AnalysisProvider>(context);
    return ListView(
      padding: const EdgeInsets.only(top: 70),
      children: <Widget>[
        //title
        const Padding(
          padding: EdgeInsets.only(left: 17.5),
          child: Text(
            'Progress Analysis',
            style: TextStyle(
              fontSize: 28,
              wordSpacing: 3,
              fontFamily: 'Rubik',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 11),

        //subtitle2
        const Padding(
          padding: EdgeInsets.only(left: 17.5),
          child: Text(
            'Track and monitor your workouts to get one step ahead\n in the game.',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'iosReg',
              color: Colors.white30,
            ),
          ),
        ),

        const SizedBox(height: 50),

        // smalltitle1
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Body Analysis',
            style: TextStyle(
              fontSize: 16,
              wordSpacing: 2,
              fontFamily: 'Rubik',
              color: Colors.white,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 10),

        //subtitle3
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              splashRadius: 0.1,
              onPressed: () => setState(
                () => provider.filter != 0
                    ? provider.setFilter(0)
                    : provider.setFilter(1),
              ),
              icon: const Icon(
                size: 20,
                color: Colors.orange,
                Icons.arrow_back_ios_rounded,
              ),
              padding: const EdgeInsets.all(0),
            ),
            Opacity(
              opacity: 1,
              child: Text(
                provider.filter == 0
                    ? '  Calories burnt per workout'
                    : '   Fat burnt per workout',
                style: const TextStyle(
                  fontSize: 16,
                  wordSpacing: 2,
                  fontFamily: 'Rubik',
                  color: Colors.orange,
                ),
              ),
            ),
            IconButton(
              onPressed: () => setState(
                () => provider.filter != 0
                    ? provider.setFilter(0)
                    : provider.setFilter(1),
              ),
              splashRadius: 0.1,
              icon: const Icon(
                size: 20,
                color: Colors.orange,
                Icons.arrow_forward_ios_rounded,
              ),
              padding: const EdgeInsets.all(0),
            ),
          ],
        ),

        //linegraph
        const SizedBox(
          height: 250,
          child: LineChartSample2(),
        ),

        const SizedBox(height: 20),

        // smalltitle2
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Muscles Analysis',
            style: TextStyle(
              fontSize: 16,
              wordSpacing: 2,
              fontFamily: 'Rubik',
              color: Colors.white,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 20),

        //subtitle4
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              splashRadius: 0.1,
              onPressed: () => setState(
                () => provider.filter2 != 0
                    ? provider.setFilter2(0)
                    : provider.setFilter2(1),
              ),
              icon: const Icon(
                size: 20,
                color: Colors.orange,
                Icons.arrow_back_ios_rounded,
              ),
              padding: const EdgeInsets.all(0),
            ),
            Opacity(
              opacity: 1,
              child: Text(
                provider.filter2 == 0
                    ? 'Muscles used per workout'
                    : 'Muscle gained per workout',
                style: const TextStyle(
                  fontSize: 16,
                  wordSpacing: 2,
                  fontFamily: 'Rubik',
                  color: Colors.orange,
                ),
              ),
            ),
            IconButton(
              onPressed: () => setState(
                () => provider.filter2 != 0
                    ? provider.setFilter2(0)
                    : provider.setFilter2(1),
              ),
              splashRadius: 0.1,
              icon: const Icon(
                size: 20,
                color: Colors.orange,
                Icons.arrow_forward_ios_rounded,
              ),
              padding: const EdgeInsets.all(0),
            ),
          ],
        ),

        const SizedBox(height: 20),

        //radargraph
        const SizedBox(
          height: 380,
          child: RadarChartSample1(),
        ),

        // smalltitle3
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                'Last Inbody Check',
                style: TextStyle(
                  fontSize: 16,
                  wordSpacing: 2,
                  fontFamily: 'Rubik',
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'On 12 / 04 / 2023',
                style: TextStyle(
                  fontSize: 12,
                  wordSpacing: 2,
                  fontFamily: 'Rubik',
                  color: Colors.white38,
                ),
              ),
            ],
          ),
        ),

        //barchart
        const SizedBox(height: 250, child: BarChartSample3()),

        const SizedBox(height: 70),
      ],
    );
  }
}
