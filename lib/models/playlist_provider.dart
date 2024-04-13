import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class PlayListProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        albumArtImagePath: 'assets/images/img1.jpg',
        artistName: 'Caleb Hearn, ROSIE',
        audioPath: 'audio/1.mp3',
        songName: 'A Little Bit Better'),
    Song(
        albumArtImagePath: 'assets/images/img2.jpg',
        artistName: 'Bradley Marshall',
        audioPath: 'audio/2.mp3',
        songName: 'Perfect For Me'),
    Song(
        albumArtImagePath: 'assets/images/img3.jpg',
        artistName: 'Edith Whiskers',
        audioPath: 'audio/3.mp3',
        songName: 'Home'),
    Song(
        albumArtImagePath: 'assets/images/img4.jpg',
        artistName: 'Forest Blakk',
        audioPath: 'audio/4.mp3',
        songName: 'I Choose You'),
    Song(
        albumArtImagePath: 'assets/images/img5.jpg',
        artistName: 'Skyline',
        audioPath: 'audio/5.mp3',
        songName: 'Hold Me Tight'),
  ];

  //current song index
  int? _currentSongIndex;


  /*
  AUDIO PLAYER
   */

  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  PlayListProvider() {
    listenToDuration();
  }

  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async{
    final String path = _playlist[_currentSongIndex!].audioPath;
    _isPlaying = true;

    await _audioPlayer.stop(); //stop current song
    await _audioPlayer.play(AssetSource(path)); //play the selected song
    notifyListeners();
  }

  //pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();

  }

  //resume playing
  void resume() async{
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume
  void pauseOrResume() async {
    if(_isPlaying){
      pause();
    }else{
      resume();
    }
    notifyListeners();
  }

  //seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong(){
    if(_currentSongIndex != null){
      if(_currentSongIndex! < _playlist.length -1){
        //go to next song
        currentSongIndex = _currentSongIndex! + 1;
      }else {
        //if it's the last song, go to first song
        currentSongIndex = 0;
      }
    }
  }

  //play previous song
  void playPreviousSong()  {
    if(_currentDuration.inSeconds > 2){
      seek(Duration.zero);
    }else {
      if(_currentSongIndex! > 0){
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length -1;
      }
    }
  }

  //listen to Duration
  void listenToDuration() {
    //listen for the current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  //dispose audio player

/*
  G E T T E R S
   */
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  /*
  S E T T E R S
   */
  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;

    if(newIndex != null){
      play();
    }

    notifyListeners();
  }

}
