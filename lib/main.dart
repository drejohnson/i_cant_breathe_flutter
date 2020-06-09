import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_cant_breathe/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 300.0, end: 350.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Black Lives Matter!'.toUpperCase(),
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Center(
          child: SvgPicture.asset(
            'images/i_cant_breathe_round.svg',
            width: _animation.value,
            height: _animation.value,
          ),
        ),
      ),
    );
  }
}
