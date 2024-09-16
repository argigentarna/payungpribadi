import 'package:flutter/material.dart';
import 'package:payungpribadi/common/theme.dart';

class ProfileMenuTile extends StatelessWidget {
  final Icon icon;
  final String title;
  final VoidCallback onPress;

  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: kWhitePrimaryColor, // Or any color you want for the background
          borderRadius: BorderRadius.circular(
            10,
          ), // Adjust the radius for rounded corners
          boxShadow: [
            BoxShadow(
              color: kGrayAvatar.withOpacity(0.1),
              offset: const Offset(0, 1),
              blurRadius: 8,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: kLightGray, // Or any color you want for the background
                borderRadius: BorderRadius.circular(
                  10,
                ), // Adjust the radius for rounded corners
                boxShadow: [
                  BoxShadow(
                    color: kGrayAvatar.withOpacity(0.1),
                    offset: const Offset(0, 1),
                    blurRadius: 8,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: icon,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: mainTextStyle.copyWith(
                color: kCharcoalGrayColor,
                fontSize: 15,
                fontWeight: regular,
              ),
            )
          ],
        ),
      ),
    );
  }
}
