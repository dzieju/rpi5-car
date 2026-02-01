import 'package:flutter/material.dart';

void main() {
  runApp(const CarRadioApp());
}

class CarRadioApp extends StatelessWidget {
  const CarRadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Radio Interface',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onSpotifyPressed() {
    // TODO: Implement Spotify integration
    debugPrint('Spotify button pressed');
  }

  void _onYouTubePressed() {
    // TODO: Implement YouTube integration
    debugPrint('YouTube button pressed');
  }

  void _onGoogleMapsPressed() {
    // TODO: Implement Google Maps integration
    debugPrint('Google Maps button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Car Radio'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Responsive layout: adjust button size based on screen size
            final buttonWidth = constraints.maxWidth > 600 
                ? 300.0 
                : constraints.maxWidth * 0.7;
            final buttonHeight = constraints.maxHeight > 400 
                ? 80.0 
                : constraints.maxHeight * 0.15;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuButton(
                  context,
                  label: 'Spotify',
                  icon: Icons.music_note,
                  color: Colors.green,
                  onPressed: _onSpotifyPressed,
                  width: buttonWidth,
                  height: buttonHeight,
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                _buildMenuButton(
                  context,
                  label: 'YouTube',
                  icon: Icons.play_circle_outline,
                  color: Colors.red,
                  onPressed: _onYouTubePressed,
                  width: buttonWidth,
                  height: buttonHeight,
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                _buildMenuButton(
                  context,
                  label: 'Google Maps',
                  icon: Icons.map,
                  color: Colors.blue,
                  onPressed: _onGoogleMapsPressed,
                  width: buttonWidth,
                  height: buttonHeight,
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: const Text(
          'Twoje Centrum Multimedialne',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    required double width,
    required double height,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
