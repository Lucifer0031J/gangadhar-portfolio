#!/bin/bash
# ─────────────────────────────────────────────────────────────────────────────
# Flutter Installer — Multiple Methods (run as normal user, not root)
# For Gangadhar Portfolio App
# ─────────────────────────────────────────────────────────────────────────────

FLUTTER_DIR="$HOME/flutter"
PROJECT_DIR="$HOME/gangadhar_portfolio"
FLUTTER_BIN="$FLUTTER_DIR/bin/flutter"

echo "🦾 Flutter Installer for Gangadhar Portfolio"
echo "════════════════════════════════════════════"
echo ""

if [ -f "$FLUTTER_BIN" ]; then
  echo "✅ Flutter already installed at $FLUTTER_DIR"
  export PATH="$FLUTTER_DIR/bin:$PATH"
  flutter --version
  goto_project
  exit 0
fi

# ─── Method 1: Extract from already-downloaded tarball ───────────────────────
method_tarball() {
  echo "📦 Method 1: Extracting from tarball..."
  if [ -f /tmp/flutter.tar.xz ]; then
    SIZE=$(stat -c%s /tmp/flutter.tar.xz 2>/dev/null || echo 0)
    if [ "$SIZE" -gt 700000000 ]; then
      tar xf /tmp/flutter.tar.xz -C "$HOME" 2>&1
      if [ -f "$FLUTTER_BIN" ]; then
        echo "✅ Extracted successfully!"
        return 0
      fi
    else
      echo "⚠️  Tarball incomplete (${SIZE} bytes). Expected ~731MB."
    fi
  else
    echo "⚠️  Tarball not found at /tmp/flutter.tar.xz"
  fi
  return 1
}

# ─── Method 2: Wget download ─────────────────────────────────────────────────
method_wget() {
  echo "📥 Method 2: Downloading via wget..."
  if command -v wget &>/dev/null; then
    wget -c --tries=10 --timeout=30 \
      "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.27.4-stable.tar.xz" \
      -O /tmp/flutter.tar.xz 2>&1
    tar xf /tmp/flutter.tar.xz -C "$HOME" 2>&1
    if [ -f "$FLUTTER_BIN" ]; then
      echo "✅ Downloaded and extracted!"
      return 0
    fi
  fi
  return 1
}

# ─── Method 3: Git clone (shallow) ───────────────────────────────────────────
method_git() {
  echo "🔧 Method 3: Git clone Flutter stable..."
  GIT_TERMINAL_PROMPT=0 git clone \
    --depth=1 \
    --branch stable \
    --single-branch \
    https://github.com/flutter/flutter.git \
    "$FLUTTER_DIR" 2>&1
  if [ -f "$FLUTTER_BIN" ]; then
    echo "✅ Cloned successfully!"
    return 0
  fi
  return 1
}

# ─── Try methods in order ─────────────────────────────────────────────────────
method_tarball || method_wget || method_git

if [ ! -f "$FLUTTER_BIN" ]; then
  echo ""
  echo "❌ All methods failed. Please manually download Flutter:"
  echo "   https://docs.flutter.dev/get-started/install/linux"
  exit 1
fi

# ─── Setup ────────────────────────────────────────────────────────────────────
export PATH="$FLUTTER_DIR/bin:$PATH"
echo ""
echo "📌 Adding Flutter to PATH in ~/.bashrc..."
grep -q "flutter/bin" ~/.bashrc || echo 'export PATH="$HOME/flutter/bin:$PATH"' >> ~/.bashrc
grep -q "flutter/bin" ~/.zshrc 2>/dev/null || echo 'export PATH="$HOME/flutter/bin:$PATH"' >> ~/.zshrc 2>/dev/null

echo ""
echo "⚙️  Running flutter doctor..."
flutter config --no-analytics 2>/dev/null
flutter precache --no-fuchsia --no-ios --no-web 2>/dev/null

echo ""
echo "📦 Getting project dependencies..."
cd "$PROJECT_DIR"
flutter pub get

echo ""
echo "📱 Available devices:"
flutter devices

echo ""
echo "════════════════════════════════════════════"
echo "🚀 Ready! Choose how to run:"
echo ""
echo "  Android emulator:   flutter run"
echo "  Linux desktop:      flutter config --enable-linux-desktop && flutter run -d linux"
echo "  Web browser:        flutter run -d web-server --web-port 8080"
echo "  Chrome:             flutter run -d chrome"
echo "════════════════════════════════════════════"
