import 'package:flutter/material.dart';
import 'package:movie_trailer/providers/movie_provider.dart';
import 'package:movie_trailer/screens/account_screen/account_screen.dart';
import 'package:movie_trailer/screens/main_screen/widgets/movie_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:tlrt_lib/text_contrast/text_contrast.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main-screen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLoaded = false;
  int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => fetchData());
  }

  fetchData() {
    Provider.of<MovieProvider>(context, listen: false).fetch();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<MovieProvider>(context).item;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: TextContrast(
          data: 'Movie Trailer',
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        leading: Image.asset(
          'assets/movie-logo.png',
          scale: 10,
        ),
        actions: [
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(AccountScreen.routeName),
            child: const CircleAvatar(
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.account_circle_sharp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 3),
        itemBuilder: (context, index) => MovieCard(
          movieTitle: item.elementAt(index).originalTitle,
          movieId: item.elementAt(index).id,
        ),
        itemCount: item.length,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white60,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.missed_video_call_outlined),
            label: 'Comming soon',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_download_rounded),
            label: 'Download',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
