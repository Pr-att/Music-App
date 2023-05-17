import 'package:flutter/material.dart';
import 'package:music_app/utils/audio_player.dart';
import 'package:music_app/utils/bottom_navigation_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2445),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff35364a),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: SearchBar(
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xff35364a),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  hintText: 'Search',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 8, top: 20),
              child: Text(
                'Trending Right Now',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontFamily: 'JetBrainsMono'),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Consumer<AudioProvider>(
              builder: (context, audioProvider, _) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridTile(
                          footer: Padding(
                            padding: const EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: GridTileBar(
                                backgroundColor:
                                    Colors.blueGrey.withOpacity(0.9),
                                title: Text(
                                  'Audio ${index + 1}',
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Text(
                                  'Artist Name ${index + 1}',
                                  textAlign: TextAlign.center,
                                ),
                                trailing: IconButton(
                                  icon: audioProvider.isPlaying(index)
                                      ? const Icon(Icons.pause)
                                      : const Icon(Icons.play_arrow),
                                  onPressed: () {
                                    if (audioProvider.isPlaying(index)) {
                                      audioProvider.pauseAudio(index);
                                    } else {
                                      audioProvider.playAudio(index,
                                          'audio${index + 1}.mp3');
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff35364a),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Song Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(alignment: Alignment.bottomCenter, children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.42,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: ListTile(
                        leading: Card(
                          elevation: 0,
                          color: const Color(0xff35364a),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              'https://picsum.photos/250?image=9',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        title: const Text(
                          'Song Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: const Text(
                          'Artist Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Consumer<BottomNavigationIndex>(
                  builder: (context, bottomNavigationIndex, _) {
                    return BottomNavigationBar(
                        selectedItemColor: Colors.white,
                        selectedIconTheme: const IconThemeData(size: 30),
                        backgroundColor: Colors.blueGrey.withOpacity(0.9),
                        currentIndex:
                            context.watch<BottomNavigationIndex>().index,
                        onTap: (int index) {
                          switch (index) {
                            case 0:
                              Navigator.pushNamed(context, '/HomePage');
                              break;
                            case 1:
                              Navigator.pushNamed(context, '/SearchScreen');
                              break;
                            case 2:
                              Navigator.pushNamed(context, '/MusicPage');
                              break;
                            case 3:
                              Navigator.pushNamed(context, '/ProfilePage');
                              break;
                          }
                          context
                              .read<BottomNavigationIndex>()
                              .changeIndex(index);
                        },
                        type: BottomNavigationBarType.fixed,
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.home,
                            ),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.search,
                            ),
                            label: 'Search',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.music_note,
                            ),
                            label: 'Music',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.person,
                            ),
                            label: 'Profile',
                          ),
                        ]);
                  },
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
