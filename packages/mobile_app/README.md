# daily_budget_planner

<!-- could you analyse architectural structure, architectural and code patterns which is used to build @mobile_app and write it in README. Write it principles, which can be used to:
- create new application with same infrastructure and architecutre
- maintain and develop existing app.

Note: these principles should be easy to understand and easy to use for human and ai. If needed - devided it to two sections. - for AI and for Human.
 -->

# mobile_app Architecture and Development Guide

This document outlines the architectural structure, design patterns, and best practices used in the `mobile_app` project. It serves as a guide for creating new applications with the same infrastructure and architecture, as well as for maintaining and developing the existing app.

## Architectural Overview

The `mobile_app` project follows a modular, layered architecture with a focus on separation of concerns, maintainability, and scalability. Key components include:

1. **Modular Package Structure**

   - Core app logic in `packages/mobile_app`
   - Localization handled separately in `packages/ui_locale`

2. **Data Layer**

   - Models (`data_models`)
   - Local API (`data_local_api`)
   - Services (`data_services`)

3. **State Management**

   - Notifiers (`data_states`)

4. **UI Layer**

   - Root UI components (`ui_root`)
   - Reusable UI components (likely in a separate UI kit)

5. **Core Utilities**

   - Extensions and helpers (`core`)

6. **Routing**

   - Centralized routing logic

7. **Analytics**
   - Firebase integration for analytics and crash reporting

## Principles for Human Developers

1. **Modular Architecture**

   - Organize code into logical packages and modules
   - Use `common_imports.dart` for shared imports across the project

2. **State Management**

   - Implement state management using notifiers (e.g., `AppSettingsNotifier`)
   - Use immutable state models with `freezed`

3. **Dependency Injection**

   - Utilize `provider` for dependency injection and state management

4. **Code Generation**

   - Use `freezed` for immutable models and `json_serializable` for JSON parsing
   - Employ `build_runner` for code generation tasks

5. **Localization**

   - Implement multi-language support using the `ui_locale` package
   - Use `S.of(context)` for accessing localized strings

6. **UI Development**

   - Create reusable widgets and follow a consistent design system
   - Implement responsive layouts using `LayoutBuilder` or similar approaches

7. **Routing**

   - Centralize routing logic for easier navigation management

8. **Error Handling and Logging**

   - Implement consistent error handling across the app
   - Use analytics for logging and crash reporting

9. **Testing**

   - Write unit tests for business logic and widget tests for UI components

10. **Code Style and Linting**
    - Follow the rules defined in `analysis_options.yaml`
    - Use consistent naming conventions and code formatting

## Principles for AI-Assisted Development

1. **Code Structure Adherence**

   - Generate code that fits into the existing package and folder structure
   - Respect the separation of concerns between data, state, and UI layers

2. **State Management Consistency**

   - When creating new features, use notifier-based state management consistent with `AppSettingsNotifier`
   - Ensure state models are immutable and use `freezed` for code generation

3. **Localization Integration**

   - Generate localization keys in the `ui_locale` package when adding new strings
   - Use `S.of(context)` for accessing localized strings in generated UI code

4. **Model and API Generation**

   - When creating new data models, use `freezed` and `json_serializable` annotations
   - Generate corresponding local API methods in the appropriate `*_local_api.dart` files

5. **UI Component Creation**

   - Generate reusable widgets that fit into the existing UI architecture
   - Ensure generated UI code is responsive and follows the app's design system

6. **Routing Updates**

   - When adding new screens, update the central routing logic accordingly

7. **Analytics Integration**

   - Include appropriate analytics events in generated code, especially for new user interactions

8. **Error Handling**

   - Implement try-catch blocks and error reporting in generated asynchronous code

9. **Testing Scaffolding**

   - Generate test files and basic test cases for new components and logic

10. **Documentation**
    - Generate inline documentation and update README files when creating new modules or significant features

By following these principles, both human developers and AI assistants can maintain consistency and quality in the `mobile_app` project, ensuring it remains scalable, maintainable, and aligned with best practices in Flutter development.
