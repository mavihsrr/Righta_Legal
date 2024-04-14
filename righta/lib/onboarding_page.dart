import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: isActive ? 30.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xffAED7C5) : Color(0xff235543),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F3EF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80),
            Expanded(
              flex: 1,
              child: Container(
                height: 500.0,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    _buildContent(
                        "Hello! I'm righta, your go-to legal guide for all things related to the Indian Penal Code Need help with a legal issue? Just ask!"),
                    _buildContent(
                        "Hi, I'm righta, your virtual assistant for navigating Indian Penal Code laws. Facing trouble? Let's find a solution together!"),
                    _buildContent(
                        "Hello! righta here, your reliable source for understanding the Indian Penal Code. Legal trouble? I've got your back!"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _buildPageIndicator(),
              ),
            ),
            SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    child: Text('Next',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/mainpage');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff235543),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _iconButton(Icons.g_mobiledata_rounded, 'Google'),
                      _iconButton(Icons.apple, 'Apple'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  Widget _buildContent(String text) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, String label) {
    return IconButton(
      icon: Icon(
        icon,
        size: 24,
        color: Color(0xff235543),
      ),
      onPressed: () {},
      padding: EdgeInsets.only(left: 72.5, right: 72.5, top: 15, bottom: 15),
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(color: Color(0xff235543)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
