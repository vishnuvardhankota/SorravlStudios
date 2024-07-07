import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorravlstudios/theme/theme_extension.dart';

class TopBarOption extends StatefulWidget {
  final String optionName;
  final String path;
  final String currentPath;
  const TopBarOption(
      {super.key,
      required this.optionName,
      required this.path,
      required this.currentPath});

  @override
  State<TopBarOption> createState() => _TopBarOptionState();
}

class _TopBarOptionState extends State<TopBarOption> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        onTap: () {
          if (widget.path == widget.currentPath) {
            return;
          } else {
            context.go(widget.path);
          }
        },
        child: Text(
          widget.optionName,
          style: TextStyle(
              color: widget.path == widget.currentPath
                  ? Colors.blue
                  : isHover
                      ? Colors.red
                      : context.inverseColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
    );
  }
}
