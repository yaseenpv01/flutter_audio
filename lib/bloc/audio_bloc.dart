import 'package:flutter_bloc/flutter_bloc.dart';

enum AudioState { playing, paused, stopped }

class AudioEvent {
  final AudioState state;

  AudioEvent(this.state);
}

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  AudioBloc() : super(AudioState.stopped);

  Stream<AudioState> mapEventToState(AudioEvent event) async* {
    yield event.state;
  }
}