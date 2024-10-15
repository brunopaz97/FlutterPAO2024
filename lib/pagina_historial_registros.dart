import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class ChartData {
  final DateTime time;
  final double value;

  ChartData(this.time, this.value);
}

// Genera datos aleatorios para cada serie
List<ChartData> generateRandomData(
    int count, double minValue, double maxValue) {
  final random = Random();
  return List.generate(count, (index) {
    final time =
        DateTime.now().subtract(Duration(minutes: 10 * (count - 1 - index)));
    return ChartData(
      time,
      minValue + random.nextDouble() * (maxValue - minValue),
    );
  });
}

// Genera conjuntos de datos aleatorios
final List<ChartData> ampPicoPicoData = generateRandomData(100, 0, 4095);
final List<ChartData> ampVoltiosData = generateRandomData(100, 0, 5);
final List<ChartData> ampDecibeliosData = generateRandomData(100, 0, 150);
final List<ChartData> valorDigitalData = generateRandomData(100, 0, 4095);

class PaginaHistorialRegistros extends StatefulWidget {
  @override
  _HistorialRegistrosPageState createState() => _HistorialRegistrosPageState();
}

class _HistorialRegistrosPageState extends State<PaginaHistorialRegistros> {
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    super.initState();
    _zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true,
      zoomMode: ZoomMode.x,
      enableMouseWheelZooming: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de Registros'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildCombinedChart(),
      ),
    );
  }

  Widget _buildCombinedChart() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: SfCartesianChart(
        zoomPanBehavior: _zoomPanBehavior,
        primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat.Hm(),
          intervalType: DateTimeIntervalType.minutes,
          interval: 60,
          minimum: ampPicoPicoData[ampPicoPicoData.length - 20].time,
          maximum: ampPicoPicoData.last.time,
        ),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries<ChartData, DateTime>>[
          LineSeries<ChartData, DateTime>(
            name: 'Amp. Pico Pico',
            dataSource: ampPicoPicoData,
            xValueMapper: (ChartData data, _) => data.time,
            yValueMapper: (ChartData data, _) => data.value,
            color: Colors.blue,
          ),
          LineSeries<ChartData, DateTime>(
            name: 'Amp. Voltios',
            dataSource: ampVoltiosData,
            xValueMapper: (ChartData data, _) => data.time,
            yValueMapper: (ChartData data, _) => data.value,
            color: Colors.red,
          ),
          LineSeries<ChartData, DateTime>(
            name: 'Amp. Decibeles',
            dataSource: ampDecibeliosData,
            xValueMapper: (ChartData data, _) => data.time,
            yValueMapper: (ChartData data, _) => data.value,
            color: Colors.green,
          ),
          LineSeries<ChartData, DateTime>(
            name: 'Valor Digital',
            dataSource: valorDigitalData,
            xValueMapper: (ChartData data, _) => data.time,
            yValueMapper: (ChartData data, _) => data.value,
            color: Colors.purple,
          ),
        ],
        trackballBehavior: TrackballBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
          tooltipSettings: InteractiveTooltip(
            format:
                'point.x\nAMP. PICO PICO: point.y\nVOLTIOS: point.y\nDECIBELIOS: point.y\nVALOR DIGITAL: point.y',
            canShowMarker: true,
          ),
          markerSettings: TrackballMarkerSettings(
            markerVisibility: TrackballVisibilityMode.visible,
            height: 10,
            width: 10,
            borderWidth: 1,
          ),
        ),
      ),
    );
  }
}
