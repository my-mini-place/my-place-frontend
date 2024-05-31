import 'package:basics/Api/Account_Managment/User_info/user_info_cubit.dart';
import 'package:basics/Domain/account_manager/userdetails.dart';
import 'package:basics/Presentation/Profile_Page/components/info_tile.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/gaps.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:basics/Presentation/Utils/extension.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<UserInfoCubit>().getUserInfo(getUserId(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppPageBasics(withfoot: true, children: [
      BlocBuilder<UserInfoCubit, UserState>(
        builder: (context, state) {
          if (state is UserInfoLoaded) {
            return UserPersonal(userInfo: state.userInfo);
          } else {
            return UserPersonal(userInfo: userBasics);
          }
        },
      ),
    ]);
  }
}

class UserPersonal extends StatelessWidget {
  const UserPersonal({
    super.key,
    required this.userInfo,
  });

  final UserFullInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH40,
          const Text("Informacje użytkownika", style: TextStyle(fontSize: 30)),
          const Divider(),
          gapH10,
          const Text("Podstawowe:", style: TextStyle(fontSize: 20)),
          InfoTile(
            title: "Imię",
            description: userInfo.name,
          ),
          InfoTile(
            title: "Nazwisko",
            description: userInfo.surname,
          ),
          InfoTile(
            title: "Email",
            description: userInfo.email,
          ),
          InfoTile(
            title: "Numer telefonu",
            description: userInfo.phoneNumber,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {},
                    child: const Text(
                      "Edit info",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ))),
          ),
          const SizedBox(height: 10),
          if (userInfo.role == "Resident")
            Column(
              children: [
                const Text("Adres:", style: TextStyle(fontSize: 20)),
                InfoTile(
                    title: "Ulica", description: userInfo.residence!.street),
                InfoTile(
                  title: "Numer budynku",
                  description: userInfo.residence!.buildingNumber,
                ),
                InfoTile(
                  title: "Numer mieszkania",
                  description: userInfo.residence!.apartmentNumber,
                ),
                InfoTile(
                  title: "Piętro",
                  description: userInfo.residence!.floor.toString(),
                ),
                const SizedBox(height: 10),
                const Text("Informacje o bloku:",
                    style: TextStyle(fontSize: 20)),
                const InfoTile(
                  title: "Nazwa bloku",
                  description: "Blok Nostalgia",
                ),
                const InfoTile(
                  title: "Kod pocztowy",
                  description: "00-001",
                ),
              ],
            ),
          gapH40
        ],
      ),
    );
  }
}
