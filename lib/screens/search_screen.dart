import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/bottom_navigation_page.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/SearchScreen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2445),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
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
                const Expanded(child: SizedBox()),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff35364a),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
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
                  'Recent favourites',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'JetBrainsMono'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.77,
                  width: MediaQuery.of(context).size.width - 24,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 20.0,
                      mainAxisExtent: 300,
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  'https://picsum.photos/250?image=9',
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Item ${index + 1}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 24.0, fontFamily: 'JetBrainsMono'),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Post Malone',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.0, fontFamily: 'JetBrainsMono'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
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
                                  Navigator.pushNamed(context, '/SearchPage');
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
