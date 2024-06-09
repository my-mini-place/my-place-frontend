import 'package:basics/Api/Account_Managment/User_edit_info/user_edit_info.dart';
import 'package:basics/Api/Account_Managment/User_info/user_info_cubit.dart';
import 'package:basics/Domain/account_manager/userdetails.dart';
import 'package:basics/Domain/account_manager/usereditInfo.dart';
import 'package:basics/Domain/value_objects/notification.dart';
import 'package:basics/Presentation/Profile_Page/components/info_edit_tile.dart';
import 'package:basics/Presentation/Profile_Page/components/info_tile.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/gaps.dart';

import 'package:flutter/material.dart';
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

class UserPersonal extends StatefulWidget {
  const UserPersonal({
    super.key,
    required this.userInfo,
  });

  final UserFullInfo userInfo;

  @override
  State<UserPersonal> createState() => _UserPersonalState();
}

class _UserPersonalState extends State<UserPersonal> {
  bool isEditing = false;

  void isEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void isnotEdit() {
    isEditing = false;
    context.read<UserInfoCubit>().getUserInfo(getUserId(context));
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH40,
          !isEditing
              ? Column(
                  children: [
                    const Text("Informacje użytkownika",
                        style: TextStyle(fontSize: 30)),
                    const Divider(),
                    gapH10,
                    const Text("Podstawowe:", style: TextStyle(fontSize: 20)),
                    InfoTile(
                      title: "Imię",
                      description: widget.userInfo.name,
                    ),
                    InfoTile(
                      title: "Nazwisko",
                      description: widget.userInfo.surname,
                    ),
                    InfoTile(
                      title: "Email",
                      description: widget.userInfo.email,
                    ),
                    InfoTile(
                      title: "Numer telefonu",
                      description: widget.userInfo.phoneNumber,
                    ),
                  ],
                )
              : InfoEditForm(isEdit: isnotEdit, widget: widget),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {
                      isEdit();
                    },
                    child: !isEditing
                        ? const Text(
                            "Edit info",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          )
                        : const Text("End editing",
                            style: TextStyle(
                                decoration: TextDecoration.underline)))),
          ),
          const SizedBox(height: 10),
          if (widget.userInfo.role == "Resident")
            Column(
              children: [
                const Text("Adres:", style: TextStyle(fontSize: 20)),
                InfoTile(
                    title: "Ulica",
                    description: widget.userInfo.residence!.street),
                InfoTile(
                  title: "Numer budynku",
                  description: widget.userInfo.residence!.buildingNumber,
                ),
                InfoTile(
                  title: "Numer mieszkania",
                  description: widget.userInfo.residence!.apartmentNumber,
                ),
                InfoTile(
                  title: "Piętro",
                  description: widget.userInfo.residence!.floor.toString(),
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

class InfoEditForm extends StatefulWidget {
  const InfoEditForm({
    required this.isEdit,
    super.key,
    required this.widget,
  });

  final Function isEdit;
  final UserPersonal widget;

  @override
  State<InfoEditForm> createState() => _InfoEditFormState();
}

class _InfoEditFormState extends State<InfoEditForm> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController surnameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Informacje użytkownika", style: TextStyle(fontSize: 30)),
        const Divider(),
        gapH10,
        const Text("Podstawowe:", style: TextStyle(fontSize: 20)),
        InfoEditTile(
          title: "Imię",
          description: widget.widget.userInfo.name,
          controller: nameController,
        ),
        InfoEditTile(
          title: "Nazwisko",
          description: widget.widget.userInfo.surname,
          controller: surnameController,
        ),
        InfoEditTile(
          title: "Email",
          description: widget.widget.userInfo.email,
          controller: emailController,
        ),
        InfoEditTile(
          title: "Numer telefonu",
          description: widget.widget.userInfo.phoneNumber,
          controller: phoneNumberController,
        ),
        gapH10,
        TextButton(
            onPressed: () {
              if (emailController.text.isEmpty ||
                  nameController.text.isEmpty ||
                  surnameController.text.isEmpty ||
                  phoneNumberController.text.isEmpty) {
                NotificationManager.showError(
                    context, "Edit info", "Dane nie moga być puste");
                return;
              }

              if (emailController.text == widget.widget.userInfo.email &&
                  nameController.text == widget.widget.userInfo.name &&
                  surnameController.text == widget.widget.userInfo.surname &&
                  phoneNumberController.text ==
                      widget.widget.userInfo.phoneNumber) {
                NotificationManager.showError(context, "Edit info",
                    "Dane nie moga być takie same jak wyjsciowe");
                return;
              }

              context.read<UserEditInfoCubit>().editUserEditInfo(
                  emailController.text,
                  nameController.text,
                  surnameController.text,
                  phoneNumberController.text);

              widget.isEdit();
            },
            child: const Text("Zapisz zmiany"))
      ],
    );
  }
}
