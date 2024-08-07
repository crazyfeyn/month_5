import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isSelected = [true, false, false, false];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About course'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  color: Colors.purple,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/city.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text(
                              'Noldan boshlab data kurslari',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(4, (index) {
                                return const Row(
                                  children: [
                                    Icon(
                                      Icons.play_circle,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      '23 dars',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                );
                              }),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: const Text(
                              "Kursga qo'shilish",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            pinned: true,
            floating: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ToggleButtons(
                    children: [
                      _buildToggleButton('Info'),
                      _buildToggleButton('Comment'),
                      _buildToggleButton('New'),
                      _buildToggleButton('Modules'),
                    ],
                    isSelected: isSelected,
                    onPressed: (int newIndex) {
                      setState(() {
                        for (int index = 0;
                            index < isSelected.length;
                            index++) {
                          isSelected[index] = index == newIndex;
                        }
                      });
                      _pageController.jumpToPage(newIndex);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        for (int i = 0; i < isSelected.length; i++) {
                          isSelected[i] = i == index;
                        }
                      });
                    },
                    children: [
                      _buildInfoContent(),
                      _buildCommentContent(),
                      _buildNewContent(),
                      _buildModulesContent(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String title) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(title),
    );
  }

  Widget _buildInfoContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const SingleChildScrollView(
        child: Text(
          """
          About course
d ads asd  as asd ads  as asd das sasd ads  as asd das sasd ads  as asd das s
ads asd a sd das  adsasd ads  as asd das sasd ads  as asd das s
dsaa dsa da  dasasd ads  as asd das sasd ads  as asd das s
d ds sd das asd ads  as asd das sasd ads  as asd das s
das ds dsa asd ads  as asd das sasd ads  as asd das s
d ads asd  as asd ads  as asd das sasd ads  as asd das sasd ads  as asd das s
ads asd a sd das  adsasd ads  as asd das sasd ads  as asd das s
dsaa dsa da  dasasd ads  as asd das sasd ads  as asd das s
d ds sd das asd ads  as asd das sasd ads  as asd das s
das ds dsa asd ads  as asd das sasd ads  as asd das s
d ads asd  as asd ads  as asd das sasd ads  as asd das sasd ads  as asd das s
ads asd a sd das  adsasd ads  as asd das sasd ads  as asd das s
dsaa dsa da  dasasd ads  as asd das sasd ads  as asd das s
d ds sd das asd ads  as asd das sasd ads  as asd das s
das ds dsa asd ads  as asd das sasd ads  as asd das s
d ads asd  as asd ads  as asd das sasd ads  as asd das sasd ads  as asd das s
ads asd a sd das  adsasd ads  as asd das sasd ads  as asd das s
dsaa dsa da  dasasd ads  as asd das sasd ads  as asd das s
d ds sd das asd ads  as asd das sasd ads  as asd das s
das ds dsa asd ads  as asd das sasd ads  as asd das s
d ads asd  as asd ads  as asd das sasd ads  as asd das sasd ads  as asd das s
ads asd a sd das  adsasd ads  as asd das sasd ads  as asd das s
dsaa dsa da  dasasd ads  as asd das sasd ads  as asd das s
d ds sd das asd ads  as asd das sasd ads  as asd das s
das ds dsa asd ads  as asd das sasd ads  as asd das s
d ads asd  as asd ads  as asd das sasd ads  as asd das sasd ads  as asd das s
ads asd a sd das  adsasd ads  as asd das sasd ads  as asd das s
dsaa dsa da  dasasd ads  as asd das sasd ads  as asd das s
d ds sd das asd ads  as asd das sasd ads  as asd das s
das ds dsa asd ads  as asd das sasd ads  as asd das s
          """,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildCommentContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const SingleChildScrollView(
        child: Text(
          """
        Comment
d ads asd  as asd ads  as asd das sasd ads  as asd das sasd ads  as asd das s
ads asd a sd das  adsasd ads  as asd das sasd ads  as asd das s
dsaa dsa da  dasasd ads  as asd das sasd ads  as asd das s
d ds sd das asd ads  as asd das sasd ads  as asd das s
das ds dsa asd ads  as asd das sasd ads  as asd das s
d ads asd  as asd ads  as asd das sasd ads  as asd das sasd ads  as asd das s
ads asd a sd das  adsasd ads  as asd das sasd ads  as asd das s
dsaa dsa da  dasasd ads  as asd das sasd ads  as asd das s
d ds sd das asd ads  as asd das sasd ads  as asd das s
das ds dsa asd ads  as asd das sasd ads  as asd das s
          """,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildNewContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const SingleChildScrollView(
        child: Text(
          """
          About content
d ads asd  as asd ads  as asd das sasd ads  as asd das sasd ads  as asd das s
ads asd a sd das  adsasd ads  as asd das sasd ads  as asd das s
dsaa dsa da  dasasd ads  as asd das sasd ads  as asd das s
d ds sd das asd ads  as asd das sasd ads  as asd das s
das ds dsa asd ads  as asd das sasd ads  as asd das s
d ads asd  as asd ads  as asd das sasd ads  as asd das sasd ads  as asd das s
ads asd a sd das  adsasd ads  as asd das sasd ads  as asd das s
dsaa dsa da  dasasd ads  as asd das sasd ads  as asd das s
d ds sd das asd ads  as asd das sasd ads  as asd das s
das ds dsa asd ads  as asd das sasd ads  as asd das s
          """,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildModulesContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const SingleChildScrollView(
        child: Text(
          """
          Modules
d ads asd  as asd ads  as asd das sasd ads  as asd das sasd ads  as asd das s
ads asd a sd das  adsasd ads  as asd das sasd ads  as asd das s
dsaa dsa da  dasasd ads  as asd das sasd ads  as asd das s
d ds sd das asd ads  as asd das sasd ads  as asd das s
das ds dsa asd ads  as asd das sasd ads  as asd das s
d ads asd  as asd ads  as asd das sasd ads  as asd das sasd ads  as asd das s
ads asd a sd das  adsasd ads  as asd das sasd ads  as asd das s
dsaa dsa da  dasasd ads  as asd das sasd ads  as asd das s
d ds sd das asd ads  as asd das sasd ads  as asd das s
das ds dsa asd ads  as asd das sasd ads  as asd das s
          """,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
