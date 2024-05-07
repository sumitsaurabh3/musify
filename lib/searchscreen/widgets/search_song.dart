import 'package:flutter/material.dart';
import '../../audio.dart';
import '../../data.dart';
class SearchSong extends StatelessWidget {
  const SearchSong({super.key, required this.searchQuery});
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    final Data data = Data();
    final List<Map<String, Object>> songsData=data.playlist;
    List<String> songs = songsData.map((song) => song['name'] as String).toList();
    List<String> filteredSongs = songs
        .where((song) => song.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
    return SizedBox(
      height: 500,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: filteredSongs.length,
        itemBuilder: (context, index) {

          Map<String, dynamic> song = songsData.firstWhere(
                (element) => element['name'] == filteredSongs[index],
            orElse: () => {},
          );

          return ListTile(
            title: Text(
              song['name'],
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AudioPlayerPro(
                    id: song['id'],
                    audioURL: song['audio'],
                    image: song['image'],
                    name: song['name'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


