import 'package:flutter/material.dart';
import 'package:flutter_audio_app/bloc/audio_bloc.dart';
import 'package:flutter_audio_app/service/audio_player_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final AudioPlayerService audioPlayerService = AudioPlayerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Music Player')),
      body: Center(
        child: BlocBuilder<AudioBloc, AudioState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(audioPlayerService.songs[audioPlayerService.currentIndex].imageUrl),
                Text(audioPlayerService.songs[audioPlayerService.currentIndex].title),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.skip_previous),
                      onPressed: () {
                        audioPlayerService.previous();
                        context.read<AudioBloc>().add(AudioEvent(AudioState.playing));
                      },
                    ),
                    IconButton(
                      icon: Icon(state == AudioState.playing ? Icons.pause : Icons.play_arrow),
                      onPressed: () {
                        if (state == AudioState.playing) {
                          audioPlayerService.pause();
                          context.read<AudioBloc>().add(AudioEvent(AudioState.paused));
                        } else {
                          audioPlayerService.play();
                          context.read<AudioBloc>().add(AudioEvent(AudioState.playing));
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next),
                      onPressed: () {
                        audioPlayerService.next();
                        context.read<AudioBloc>().add(AudioEvent(AudioState.playing));
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}