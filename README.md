# Waddle App

A gamified health and fitness mobile app featuring a customizable virtual pet (penguin), social engagement, and comprehensive health tracking.

## Features

- 🐧 **Virtual Pet System**: Customizable penguin companion
- 📊 **Health Tracking**: Comprehensive fitness and nutrition logging
- 🎮 **Gamification**: Missions, streaks, and rewards
- 👥 **Social Features**: Community feed and friend interactions
- 📅 **Progress Visualization**: Calendar views and analytics
- 📱 **Modern UI**: Card-based design with intuitive navigation

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code
- Firebase project (for backend services)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd waddle
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Authentication, Firestore, Storage, and Analytics
   - Install FlutterFire CLI: `dart pub global activate flutterfire_cli`
   - Configure Firebase: `flutterfire configure`
   - This will generate the proper `firebase_options.dart` file

4. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── app/                    # App-level configuration
├── core/                   # Core utilities and constants
├── data/                   # Data layer (models, repositories, datasources)
├── domain/                 # Domain layer (entities, use cases)
├── presentation/           # UI layer (pages, widgets, navigation)
├── services/              # Service layer
└── state/                 # State management
```

## Dependencies

### State Management
- **Riverpod**: Modern state management solution
- **Provider**: Legacy state management (for compatibility)

### Backend & Storage
- **Firebase**: Authentication, Firestore, Storage, Analytics
- **Hive**: Local database for offline support
- **SharedPreferences**: Simple key-value storage

### UI & UX
- **Material Design 3**: Modern UI components
- **Flutter SVG**: Vector graphics support
- **Cached Network Image**: Image caching
- **Shimmer**: Loading animations
- **Lottie**: Advanced animations

### Charts & Visualization
- **FL Chart**: Data visualization
- **Table Calendar**: Calendar widget

### Camera & ML
- **Camera**: Camera functionality
- **Image Picker**: Image selection
- **Google ML Kit**: Food recognition

### Navigation
- **Go Router**: Declarative routing

## Development

### Code Generation

The project uses code generation for models and repositories. Run the following commands:

```bash
# Generate freezed models and JSON serialization
flutter packages pub run build_runner build

# Watch for changes and regenerate automatically
flutter packages pub run build_runner watch
```

### Testing

```bash
# Run unit tests
flutter test

# Run widget tests
flutter test test/widget_test.dart

# Run integration tests
flutter test integration_test/
```

## Firebase Setup

1. **Authentication**
   - Enable Email/Password authentication
   - Configure OAuth providers (Google, Apple) if needed

2. **Firestore Database**
   - Set up security rules
   - Create indexes for queries

3. **Storage**
   - Configure storage rules for image uploads

4. **Analytics**
   - Enable Google Analytics for Firebase

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, email support@waddle.app or create an issue in the repository. 