# Riverpod Generator Example

A Flutter project demonstrating the implementation of Riverpod state management with code generation. This project serves as a practical example of building a modern Flutter application using the latest best practices and popular packages.

## Features

- **Riverpod with Code Generation** - Utilizing `riverpod_generator` for efficient state management
- **Auto Route** - Type-safe routing using `auto_route`
- **API Integration** - REST API handling with `dio` and pretty logging
- **Local Storage** - Data persistence using `shared_preferences`
- **Image Caching** - Efficient image loading with `cached_network_image`
- **Pull to Refresh** - Smooth refresh functionality with `easy_refresh`
- **Rating System** - Interactive rating UI with `flutter_rating_bar`
- **Carousel** - Image slideshow using `carousel_slider`
- **Slidable Actions** - Swipeable list items with `flutter_slidable`

## Getting Started

### Prerequisites

- Flutter SDK (^3.4.4)
- Dart SDK (^3.4.4)

### Installation

1. Clone the repository:
   ```bash
   git clone [repository-url]
   cd riverpod_generator_example
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run code generation:
   ```bash
   flutter pub run build_runner build
   ```

### Running the App

```bash
flutter run
```

## Project Structure

- `lib/` - Contains the main source code
  - `models/` - Data models and DTOs
  - `providers/` - Riverpod providers and state management
  - `screens/` - UI screens and widgets
  - `services/` - API services and business logic
  - `utils/` - Utility functions and constants

## Dependencies

Key packages used in this project:

- `flutter_riverpod: ^2.5.1` - State management
- `riverpod_annotation: ^2.3.5` - Riverpod code generation
- `auto_route: ^9.2.2` - Navigation
- `dio: ^5.7.0` - HTTP client
- `shared_preferences: ^2.3.2` - Local storage
- `cached_network_image: ^3.4.1` - Image caching
- And more (see `pubspec.yaml` for complete list)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
