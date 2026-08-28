import 'package:flutter/material.dart';
import 'package:glassy_bubble/glassy_bubble.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glassy Bubble Example',
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background representing a modern dashboard or abstract art
          Positioned.fill(
            child: Image.asset(
              'assets/profile_bg.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const ColoredBox(color: Color(0xFF030303));
              },
            ),
          ),
          const Positioned.fill(
            child: ColoredBox(color: Color(0xB8000000)),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'GlassyBubble 🫧',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap and hold a bubble to see its description!',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 48),
                  // Grid-like display of bubbles
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    alignment: WrapAlignment.center,
                    children: const [
                      GlassyBubble(
                        percentage: '75',
                        description: 'Flutter Power',
                        radius: 3.5,
                        gradientColors: [
                          Color(0xFF24131A),
                          Color(0xFF4A2635),
                          Color(0xFF8D4D61),
                          Color(0xFFD28A9C),
                          Color(0xFFFFE2E8),
                        ],
                      ),
                      GlassyBubble(
                        percentage: '92',
                        description: 'UI Design',
                        radius: 3.0,
                        gradientColors: [
                          Color(0xFF101B2A),
                          Color(0xFF1F3A52),
                          Color(0xFF3D7187),
                          Color(0xFF82B7BD),
                          Color(0xFFD9F4EE),
                        ],
                      ),
                      GlassyBubble(
                        percentage: '45',
                        description: 'Performance',
                        radius: 4.0,
                        gradientColors: [
                          Color(0xFF2A1D0E),
                          Color(0xFF5A3B16),
                          Color(0xFF9A6B28),
                          Color(0xFFD0A052),
                          Color(0xFFFFE7AE),
                        ],
                      ),
                      GlassyBubble(
                        percentage: '100',
                        description: 'Completed',
                        radius: 2.8,
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  // Feature Details Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.08),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Features',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildFeatureRow('✨ Glassmorphic Blur & Frosted look'),
                        _buildFeatureRow('🎨 Fully custom Gradient Colors mapping'),
                        _buildFeatureRow('🔍 Auto-scaling based on % values'),
                        _buildFeatureRow('👆 Interactive Long Press details scale transition'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 14,
        ),
      ),
    );
  }
}
