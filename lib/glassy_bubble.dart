import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';

extension on num {
  double get rem => this * 16.0;
}

/// Tek kelime: ilk harf büyük, kalanı küçük (baloncuk etiketi).
String _bubbleSingleCapitalizedWord(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return trimmed;
  final firstWord = trimmed.split(RegExp(r'\s+')).first;
  if (firstWord.isEmpty) return firstWord;
  return firstWord[0].toUpperCase() + firstWord.substring(1).toLowerCase();
}

class GlassyBubble extends StatefulWidget {
  final String percentage;
  final String description;
  final double radius;
  final String? fontFamily;
  final TextStyle? percentageStyle;
  final TextStyle? valueStyle;
  final TextStyle? descriptionStyle;
  final List<Color>? gradientColors;

  const GlassyBubble({
    super.key,
    required this.percentage,
    required this.description,
    required this.radius,
    this.fontFamily = 'Anaktoria',
    this.percentageStyle,
    this.valueStyle,
    this.descriptionStyle,
    this.gradientColors,
  });

  @override
  State<GlassyBubble> createState() => _GlassyBubbleState();
}

class _GlassyBubbleState extends State<GlassyBubble> {
  bool _isLongPressed = false;

  double _resolveBubbleRadius() {
    final numericPercentage = double.tryParse(
      widget.percentage.replaceAll(RegExp(r'[^0-9.]'), ''),
    );
    if (numericPercentage == null) return widget.radius;

    const minRadius = 2.2;
    const maxRadius = 6.2;
    final clamped = numericPercentage.clamp(10, 100).toDouble();
    return minRadius + ((maxRadius - minRadius) * (clamped / 100));
  }

  @override
  Widget build(BuildContext context) {
    final radius = _resolveBubbleRadius();
    final defaultGradientColors = [
      const Color(0xFF1B1326),
      const Color(0xFF352A39),
      const Color(0xFF8A6875),
      const Color(0xFFD0A897),
      const Color(0xFFFDEFF3),
    ];

    return GestureDetector(
      onLongPressStart: (_) => setState(() => _isLongPressed = true),
      onLongPressEnd: (_) => setState(() => _isLongPressed = false),
      onLongPressCancel: () => setState(() => _isLongPressed = false),
      child: AnimatedScale(
        scale: _isLongPressed ? 1.16 : 1.0,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        child: Container(
          width: radius * 2.rem,
          height: radius * 2.rem,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 4.5, sigmaY: 4.5),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          center: Alignment.center,
                          radius: 1.0,
                          colors: widget.gradientColors ?? defaultGradientColors,
                          stops: const [0.0, 0.36, 0.62, 0.84, 1.0],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          center: const Alignment(-0.12, -0.2),
                          radius: 1.05,
                          colors: [
                            Colors.transparent,
                            const Color(0xFFCCB8B4).withOpacity(0.22),
                            const Color(0xFFEEE4E9).withOpacity(0.54),
                            const Color(0xFFF9F7FC).withOpacity(0.7),
                          ],
                          stops: const [0.0, 0.5, 0.78, 1.0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(radius * 0.2.rem),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 220),
                    switchInCurve: Curves.easeOutCubic,
                    switchOutCurve: Curves.easeInCubic,
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: ScaleTransition(scale: animation, child: child),
                      );
                    },
                    child: _isLongPressed
                        ? Text(
                            _bubbleSingleCapitalizedWord(widget.description),
                            key: const ValueKey('description'),
                            style: widget.descriptionStyle ??
                                TextStyle(
                                  fontFamily: widget.fontFamily,
                                  color: Colors.white,
                                  fontSize: radius * 0.2.rem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1,
                                ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        : RichText(
                            key: const ValueKey('percentage'),
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '%',
                                  style: widget.percentageStyle ??
                                      TextStyle(
                                        fontFamily: widget.fontFamily,
                                        color: Colors.white,
                                        fontSize: radius * 0.35.rem,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                TextSpan(
                                  text: widget.percentage,
                                  style: widget.valueStyle ??
                                      TextStyle(
                                        fontFamily: widget.fontFamily,
                                        color: Colors.white,
                                        fontSize: radius * 0.6.rem,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
