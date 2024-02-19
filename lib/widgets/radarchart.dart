//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

//providers
import '/provider/anaylsis.dart';

class RadarChartSample1 extends StatefulWidget {
  const RadarChartSample1({super.key});

  final gridColor = Colors.white;
  final titleColor = Colors.white;

  final artColor = Colors.yellow;
  final offRoadColor = Colors.orange;
  final fashionColor = Colors.red;

  @override
  State<RadarChartSample1> createState() => _RadarChartSample1State();
}

class _RadarChartSample1State extends State<RadarChartSample1> {
  int selectedDataSetIndex = -1;
  double angleValue = 0;
  bool relativeAngleMode = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Consumer<AnalysisProvider>(
            builder: (context, provider, _) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rawDataSets(provider.filter2)
                  .asMap()
                  .map((index, value) {
                    final isSelected = index == selectedDataSetIndex;
                    return MapEntry(
                      index,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDataSetIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          height: 26,
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Colors.black : Colors.transparent,
                            borderRadius: BorderRadius.circular(46),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 6,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInToLinear,
                                padding: EdgeInsets.all(isSelected ? 8 : 6),
                                decoration: BoxDecoration(
                                  color: value.color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInToLinear,
                                style: TextStyle(
                                  color: isSelected
                                      ? value.color
                                      : widget.gridColor,
                                ),
                                child: Text(value.title),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                  .values
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 40),
        AspectRatio(
          aspectRatio: 1.3,
          child: Consumer<AnalysisProvider>(
            builder: (context, provider, _) => RadarChart(
              RadarChartData(
                radarTouchData: RadarTouchData(
                  touchCallback: (FlTouchEvent event, response) {
                    if (!event.isInterestedForInteractions) {
                      setState(() {
                        selectedDataSetIndex = -1;
                      });
                      return;
                    }
                    setState(() {
                      selectedDataSetIndex =
                          response?.touchedSpot?.touchedDataSetIndex ?? -1;
                    });
                  },
                ),
                dataSets: showingDataSets(provider.filter2),
                radarBackgroundColor: Colors.transparent,
                borderData: FlBorderData(show: false),
                radarBorderData: const BorderSide(color: Colors.transparent),
                titlePositionPercentageOffset: 0.2,
                titleTextStyle:
                    TextStyle(color: widget.titleColor, fontSize: 14),
                getTitle: (index, angle) {
                  switch (index) {
                    case 0:
                      return const RadarChartTitle(text: 'Biceps');
                    case 2:
                      return const RadarChartTitle(text: 'Triceps');
                    case 1:
                      return const RadarChartTitle(text: 'Ankles');
                    default:
                      return const RadarChartTitle(text: '');
                  }
                },
                tickCount: 1,
                ticksTextStyle:
                    const TextStyle(color: Colors.transparent, fontSize: 10),
                tickBorderData: const BorderSide(color: Colors.transparent),
                gridBorderData: BorderSide(color: widget.gridColor, width: 2),
              ),
              swapAnimationDuration: const Duration(milliseconds: 400),
            ),
          ),
        ),
      ],
    );
  }

  List<RadarDataSet> showingDataSets(int filter) {
    return rawDataSets(filter).asMap().entries.map((entry) {
      final index = entry.key;
      final rawDataSet = entry.value;

      final isSelected = index == selectedDataSetIndex
          ? true
          : selectedDataSetIndex == -1
              ? true
              : false;

      return RadarDataSet(
        fillColor: isSelected
            ? rawDataSet.color.withOpacity(0.2)
            : rawDataSet.color.withOpacity(0.05),
        borderColor:
            isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.25),
        entryRadius: isSelected ? 3 : 2,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: isSelected ? 2.3 : 2,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets(int filter) {
    return [
      RawDataSet(
        title: 'Push',
        color: widget.offRoadColor,
        values: filter == 0
            ? [
                350,
                50,
                300,
              ]
            : [
                50,
                10,
                200,
              ],
      ),
      RawDataSet(
        title: 'Pull',
        color: widget.artColor,
        values: filter == 0
            ? [
                200,
                150,
                200,
              ]
            : [
                200,
                25,
                40,
              ],
      ),
      RawDataSet(
        title: 'Leg',
        color: widget.fashionColor,
        values: filter == 0
            ? [
                100,
                300,
                50,
              ]
            : [
                10,
                120,
                50,
              ],
      ),
    ];
  }
}

class RawDataSet {
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });

  final String title;
  final Color color;
  final List<double> values;
}
