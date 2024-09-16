import 'package:flutter/material.dart';
import 'package:payungpribadi/common/theme.dart';
import 'package:payungpribadi/presentation/widgets/appbar.dart';
import 'package:payungpribadi/presentation/widgets/initial_circle.dart';
import 'package:payungpribadi/presentation/widgets/profile_menu_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void goToUnderConstructor(context) {
    Navigator.pushNamed(context, '/under_construction_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhitePrimaryColor,
      body: ListView(
        children: [
          const Appbar(
            title: 'Profile',
          ),
          profilePicture(),
          ProfileMenuTile(
            icon: const Icon(
              Icons.people,
              color: kGrayAvatar,
            ),
            title: 'Informasi Pribadi',
            onPress: () {
              Navigator.pushNamed(context, '/personal_screen');
            },
          ),
          ProfileMenuTile(
            icon: const Icon(
              Icons.note,
              color: kGrayAvatar,
            ),
            title: 'Syarat & Ketentuan',
            onPress: () {
              goToUnderConstructor(context);
            },
          ),
          ProfileMenuTile(
            icon: const Icon(
              Icons.chat,
              color: kGrayAvatar,
            ),
            title: 'Bantuan',
            onPress: () {
              goToUnderConstructor(context);
            },
          ),
          ProfileMenuTile(
            icon: const Icon(
              Icons.security,
              color: kGrayAvatar,
            ),
            title: 'Kebijakan Privasi',
            onPress: () {
              goToUnderConstructor(context);
            },
          ),
          ProfileMenuTile(
            icon: const Icon(
              Icons.exit_to_app,
              color: kGrayAvatar,
            ),
            title: 'Logot',
            onPress: () {
              goToUnderConstructor(context);
            },
          ),
          ProfileMenuTile(
            icon: const Icon(
              Icons.delete,
              color: kGrayAvatar,
            ),
            title: 'Hapus Akun',
            onPress: () {
              goToUnderConstructor(context);
            },
          ),
        ],
      ),
    );
  }

  Widget profilePicture() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InitialCircle(
            onPress: () {},
            name: 'Argi',
            size: 60,
            backgroundColor: kGrayAvatar,
            textColor: Colors.white,
            fontSize: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Argi Gentarna",
                style: mainTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 19,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Masuk dengan Google',
                style: mainTextStyle.copyWith(),
              )
            ],
          )
        ],
      ),
    );
  }
}
