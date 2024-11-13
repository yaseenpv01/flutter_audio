import 'package:flutter_audio_app/model/song_model.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int currentIndex = 0;

  List<Song> songs = [
    Song(
      title: "Square Compressed",
      audioUrl: "https://app.konnectus.live/audify/public/uploads/audio_files/2_Square_compressed.mp3",
      imageUrl: "https://app.konnectus.live/audify/public/uploads/posters/Surprise_270x390.jpg.jpg",
    ),
    Song(
      title: "Since I Met U",
      audioUrl: "https://app.konnectus.live/audify/public/uploads/audio_files/【English_Dubbed】Since_I_Met_U_EP01___She_mistook_him_for_her_crush_and_kissed_him___Fresh_Drama_Pro_(1).mp3",
      imageUrl: "https://app.konnectus.live/audify/public/uploads/posters/TheCursedNecklace_270x390.jpg.jpg",
    ),
    Song(
      title: "Comedy Audio",
      audioUrl: "https://app.konnectus.live/audify/public/uploads/audio_files/Sanjay_Goradia_&_Siddharth_Randeria_-_Superhit_Gujarati_Comedy_Natako___@gujaraticomedy5787_(1).mp3",
      imageUrl: "https://app.konnectus.live/audify/public/uploads/posters/Dubki_270x390.jpg.jpg",
    ),
    Song(
      title: "Drama Juniors",
      audioUrl: "https://app.konnectus.live/audify/public/uploads/audio_files/Drama_Juniors_UNSEEN_EPISODE___Zee_Marathi_(1).mp3",
      imageUrl: "https://app.konnectus.live/audify/public/uploads/posters/ThankYouSimran_270x390.jpg.jpg",
    ),
  ];

  void play() async {
    await _audioPlayer.setUrl(songs[currentIndex].audioUrl);
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void next() {
    currentIndex = (currentIndex + 1) % songs.length;
    play();
  }

  void previous() {
    currentIndex = (currentIndex - 1 + songs.length) % songs.length;
    play();
  }
}