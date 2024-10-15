# Analytics Module

## Overview

The Analytics Module is a robust, flexible, and extensible system for handling analytics and crash reporting in Flutter applications. It provides a clean separation between analytics and crashlytics functionalities, allowing for easy integration of different analytics and crash reporting services.

## Key Components

1. **AnalyticsManager**: The central hub for all analytics and crashlytics operations.
2. **AnalyticsService**: Interface for analytics operations.
3. **CrashlyticsService**: Interface for crash reporting operations.
4. **AnalyticsEvent**: A standardized structure for analytics events.
5. **FirebaseAnalyticsPlugin**: Implementation of AnalyticsService using Firebase Analytics.
6. **FirebaseCrashlyticsPlugin**: Implementation of CrashlyticsService using Firebase Crashlytics.
7. **FirebaseInitializer**: Handles initialization of Firebase services.

## Architecture

The module follows a plugin-based architecture, allowing for easy swapping or addition of different analytics and crashlytics providers. The `AnalyticsManager` acts as a facade, providing a unified interface for both analytics and crashlytics operations.

### Directory Structure

```
analytics/
├── firebase/
│ ├── firebase_analytics_plugin.dart
│ ├── firebase_crashlytics_plugin.dart
│ └── firebase_initializer.dart
├── interfaces/
│ ├── analytics_service.dart
│ └── crashlytics_service.dart
├── models/
│ ├── analytics_event.dart
│ └── analytics_events.dart
├── utils/
│ └── error_to_string.dart
└── analytics_manager.dart
```

## Usage

### Initialization

```dart
final firebaseInitializer = FirebaseInitializer(firebaseOptions: firebaseOptions);
final analyticsManager = AnalyticsManager()
..analyticsService = FirebaseAnalyticsPlugin()
..crashlyticsService = FirebaseCrashlyticsPlugin()
..firebaseInitializer = firebaseInitializer;
await analyticsManager.onLoad();
```

### Logging Events

```dart
final event = AnalyticsEvent(name: 'button_click', parameters: {'button_name': 'submit'});
await analyticsManager.logEvent(event);
```

### Recording Errors

```dart
try {
// Some operation that might throw an error
} catch (e, stackTrace) {
await analyticsManager.recordError(e, stackTrace);
}
```

## Extending the Module

### Adding a New Analytics Service

1. Create a new class implementing `AnalyticsService`.
2. Implement all required methods.
3. Update `AnalyticsManager` to use the new service.

### Adding a New Crashlytics Service

1. Create a new class implementing `CrashlyticsService`.
2. Implement all required methods.
3. Update `AnalyticsManager` to use the new service.

## Best Practices

1. Use predefined events from `AnalyticsEvents` class when possible for consistency.
2. Always initialize the `AnalyticsManager` before using it.
3. Handle errors gracefully and use `recordError` method to log them.
4. Use meaningful names for custom events and parameters.

## Testing

The module includes a `NoopAnalyticsService` and `NoopCrashlyticsService` for testing purposes. These can be used in test environments to prevent actual logging or crash reporting.

## Future Improvements

1. Implement offline event queueing and batch uploading.
2. Add more analytics and crashlytics providers (e.g., Amplitude, Sentry).
3. Implement user opt-in/opt-out functionality for analytics and crash reporting.
4. Add more comprehensive error classification system.
5. Implement automatic screen tracking.

## Contributing

Contributions to improve the Analytics Module are welcome. Please ensure that your code adheres to the existing style and includes appropriate tests and documentation.

## License

[Insert appropriate license information here]
