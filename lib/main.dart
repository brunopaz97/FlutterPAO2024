import 'package:flutter/material.dart';
import 'pagina_ultimos_registros.dart';
import 'pagina_historial_registros.dart';

void main() {
  runApp(SensorAcusticoApp());
}

class SensorAcusticoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoreo Sensor Acústico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PaginaInicio(),
    );
  }
}

class PaginaInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo con opacidad
          Positioned.fill(
            child: Opacity(
              opacity: 0.2, // Opacidad blanquecina
              child: Image.asset(
                'assets/images/fondo.png', // Ruta de la imagen de fondo
                fit: BoxFit.cover, // Asegura que la imagen cubra toda la pantalla
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.sensors, // Icono relacionado con sensores
                  size: 100,
                  color: Colors.blueAccent,
                ),
                SizedBox(height: 20),
                Text(
                  'Bienvenido al monitoreo de sensores acústicos',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Consulta y analiza los datos en tiempo real de tus sensores acústicos.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () {
                    // Navegar a la página de últimos registros
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaginaUltimosRegistros()),
                    );
                  },
                  icon: Icon(Icons.dashboard), // Nuevo ícono de tablero
                  label: Text('Consultar últimos registros'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Navegar a la página de historial de registros
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaginaHistorialRegistros()),
                    );
                  },
                  icon: Icon(Icons.history),
                  label: Text('Ver historial de registros'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/inictel.png', // Ruta del ícono
                width: 160,
                height: 160,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
