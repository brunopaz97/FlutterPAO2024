import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PaginaUltimosRegistros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Últimos Registros'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Fondo de pantalla
          Positioned.fill(
            child: Opacity(
              opacity: 0.2, // Opacidad blanquecina
              child: Image.asset(
                'assets/images/fondo.png', // Ruta de la imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido con gauges
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // Margen lateral
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  // Gauge para AMP. PICO PICO
                  _buildGauge(
                    title: 'AMP. PICO PICO',
                    min: 0,
                    max: 4095,
                    currentValue: 1800, // Valor dinámico
                    unit: '',
                  ),
                  SizedBox(height: 20),
                  
                  // Gauge para AMP. PICO PICO EN VOLTIOS
                  _buildGauge(
                    title: 'AMP. PICO PICO EN VOLTIOS',
                    min: 0,
                    max: 5,
                    currentValue: 2.2, // Valor dinámico
                    unit: 'V',
                  ),
                  SizedBox(height: 20),

                  // Gauge para AMP. PICO PICO EN DECIBELIOS
                  _buildGauge(
                    title: 'AMP. PICO PICO EN DECIBELIOS',
                    min: 0,
                    max: 150,
                    currentValue: 80, // Valor dinámico
                    unit: 'dB',
                  ),
                  SizedBox(height: 20),

                  // Gauge para VALOR DIGITAL DE LA ENTRADA DEL HIDRÓFONO
                  _buildGauge(
                    title: 'ENTRADA DEL HIDRÓFONO',
                    min: 0,
                    max: 4095,
                    currentValue: 1405, // Valor dinámico
                    unit: '',
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildGauge({
  required String title,
  required double min,
  required double max,
  required double currentValue,
  required String unit,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10), // Ajustamos el margen inferior
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Reducimos el padding
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
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Centra el título y el gauge
      children: [
        SizedBox(height: 24),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              radiusFactor: 0.75, // Ajusta el tamaño del gauge
              minimum: min,
              maximum: max,
              ranges: <GaugeRange>[
                GaugeRange(startValue: min, endValue: max * 0.2, color: Colors.red),
                GaugeRange(startValue: max * 0.2, endValue: max * 0.4, color: Colors.yellow),
                GaugeRange(startValue: max * 0.4, endValue: max * 0.6, color: Colors.green),
                GaugeRange(startValue: max * 0.6, endValue: max * 0.8, color: Colors.yellow),
                GaugeRange(startValue: max * 0.8, endValue: max, color: Colors.red),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(value: currentValue),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Text(
                    '$currentValue $unit',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  positionFactor: 0.8, // Acerca la anotación al gauge
                  angle: 90,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}


}
