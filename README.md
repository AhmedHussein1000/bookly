# Bookly

Bookly is a Flutter application designed to provide a seamless experience for browsing and searching books. It leverages modern Flutter architecture patterns, including Bloc for state management, and integrates with APIs to fetch and display book data.

## 🚀 Features
- **Search Books**: Search for books by category or query.
- **Book Details**: View detailed information about each book.
- **Caching**: Utilizes Hive for local caching to improve performance.
- **Pagination**: Implements pagination to efficiently load and display large datasets.
- **Theming**: Supports  dark themes for better user experience.
- **Responsive Design**: Adapts to different screen sizes.
- **Clean Architecture**: Follows Clean Architecture principles for maintainability. 
## 📱 Demo Video
Watch the demo video to see Bookly in action:
[![Bookly Demo](https://img.youtube.com/vi/167-tRWx7tUifLYhauVRQioz54UE239lM/0.jpg)](https://drive.google.com/file/d/167-tRWx7tUifLYhauVRQioz54UE239lM/view?usp=drive_link)

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/bookly.git
   ```
 ## 📂 Project Structure

```bash
bookly/                # iOS-specific files
├── lib/                       # Main application code
│   ├── core/                  # Core utilities and helpers
│   │   ├── cache/             # Caching logic (e.g., Hive)
│   │   ├── di/                # Dependency injection setup
│   │   ├── errors/            # Error handling
│   │   ├── functions/         # Helper functions
│   │   ├── helpers/           # General helpers
│   │   ├── network/           # Network-related utilities
│   │   ├── routes/            # Application routing
│   │   ├── themes/            # Theme configurations
│   │   ├── usecase/           # Use case implementations
│   │   ├── utils/             # Utility functions
│   │   └── widgets/           # Reusable widgets
│   ├── features/              # Feature-specific code
│   │   ├── books/             # Books feature
│   │   │   ├── data/          # Data layer (repositories, models)
│   │   │   ├── domain/        # Domain layer (entities, use cases)
│   │   │   └── presentation/  # Presentation layer (UI, Bloc)
│   │   └── splash/            # Splash screen feature
│   ├── custom_bloc_observer.dart # Custom Bloc observer
│   └── main.dart              # Application entry point
              # Project README