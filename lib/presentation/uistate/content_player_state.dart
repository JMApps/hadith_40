import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ContentPlayerState extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late ConcatenatingAudioSource _audioSource;

  Stream<Duration?> get durationStream => _audioPlayer.durationStream;

  Stream<Duration> get positionStream => _audioPlayer.positionStream;

  Stream<PlayerState> get playerStateStream => _audioPlayer.playerStateStream;

  ContentPlayerState() {
    _initializeAudioPlayer();
  }

  Future<void> _initializeAudioPlayer() async {
    final List<AudioSource> audioSources = List.generate(
      42,
      (index) => AudioSource.asset('assets/audios/hadeeth_${index + 1}.mp3'),
    );

    _audioSource = ConcatenatingAudioSource(children: audioSources);

    await _audioPlayer.setAudioSource(_audioSource);
  }

  Future<void> play() async {
    if (_audioPlayer.processingState == ProcessingState.ready) {
      await _audioPlayer.seek(Duration.zero, index: 11);
      await _audioPlayer.play();
    } else {
      await _audioPlayer.play();
    }
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
