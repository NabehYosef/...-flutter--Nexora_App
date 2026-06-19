import 'package:flutter/material.dart';

class SettingsOptionTile
    extends StatelessWidget {
  final String title;
  final Widget trailing;
  final bool isLast;
  final VoidCallback? onTap;

  const SettingsOptionTile({
    super.key,
    required this.title,
    required this.trailing,
    this.isLast = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final border = Border(
      bottom: BorderSide(
        color: isLast
            ? Colors.transparent
            : const Color(0xFFEDEDED),
        width: 1,
      ),
    );

    return Ink(
      decoration: BoxDecoration(
        border: border,
        color: Colors.transparent,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding:
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color(
                      0xFF303030,
                    ),
                    fontWeight:
                        FontWeight.w400,
                    fontFamily:
                        'Times New Roman',
                  ),
                ),
              ),
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}
