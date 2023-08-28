import 'dart:io';

class Music {
  String name;
  String artist;
  int duration;

  Music(this.name, this.artist, this.duration);
}

class MusicList {
  List<Music> musics = [];

  void addMusic(Music music){
    musics.add(music);
  }

  void updateMusic(int index, Music music) {
    if (index >= 0 && index < musics.length) {
      musics[index] = music;
    }
  }

  void removeMusic(int index){
    if (index >= 0 && index < musics.length) {
      musics.removeAt(index);
    }
  }

  Music getMusic(int index) {

    if (index >= 0 && index < musics.length) {
      return musics[index];
    }
    return Music("", "", 0); // Return an empty music object if index is invalid
  }

  void displayMusic() {
    if(musics.isEmpty) {
      print("There is no music to display");
    } else {
      print("Music PLaylist: ");
      for(var music in musics) {
        print("- ${music.name} by Artist: ${music.artist}, Duration: ${music.duration}");
      }
    }
  }
}

void main() {
  var musicList = MusicList();

  while(true) {
    print("==========================================");
    print("1. Add new song");
    print("2. Display your playlist");
    print("3. Update your song");
    print("4. Delete your song");
    print("5. Exit");
    print("Please input your action :");
    var readLineSync = stdin.readLineSync();
    var choice = int.parse(readLineSync!);

    switch (choice) {
      case 1:
        print("------------------------------------");
        print("Input song name: ");
        var name = stdin.readLineSync();
        print("Input song artist: ");
        var artist = stdin.readLineSync();
        print("Input song duration (second): ");
        var duration = int.parse(stdin.readLineSync()!);
        var newSong = Music(name!, artist!, duration);
        musicList.addMusic(newSong);
        print("Your song has been add to your playlist!");
        break;

      case 2:
        print("------------------------------------");
        if(musicList.musics.isEmpty) {
          print("Your playlist is empty!");
        } else {
          print("Your Playlist");
          musicList.displayMusic();
        }
        break;

      case 3:
        print("------------------------------------");
        print("Enter index of music to update:");
        var index = int.parse(stdin.readLineSync()!);
        if (index >= 0 && index < musicList.musics.length) {
          print("Enter new song name:");
          var newName = stdin.readLineSync();
          print("Enter new artist:");
          var newArtist = stdin.readLineSync();
          print("Enter new duration (seconds):");
          var newDuration = int.parse(stdin.readLineSync()!);

          var updatedMusic = Music(newName!, newArtist!, newDuration);
          musicList.updateMusic(index, updatedMusic);
          print("Music updated");
        } else {
          print("Invalid index");
        }
        break;

      case 4:
        print("------------------------------------");
        print("Enter index of music to delete:");
        var index = int.parse(stdin.readLineSync()!);
        if (index >= 0 && index < musicList.musics.length) {
          musicList.removeMusic(index);
          print("Music deleted");
        } else {
          print("Invalid index");
        }
        break;

      case 5:
        print("Exit program");
        return;

      default:
        print("Action not found");
    }
  }
}