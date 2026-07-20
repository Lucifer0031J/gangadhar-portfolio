# 🦾 Gangadhar Poosarla — Flutter Portfolio App

<div align="center">

```
  ██████╗  █████╗ ███╗   ██╗ ██████╗  █████╗ ██████╗ ██╗  ██╗ █████╗ ██████╗ 
 ██╔════╝ ██╔══██╗████╗  ██║██╔════╝ ██╔══██╗██╔══██╗██║  ██║██╔══██╗██╔══██╗
 ██║  ███╗███████║██╔██╗ ██║██║  ███╗███████║██║  ██║███████║███████║██████╔╝
 ██║   ██║██╔══██║██║╚██╗██║██║   ██║██╔══██║██║  ██║██╔══██║██╔══██║██╔══██╗
 ╚██████╔╝██║  ██║██║ ╚████║╚██████╔╝██║  ██║██████╔╝██║  ██║██║  ██║██║  ██║
  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
```

**Application Security Engineer · Bug Bounty Hunter · Researcher**

![Flutter](https://img.shields.io/badge/Flutter-3.27.4-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20Web%20%7C%20Linux%20%7C%20Windows-blueviolet?style=for-the-badge)
![License](https://img.shields.io/badge/License-Personal-red?style=for-the-badge)

</div>

---

## 📖 Table of Contents

- [About This App](#-about-this-app)
- [Features](#-features)
- [App Architecture](#-app-architecture)
- [Project Structure](#-project-structure)
- [Design System](#-design-system)
- [Easter Eggs](#-easter-eggs--tony-stark-personality)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
  - [Method 1: APT Repository (Recommended)](#method-1--apt-repository-recommended-for-debianubuntukali)
  - [Method 2: Direct Tarball Download](#method-2--direct-tarball-download)
  - [Method 3: Git Clone](#method-3--git-clone)
  - [Method 4: FVM (Flutter Version Manager)](#method-4--fvm-flutter-version-manager)
- [Running the App](#-running-the-app)
  - [Android](#android-emulator--physical-device)
  - [Web Browser](#web-browser)
  - [Linux Desktop](#linux-desktop)
  - [Windows](#windows)
- [Troubleshooting](#-troubleshooting)
- [Customization Guide](#-customization-guide)
- [Dependencies](#-dependencies)
- [Sections Overview](#-sections-overview)

---

## 🎯 About This App

This is a **fully custom, cross-platform portfolio application** built entirely in Flutter for **Gangadhar Poosarla**, an Application Security Engineer based in Visakhapatnam, India.

The app is designed to be:
- ✅ **Cross-platform** — runs on Android, Web, Linux, Windows, macOS
- ✅ **Fully responsive** — adapts layout for phone, tablet, and desktop
- ✅ **Heavily animated** — smooth entrance effects, hover glows, typewriter text
- ✅ **Personality-driven** — Tony Stark / Iron Man easter eggs baked in
- ✅ **Dark/Light mode** — toggleable at runtime with no restart needed
- ✅ **100% hand-coded** — no templates, no drag-and-drop, fully custom

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🌑 **Dark / Light Mode** | Toggle between themes with a single tap — persists for the session |
| 📱 **Responsive Layouts** | Phone gets bottom nav + drawer; tablet/desktop gets full top navbar |
| 🔠 **Typewriter Animations** | Hero section cycles through roles with animated typing effect |
| 🌀 **Rotating Avatar Ring** | Arc-reactor-style animated rings around the initials avatar |
| 📊 **Animated Skill Bars** | Progress bars animate from 0% when the section comes into view |
| 📅 **Expandable Timeline** | Tap any experience card to expand full highlights list |
| 🃏 **Glowing Project Cards** | Cards glow on hover, long-press reveals Tony Stark commentary |
| 📋 **One-Tap Copy** | Tap COPY on email/phone in the contact section to copy to clipboard |
| 💻 **Interactive Terminal** | Animated terminal widget in the contact section |
| 🎊 **Easter Eggs** | Three hidden Iron Man surprises scattered through the app |
| ⬆️ **Back-to-Top FAB** | Floating button appears after scrolling, jumps back to hero |
| 🔗 **Active Section Tracking** | Navbar highlights which section you're currently viewing |

---

## 🏗 App Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        main.dart                            │
│          (Entry point, system UI config, orientation)        │
└──────────────────────────┬──────────────────────────────────┘
                           │
┌──────────────────────────▼──────────────────────────────────┐
│                    PortfolioApp                              │
│         (MaterialApp, theme management, route root)          │
└──────────────────────────┬──────────────────────────────────┘
                           │
┌──────────────────────────▼──────────────────────────────────┐
│                     HomeScreen                               │
│   ┌─────────────┐  ┌──────────────┐  ┌───────────────────┐ │
│   │ Desktop     │  │  Mobile      │  │  Navigation Logic │ │
│   │ AppBar      │  │  TopBar      │  │  - Section keys   │ │
│   │ (nav items) │  │  BottomNav   │  │  - Scroll track   │ │
│   └─────────────┘  │  Drawer      │  │  - FAB toggle     │ │
│                    └──────────────┘  └───────────────────┘ │
└──────────────────────────┬──────────────────────────────────┘
                           │ SingleChildScrollView
        ┌──────────────────┼─────────────────────────┐
        ▼                  ▼                         ▼
   HeroSection      AboutSection             SkillsSection
   ExperienceSection  ProjectsSection    CertEducationSection
                             ContactSection
                                  │
                    ┌─────────────▼────────────┐
                    │       resume_data.dart    │
                    │  (Single source of truth) │
                    └───────────────────────────┘
```

**Key Design Decisions:**
- `resume_data.dart` is the **single source of truth** — all content lives there. Update it once, the whole app updates.
- `HomeScreen` manages navigation state (current section, scroll position) and passes the theme toggle callback down.
- Each section is a **self-contained StatefulWidget** with its own animations — no shared animation state.
- The `common_widgets.dart` library provides reusable primitives (`GlowCard`, `SectionHeader`, `AnimatedSkillBar`, etc.) used across all sections.

---

## 📁 Project Structure

```
gangadhar_portfolio/
│
├── lib/
│   ├── main.dart                        # Entry point
│   │
│   ├── app/
│   │   └── portfolio_app.dart           # Root MaterialApp + theme toggle
│   │
│   ├── theme/
│   │   └── app_theme.dart               # Iron Man color palette + TextTheme
│   │
│   ├── data/
│   │   └── resume_data.dart             # ★ ALL content (edit this to update)
│   │
│   ├── screens/
│   │   └── home_screen.dart             # Navigation, AppBar, BottomNav, Drawer
│   │
│   ├── sections/
│   │   ├── hero_section.dart            # Hero banner, avatar, typewriter
│   │   ├── about_section.dart           # Bio, info card, stats grid
│   │   ├── skills_section.dart          # Tabbed categories, animated bars
│   │   ├── experience_section.dart      # Expandable timeline cards
│   │   ├── projects_section.dart        # Glow cards with easter eggs
│   │   ├── cert_education_section.dart  # Certifications, education, copyright
│   │   └── contact_section.dart         # Contact cards, terminal, footer
│   │
│   └── widgets/
│       └── common_widgets.dart          # GlowCard, SectionHeader, SkillBar, etc.
│
├── assets/
│   ├── images/                          # Add profile.jpg here
│   └── animations/                      # Add Lottie .json files here
│
├── test/
│   └── widget_test.dart
│
├── pubspec.yaml                          # Dependencies
├── setup.sh                             # Automated install + run script
└── README.md                            # This file
```

---

## 🎨 Design System

### Color Palette — Iron Man Inspired

| Name | Hex | Usage |
|------|-----|-------|
| **Arc Reactor Blue** | `#00D4FF` | Primary accent, borders, highlights |
| **Iron Gold** | `#FFB300` | Secondary accent, certifications |
| **Cyber Green** | `#00FF94` | Success states, security items |
| **Red Alert** | `#FF3B3B` | Critical findings, danger indicators |
| **Deep Space Navy** | `#050A14` | Dark mode background |
| **Dark Surface** | `#0D1B2A` | Card backgrounds |
| **Dark Card** | `#112233` | Elevated surfaces |

### Typography

| Font | Weight | Usage |
|------|--------|-------|
| **Rajdhani** | 700 Bold | Section headers, names, stats |
| **Rajdhani** | 600 SemiBold | Subtitles, labels, nav items |
| **Inter** | 400 Regular | Body text, descriptions |
| **Source Code Pro** | 400 | Terminal widget in contact section |

All fonts are loaded via **Google Fonts** at runtime — no local font files needed.

### Responsive Breakpoints

| Screen Width | Layout |
|-------------|--------|
| `< 900px` | Mobile — `BottomNavigationBar` (5 items) + hamburger icon + side `Drawer` |
| `≥ 900px` | Desktop — persistent top `AppBar` with all 7 nav items visible |
| `< 700px` | Projects/Skills use single-column grid |
| `≥ 700px` | Projects/Skills use 2-column grid |

---

## 🦾 Easter Eggs — Tony Stark Personality

Three hidden interactions reveal Iron Man quotes throughout the app:

### Easter Egg 1 — Hero Avatar (⭐ Main one)
- **Where:** Hero section — the circular `GP` avatar
- **How:** Tap the avatar **5 times** in quick succession
- **What happens:** A golden banner slides up from the bottom with a randomized Tony Stark quote
- **Example:** *"I am Iron Man. But in this universe, I secure the suit's OS. 🔐"*

### Easter Egg 2 — Project Cards
- **Where:** Any of the 4 project cards in the Projects section
- **How:** **Long press** any project card
- **What happens:** A dark overlay appears with Tony's commentary on that specific project
- **Example (DKMS project):** *"JARVIS would be jealous of this encryption scheme."*
- **Dismiss:** Tap the `DISMISS` button to close

### Easter Egg 3 — Terminal Widget
- **Where:** Contact section — the terminal widget on the right
- **How:** Tap the terminal **7 times**
- **What happens:** `"I am Iron Man." 🦾` appears inside the terminal
- **Bonus:** A pulsing hint text at the bottom of the footer reads `[ TAP TERMINAL 7× FOR A HIDDEN MESSAGE ]`

---

## 🛠 Prerequisites

Before running the app, you need:

### Required
- **Flutter SDK** 3.27.4 or later ([install guide below](#-installation))
- **Dart SDK** 3.x (bundled with Flutter)
- **Git** (`sudo apt install git`)

### Per Platform
| Platform | Additional Requirement |
|----------|----------------------|
| Android | Android SDK + emulator or physical device with USB debugging |
| Web | Chrome browser or any modern browser |
| Linux | `clang`, `cmake`, `ninja-build`, `pkg-config`, `libgtk-3-dev` |
| Windows | Visual Studio 2022 with "Desktop development with C++" workload |

---

## 📦 Installation

> **Note:** The Flutter SDK is ~700MB. Install method depends on your network speed.

---

### Method 1 — APT Repository *(Recommended for Debian/Ubuntu/Kali)*

This uses the official Flutter apt repository. **Run these in your terminal with sudo access:**

```bash
# Step 1: Install prerequisites
sudo apt-get update
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa gnupg

# Step 2: Add Flutter's GPG key
curl -fsSL https://storage.googleapis.com/flutter_infra_release/flutter-apt/pubkey.gpg \
  | sudo gpg --dearmor -o /usr/share/keyrings/flutter-archive-keyring.gpg

# Step 3: Add the Flutter apt repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/flutter-archive-keyring.gpg] \
  https://storage.googleapis.com/flutter_infra_release/flutter-apt stable main" \
  | sudo tee /etc/apt/sources.list.d/flutter.list

# Step 4: Install Flutter
sudo apt-get update
sudo apt-get install -y flutter

# Step 5: Verify installation
flutter --version
flutter doctor
```

---

### Method 2 — Direct Tarball Download

Best if you have a fast internet connection (needs ~700MB download):

```bash
# Download Flutter SDK (~700MB)
curl -L \
  "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.27.4-stable.tar.xz" \
  -o /tmp/flutter.tar.xz

# Extract to home directory
tar xf /tmp/flutter.tar.xz -C ~/

# Add Flutter to PATH permanently
echo 'export PATH="$HOME/flutter/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/flutter/bin:$PATH"' >> ~/.zshrc
source ~/.bashrc

# Verify
flutter --version
```

> 💡 **Tip:** If the download keeps failing due to slow network, use a VPN, mobile hotspot, or switch to Method 1 (APT) which downloads in smaller chunks.

---

### Method 3 — Git Clone

Useful on faster connections to GitHub:

```bash
# Clone Flutter (stable branch, no history)
git clone --depth=1 --branch stable \
  https://github.com/flutter/flutter.git \
  ~/flutter

# Add to PATH
echo 'export PATH="$HOME/flutter/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Pre-download Dart SDK and tool binaries
flutter precache

# Verify
flutter --version
```

---

### Method 4 — FVM (Flutter Version Manager)

Useful for managing multiple Flutter versions:

```bash
# Install FVM via pub
dart pub global activate fvm

# Install Flutter stable via FVM
fvm install stable
fvm use stable --force

# Add FVM to PATH
echo 'export PATH="$HOME/.pub-cache/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Use fvm flutter instead of flutter
fvm flutter --version
```

---

### After Installing Flutter — Get App Dependencies

```bash
cd ~/gangadhar_portfolio
flutter pub get
```

---

## 🚀 Running the App

### Android (Emulator / Physical Device)

```bash
# List available devices first
flutter devices

# Run on the first available Android device/emulator
cd ~/gangadhar_portfolio
flutter run

# Run on a specific device (use device ID from `flutter devices`)
flutter run -d emulator-5554
```

**Setting up Android Emulator (if you don't have one):**
```bash
# Install Android Studio first, then:
# Tools → Device Manager → Create Device → Run
# Or via command line:
flutter emulators --launch <emulator_id>
```

---

### Web Browser

No Android SDK needed — runs directly in a browser:

```bash
cd ~/gangadhar_portfolio

# Enable web support (first time only)
flutter config --enable-web

# Run in Chrome
flutter run -d chrome

# Run as local web server (access via http://localhost:8080)
flutter run -d web-server --web-port 8080

# Build production web bundle
flutter build web --release
# Files will be in build/web/ — deploy to any static host
```

> 🌐 **Web deployment:** After `flutter build web`, upload the `build/web/` folder to GitHub Pages, Netlify, Vercel, Firebase Hosting, etc.

---

### Linux Desktop

```bash
# Enable Linux desktop support (first time only)
sudo apt-get install -y clang cmake ninja-build pkg-config libgtk-3-dev
flutter config --enable-linux-desktop

# Run on Linux
cd ~/gangadhar_portfolio
flutter run -d linux

# Build standalone Linux executable
flutter build linux --release
# Binary will be at: build/linux/x64/release/bundle/gangadhar_portfolio
```

---

### Windows

```bash
# Enable Windows desktop support (first time only)
flutter config --enable-windows-desktop

# Run on Windows
flutter run -d windows

# Build standalone .exe
flutter build windows --release
# Installer at: build\windows\x64\runner\Release\
```

---

### The Setup Script (All-in-One)

A convenience script [`setup.sh`](setup.sh) tries all install methods automatically:

```bash
chmod +x ~/gangadhar_portfolio/setup.sh
~/gangadhar_portfolio/setup.sh
```

It will:
1. Check if Flutter is already installed
2. Try extracting from existing tarball at `/tmp/flutter.tar.xz`
3. Try `wget` download as fallback
4. Try `git clone` as final fallback
5. Add Flutter to `~/.bashrc` and `~/.zshrc` permanently
6. Run `flutter pub get` automatically
7. Show available devices and run instructions

---

## 🔧 Troubleshooting

### `flutter: command not found`
```bash
# Add Flutter to your current session's PATH
export PATH="$HOME/flutter/bin:$PATH"

# Make it permanent
echo 'export PATH="$HOME/flutter/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### `xz: Unexpected end of input` / `tar: Unexpected EOF`
The download was incomplete. Resume it:
```bash
# Resume interrupted download with -C flag
curl -L -C - \
  "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.27.4-stable.tar.xz" \
  -o /tmp/flutter.tar.xz

# Verify the file is ~731MB before extracting
ls -lh /tmp/flutter.tar.xz
```

### `flutter pub get` fails with package errors
```bash
# Clear pub cache and retry
flutter pub cache clean
flutter pub get

# If on a slow network, packages may timeout — retry
flutter pub get --verbose
```

### Linux: `Unable to find cmake` or `clang not found`
```bash
sudo apt-get install -y \
  clang cmake ninja-build pkg-config \
  libgtk-3-dev liblzma-dev libstdc++-12-dev
```

### Web: `SocketException: Failed to create server socket`
```bash
# Try a different port
flutter run -d web-server --web-port 3000
```

### `MissingPluginException` for url_launcher
```bash
# Hot restart doesn't work for native plugins — do a full restart
flutter run  # (not r for hot reload — press q then flutter run again)
```

### Android: No devices found
```bash
# Check if ADB sees your device
adb devices

# Enable USB debugging on phone:
# Settings → About Phone → tap Build Number 7× → Developer Options → USB Debugging ON

# Or start an emulator
flutter emulators
flutter emulators --launch <emulator_name>
```

---

## 🖊 Customization Guide

### Updating Your Resume Content

**All content lives in one file:** [`lib/data/resume_data.dart`](lib/data/resume_data.dart)

```dart
// Update your name, email, phone
static const String name = 'GANGADHAR POOSARLA';
static const String email = 'gangadharpoosarla8@gmail.com';

// Add a new skill
static const List<SkillCategory> skills = [
  SkillCategory(
    name: 'New Category',
    icon: '🔥',
    color: 0xFF00D4FF,
    items: [
      Skill('New Skill', 90),  // name, proficiency 0-100
    ],
  ),
  // ...
];

// Add a new project
static const List<Project> projects = [
  Project(
    title: 'My New Project',
    description: 'What it does...',
    tags: ['Tag1', 'Tag2'],
    icon: '🚀',
    color: 0xFF00FF94,
    starkComment: 'Tony\'s take on this project.',
  ),
];
```

### Adding a Profile Photo

1. Place your photo at `assets/images/profile.jpg`
2. Open [`lib/sections/hero_section.dart`](lib/sections/hero_section.dart)
3. Find the avatar `Container` with the `GP` text and replace with:

```dart
// Replace the Text('GP', ...) widget with:
ClipOval(
  child: Image.asset(
    'assets/images/profile.jpg',
    width: 170,
    height: 170,
    fit: BoxFit.cover,
  ),
),
```

### Changing the Color Theme

Open [`lib/theme/app_theme.dart`](lib/theme/app_theme.dart) and update any of the color constants:

```dart
static const Color arcReactor = Color(0xFF00D4FF);  // Change primary accent here
static const Color ironGold   = Color(0xFFFFB300);  // Change secondary accent here
```

### Adding More Easter Eggs

In [`lib/data/resume_data.dart`](lib/data/resume_data.dart), add to the `easterEggs` list:

```dart
static const List<String> easterEggs = [
  '"Your new quote here."',
  // ...
];
```

---

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `google_fonts` | ^6.2.1 | Rajdhani + Inter fonts loaded at runtime |
| `flutter_animate` | ^4.5.0 | Entrance animations, fade/slide effects |
| `animated_text_kit` | ^4.2.2 | Typewriter effect in hero section |
| `url_launcher` | ^6.3.0 | Opening LinkedIn, email links |
| `smooth_page_indicator` | ^1.1.0 | Page dots for carousels |
| `visibility_detector` | ^0.4.0+2 | Trigger animations when section scrolls into view |
| `percent_indicator` | ^4.2.3 | Circular/linear skill progress indicators |
| `shimmer` | ^3.0.0 | Loading skeleton effects |
| `confetti` | ^0.7.0 | Celebration particle effect |

---

## 📑 Sections Overview

### 1. Hero Section
- Animated rotating dashed arc-reactor ring around the initials avatar
- Pulsing arc reactor dot at the bottom of the avatar
- Background: subtle grid overlay + floating particles
- Animated typewriter cycling through 4 role titles
- Quick stat badges: `40+ Apps Secured`, `92% Closure Rate`, `30+ CVEs`, `15+ hrs/week saved`
- Primary CTA: **Download CV** / **Get In Touch**
- **Easter Egg:** Tap avatar 5× for Iron Man quote

### 2. About Section
- Summary bio pulled directly from resume
- "Built Different" personality card with offensive-meets-defensive framing
- Intel info card with email, phone, LinkedIn, location, role, education, cert
- 4-stat animated grid: apps secured, closure rate, bugs reported, vuln reopen reduction

### 3. Skills Section
- 4 tabbed categories: **Application Security**, **Offensive Security**, **Tooling**, **Programming**
- Each tab shows animated progress bars for all skills in that category
- Core Competency quick-access cards on the right (desktop) / below (mobile)
- Bars animate from 0% to final value every time the tab changes

### 4. Experience Section
- Vertical timeline with color-coded dots (cyan = active, gold = past)
- **Tap any card** to expand full bullet-point highlights
- `ACTIVE` badge on current roles
- Bug Bounty summary banner at the bottom

### 5. Projects Section
- 2-column grid on tablet/desktop, 1-column on mobile
- Cards glow on hover with matching project accent color
- Top accent bar gradient per card
- Tag chips (CyberTag) for tech stack
- **Long press** to see Tony Stark's commentary on the project

### 6. Credentials Section
- CTIGA certification card with acronym badge + issuer + date
- B.Tech education card with an inspirational quote
- Ethereum DNS copyright badge (L-139347/2023)

### 7. Contact Section
- 4 contact cards with one-tap clipboard copy for email/phone
- Interactive terminal widget with fake shell session output
- **Tap terminal 7×** for Iron Man easter egg
- Footer with pulsing hint animation
- Dark overlay with full credits

---

## 📜 License

This portfolio app is **personal property** of Gangadhar Poosarla. The code is shared for reference and personal use only. Commercial use or redistribution without permission is not allowed.

---

<div align="center">

**Built with 🦾 + Flutter by Gangadhar Poosarla**

*"Sometimes you gotta run before you can walk." — Tony Stark*

*In this case: `flutter run` before you can walk the interview.*

</div>
