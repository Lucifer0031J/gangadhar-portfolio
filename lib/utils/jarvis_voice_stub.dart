class JarvisVoice {
  static bool get isSupported => false;

  static void speak(String text) {
    // No-op on non-web platforms without native TTS binding
  }

  static void stop() {
    // No-op
  }
}
