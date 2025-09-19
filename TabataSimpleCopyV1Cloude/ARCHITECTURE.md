# 📁 Project Architecture & File Organization

## 🎯 Overview
This document explains the file organization strategy for the Tabata app, designed to scale with multiple features while maintaining clarity and maintainability.

## 📂 Folder Structure

```
TabataSimpleCopyV1Cloude/
├── 📱 App/
│   ├── TabataSimpleCopyV1CloudeApp.swift    # App entry point
│   └── ContentView.swift                    # Root view
│
├── 🎨 Components/                           # Reusable UI components
│   └── button/
│       └── ImageButton.swift               # Custom button component
│
├── ⚡ Features/                            # Feature-based organization
│   ├── Quote/                              # Quote functionality
│   │   ├── Models/
│   │   │   └── Quote.swift                 # Data models
│   │   ├── Services/
│   │   │   ├── QuoteClient.swift           # API client (network calls)
│   │   │   └── QuoteClientTest.swift       # Test utilities
│   │   ├── ViewModels/
│   │   │   └── QuoteViewModel.swift        # Business logic & state management
│   │   └── Views/
│   │       └── QuoteSection.swift          # UI components
│   │
│   ├── Timer/                              # Timer functionality (future)
│   │   ├── Models/
│   │   ├── Services/
│   │   ├── ViewModels/
│   │   └── Views/
│   │
│   └── Workout/                            # Workout functionality
│       ├── Models/
│       ├── Services/
│       ├── ViewModels/
│       └── Views/
│           ├── Main.swift                  # Main workout view
│           └── Footer.swift                # Control buttons
│
├── 🔧 Shared/                              # Shared utilities
│   ├── Models/                             # Common data models
│   ├── Services/                           # Common services
│   ├── Extensions/                         # Swift extensions
│   └── Utils/                              # Utility functions
│
└── 🎨 Assets.xcassets/                     # App assets
```

## 🏗️ Architecture Principles

### 1. **Feature-Based Organization**
- Each feature has its own folder with complete functionality
- Easy to find all related files for a specific feature
- Clear separation of concerns

### 2. **MVVM Pattern**
- **Models**: Data structures and business logic
- **Views**: SwiftUI UI components
- **ViewModels**: State management and business logic (the real "services")
- **Services**: API clients for network communication (thin wrappers)

### 3. **Scalability**
- Easy to add new features without cluttering existing code
- Each feature is self-contained
- Shared code goes in the `Shared/` folder

## 📋 Naming Conventions

### Files
- **Models**: `Quote.swift`, `Workout.swift`
- **API Clients**: `QuoteClient.swift`, `TimerClient.swift` (for network communication)
- **ViewModels**: `QuoteViewModel.swift`, `TimerViewModel.swift` (contains business logic)
- **Views**: `QuoteSection.swift`, `TimerView.swift`

### Class Naming
- **Client**: For API communication only (e.g., `QuoteClient`)
- **Service**: For business logic and orchestration (e.g., `QuoteViewModel` - the real service)
- **Manager**: For complex state management across features
- **Helper**: For utility functions

### Folders
- **Features**: Use PascalCase (e.g., `Quote`, `Timer`, `Workout`)
- **Subfolders**: Use PascalCase (e.g., `Models`, `Services`, `ViewModels`, `Views`)

## 🚀 Adding New Features

When adding a new feature (e.g., "Settings"):

1. **Create feature folder**:
   ```
   Features/Settings/
   ├── Models/
   ├── Services/
   ├── ViewModels/
   └── Views/
   ```

2. **Add files to appropriate subfolders**:
   - `SettingsModel.swift` → `Models/`
   - `SettingsService.swift` → `Services/`
   - `SettingsViewModel.swift` → `ViewModels/`
   - `SettingsView.swift` → `Views/`

3. **Use shared utilities** when needed:
   - Common models → `Shared/Models/`
   - Common services → `Shared/Services/`
   - Extensions → `Shared/Extensions/`

## 🔄 Benefits of This Structure

### ✅ **Clarity**
- Easy to find files related to specific functionality
- Clear separation between features
- Intuitive folder names

### ✅ **Maintainability**
- Changes to one feature don't affect others
- Easy to refactor individual features
- Clear dependencies

### ✅ **Scalability**
- Add new features without restructuring existing code
- Team members can work on different features independently
- Easy to remove features if needed

### ✅ **Testing**
- Each feature can be tested independently
- Clear structure for unit tests
- Easy to mock dependencies

## 🎯 Future Features Structure

As you add more features, your structure might look like:

```
Features/
├── Quote/           # ✅ Current
├── Timer/           # 🔄 Next
├── Workout/         # 🔄 Next
├── Settings/        # 🔮 Future
├── Statistics/      # 🔮 Future
├── Presets/         # 🔮 Future
└── Profile/         # 🔮 Future
```

Each feature will follow the same `Models/Services/ViewModels/Views` pattern, keeping your codebase organized and maintainable as it grows! 🚀
