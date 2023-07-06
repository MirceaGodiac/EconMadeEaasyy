import 'package:flutter/material.dart';

class answerPage extends StatefulWidget {
  int initialBalance;
  int indent;
  double width;
  double height;
  answerPage({
    super.key,
    required this.initialBalance,
    required this.indent,
    required this.height,
    required this.width,
  });

  @override
  State<answerPage> createState() => _answerPageState();
}

class _answerPageState extends State<answerPage> with TickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = Tween(
            begin: widget.initialBalance.toDouble(),
            end: widget.indent.toDouble())
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: <Widget>[
          const Text(
            'Punctele tale...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
          Text(
            '${animation.value}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          )
        ],
      ),
    );
  }
}
