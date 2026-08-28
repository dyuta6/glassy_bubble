# Glassy Bubble 🫧

A stunning, interactive glassmorphic (frosted glass) bubble widget for Flutter. It features dynamic radial gradients, auto-scaling sizes based on percentage values, and smooth animations when interacted with.

## Features

* ✨ **Glassmorphism:** Elegant blur and frosted glass overlays using `ImageFilter`.
* 🎨 **Custom Gradients:** Easy customization of the bubble gradients to fit your theme.
* 🔍 **Auto-Scaling:** Automatically adjusts its radius representation based on the percentage value provided.
* 👆 **Interactive Animations:** Shrinks/grows smoothly during long-press interactions, revealing detailed descriptions.

---

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  glassy_bubble:
    git:
      url: https://github.com/dyuta/glassy_bubble.git
      ref: main
```

*(Note: Once published to pub.dev, you can use `glassy_bubble: ^0.0.1`)*

---

## Usage

Here is a quick example:

```dart
import 'package:flutter/material.dart';
import 'package:glassy_bubble/glassy_bubble.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF0F0C1B),
        body: Center(
          child: GlassyBubble(
            percentage: '85',
            description: 'UI Design',
            radius: 3.5, // Base multiplier for sizing
          ),
        ),
      ),
    ),
  );
}
```

### Custom Styling & Gradients

```dart
GlassyBubble(
  percentage: '92',
  description: 'Flutter Power',
  radius: 3.0,
  gradientColors: [
    Color(0xFF0D1B2A),
    Color(0xFF1B263B),
    Color(0xFF415A77),
    Color(0xFF778DA9),
    Color(0xFFE0E1DD),
  ],
  percentageStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  descriptionStyle: TextStyle(color: Colors.cyan),
)
```

---

## Customization Options

| Parameter | Type | Description |
|---|---|---|
| `percentage` | `String` | The percentage value to show inside the bubble (e.g. `'85'`). |
| `description` | `String` | The description revealed upon long press (e.g. `'Flutter'`). |
| `radius` | `double` | The base radius multiplier (scaled by `rem`). |
| `fontFamily` | `String?` | Optional custom font family (Defaults to `'Anaktoria'`). |
| `percentageStyle` | `TextStyle?` | Text style for the percentage symbol. |
| `valueStyle` | `TextStyle?` | Text style for the numeric percentage value. |
| `descriptionStyle` | `TextStyle?` | Text style for the description shown on long press. |
| `gradientColors` | `List<Color>?` | Custom colors for the radial gradient background. |

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
