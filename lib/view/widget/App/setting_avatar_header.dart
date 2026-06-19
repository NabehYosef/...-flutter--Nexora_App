import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class SettingsAvatarHeader
    extends StatelessWidget {
  final String? name;
  final String? email;
  final String? avatarUrl;

  const SettingsAvatarHeader({
    super.key,
    this.name,
    this.email,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              color: AppColor.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withValues(
                        alpha: 0.08,
                      ),
                  blurRadius: 12,
                  offset: const Offset(
                    0,
                    4,
                  ),
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor:
                  AppColor.white,
              backgroundImage:
                  avatarUrl != null &&
                      avatarUrl!
                          .isNotEmpty
                  ? NetworkImage(
                          avatarUrl!,
                        )
                        as ImageProvider
                  : null,
              child:
                  avatarUrl == null ||
                      avatarUrl!.isEmpty
                  ? const Icon(
                      Icons.person,
                      size: 72,
                      color:
                          AppColor.grey,
                    )
                  : null,
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (name != null &&
            name!.isNotEmpty)
          Text(
            name!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight:
                  FontWeight.w600,
            ),
          ),
        if (email != null &&
            email!.isNotEmpty)
          Text(
            email!,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
            ),
          ),
      ],
    );
  }
}
