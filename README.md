# RPI5 Car Radio Interface

A Flutter application providing a multimedia car radio interface for Raspberry Pi 5.

## Features

- **Main Menu**: Three main buttons for quick access to:
  - Spotify (Music streaming)
  - YouTube (Video streaming)
  - Google Maps (Navigation)
  
- **Bottom Navigation Bar**: Displays "Twoje Centrum Multimedialne" (Your Multimedia Center in Polish)

- **Responsive Layout**: Adapts to different screen sizes for optimal viewing

- **Future-Ready**: Button handlers are implemented with placeholders for future integrations

## Project Structure

```
rpi5-car/
├── lib/
│   └── main.dart          # Main application file
├── test/
│   └── widget_test.dart   # Widget tests
├── linux/                 # Linux platform-specific files
│   ├── CMakeLists.txt
│   ├── main.cc
│   ├── my_application.h
│   └── my_application.cc
├── pubspec.yaml           # Flutter dependencies
└── README.md              # This file
```

## Requirements

- Flutter SDK (>=3.0.0)
- Raspberry Pi 5 with Linux
- GTK3 development libraries (for Linux desktop)

## Installation on Raspberry Pi 5

1. **Install Flutter on Raspberry Pi**:
   ```bash
   # Install dependencies
   sudo apt update
   sudo apt install -y curl git unzip xz-utils zip libglu1-mesa
   
   # Install Flutter
   git clone https://github.com/flutter/flutter.git -b stable
   export PATH="$PATH:`pwd`/flutter/bin"
   
   # Add to PATH permanently
   echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc
   source ~/.bashrc
   ```

2. **Install Linux development tools**:
   ```bash
   sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev
   ```

3. **Clone and run the project**:
   ```bash
   cd /path/to/rpi5-car
   flutter pub get
   flutter run -d linux
   ```

## Running Tests

```bash
flutter test
```

## Building for Production

```bash
flutter build linux --release
```

The built application will be available in `build/linux/arm64/release/bundle/`.

## Future Enhancements

The button handlers are currently placeholders. Future development will include:
- Spotify integration for music playback
- YouTube integration for video streaming
- Google Maps integration for navigation
- Audio configuration integration with HDMI output (see `audio_config.md`)

## License

This project is part of the RPI5 Car multimedia system.
