import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class PlayListProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        albumArtImagePath: 'assets/images/img1.jpg',
        artistName: 'Caleb Hearn, ROSIE',
        audioPath: 'assets/audio/1.mp3',
        songName: 'A Little Bit Better'),

    Song(
        albumArtImagePath: 'assets/images/img2.jpg',
        artistName: 'Bradley Marshall',
        audioPath: 'assets/audio/2.mp3',
        songName: 'Perfect For Me'),

    Song(
        albumArtImagePath: 'assets/images/img3.jpg',
        artistName: 'Edith Whiskers',
        audioPath: 'assets/audio/3.mp3',
        songName: 'Home'),

    Song(
        albumArtImagePath: 'assets/images/img4.jpg',
        artistName: 'Forest Blakk',
        audioPath: 'assets/audio/4.mp3',
        songName: 'I Choose You'),

    Song(
        albumArtImagePath: 'assets/images/img5.jpg',
        artistName: 'Skyline',
        audioPath: 'assets/audio/5.mp3',
        songName: 'Hold Me Tight'),
  ];

  //current song index
  int? _currentSongIndex;

  /*
  G E T T E R S
   */
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  /*
  S E T T E R S
   */
  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    notifyListeners();
  }
}
