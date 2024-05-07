import 'package:flutter/material.dart';
import 'package:spotify_clone/searchscreen/widgets/searchWidget.dart';
import 'package:spotify_clone/searchscreen/widgets/search_song.dart';
import 'package:spotify_clone/searchscreen/widgets/topgenres.dart';
import '../bottomNavBar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  late TextEditingController _searchController;
  String _searchQuery = '';
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  void _onSearchTextChanged(String text) {
    setState(() {
      _searchQuery = text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
      body: SafeArea(
        child: SizedBox(
          height: 500,
          child: ListView(
            children:  [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text("Search",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
              ),
              SearchWidget(controller: _searchController,
                onTextChanged: _onSearchTextChanged,),
               if(_searchQuery.isNotEmpty)
               SearchSong(searchQuery: _searchQuery),
              if(_searchQuery.isEmpty)
              TopGenres(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}
