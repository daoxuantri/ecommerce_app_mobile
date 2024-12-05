import 'package:flutter/material.dart';

class ProfileLine extends StatelessWidget {
  const ProfileLine(
      {super.key,
      required this.iconPath,
      required this.content,
      this.isLastElement});

  final String iconPath;
  final String content;
  final bool? isLastElement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset(
                  iconPath,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    content,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 15,
                width: 40,
              ),
              if (isLastElement == null || !isLastElement!)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 6),
                    child: Container(
                      color: const Color(0xffdddde0),
                      height: 1,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
