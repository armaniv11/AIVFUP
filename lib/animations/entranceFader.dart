import 'package:flutter/material.dart';

class EntranceFader extends StatefulWidget {
  final Widget? child;
  final Duration delay;
  final Duration duration;
  final Offset offset;

  const EntranceFader({
    this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 400),
    this.offset = const Offset(0.0, 32.0),
  });

  @override
  EntranceFaderState createState() {
    return EntranceFaderState();
  }
}

class EntranceFaderState extends State<EntranceFader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _dxAnimation;
  late Animation _dyAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _dxAnimation =
        Tween(begin: widget.offset.dx, end: 0.0).animate(_controller);
    _dyAnimation =
        Tween(begin: widget.offset.dy, end: 0.0).animate(_controller);
    Future.delayed(widget.delay, () {
      if (this.mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  GlobalKey menuKey = GlobalKey();

  showMenus(BuildContext context) async {
    final render = menuKey.currentContext!.findRenderObject() as RenderBox;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          render.localToGlobal(Offset.zero).dx,
          render.localToGlobal(Offset.zero).dy + 50,
          double.infinity,
          double.infinity),
      items: [
        PopupMenuItem(
          child: Text("Create a website"),
        ),
        PopupMenuItem(
          child: Text("Top Ms commericial management"),
        ),
        PopupMenuItem(
          child: Text("Mobile inventory application"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Opacity(
        opacity: _controller.value,
        child: Transform.translate(
          offset: Offset(_dxAnimation.value, _dyAnimation.value),
          child: widget.child,
        ),
      ),
    );
  }
}
