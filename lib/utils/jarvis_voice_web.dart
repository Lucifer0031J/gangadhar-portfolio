// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:js' as js;

class JarvisVoice {
  static bool get isSupported => true;

  static void speak(String text) {
    try {
      if (js.context.hasProperty('speakJarvis')) {
        js.context.callMethod('speakJarvis', [text]);
      } else {
        _browserSpeechFallback(text);
      }
    } catch (_) {
      // Graceful fallback if audio synthesis is restricted
    }
  }

  static void stop() {
    try {
      if (js.context.hasProperty('stopJarvis')) {
        js.context.callMethod('stopJarvis');
      } else {
        final synth = js.context['speechSynthesis'];
        if (synth != null) {
          synth.callMethod('cancel');
        }
      }
    } catch (_) {}
  }

  static void _browserSpeechFallback(String text) {
    try {
      final synth = js.context['speechSynthesis'];
      if (synth != null) {
        synth.callMethod('cancel');
        final clean = text.replaceAll(RegExp(r'[^\w\s.,!?-]'), ' ');
        final utterance =
            js.JsObject(js.context['SpeechSynthesisUtterance'], [clean]);
        utterance['lang'] = 'en-GB';
        utterance['pitch'] = 0.95;
        utterance['rate'] = 1.0;
        synth.callMethod('speak', [utterance]);
      }
    } catch (_) {}
  }
}
