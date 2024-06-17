import 'package:basics/Domain/account_manager/residence.dart';
import 'package:basics/Domain/account_manager/residence.dart';
import 'package:basics/Domain/auth_entities/user_roles.dart';
import 'package:basics/Presentation/Documents_Page/documents_page.dart';
import 'package:basics/Presentation/Utils/gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:searchable_listview/searchable_listview.dart';

class EditRoleDialog extends StatefulWidget {
  const EditRoleDialog({super.key});

  @override
  State<EditRoleDialog> createState() => _EditRoleDialogState();
}

class _EditRoleDialogState extends State<EditRoleDialog> {
  @override
  Roles role = Roles.resident;
  final List<Residence> residences = [
    Residence(
        residenceId: "1",
        street: 'Kwiatowa',
        buildingNumber: '1',
        apartmentNumber: '18',
        floor: 5),
    Residence(
        residenceId: "2",
        street: 'Second Avenue',
        buildingNumber: '202',
        apartmentNumber: '2B',
        floor: 2),
    Residence(
        residenceId: "3",
        street: 'Third Boulevard',
        buildingNumber: '303',
        apartmentNumber: '3C',
        floor: 3),
    Residence(
        residenceId: "5",
        street: 'Fourth Lane',
        buildingNumber: '404',
        apartmentNumber: '4D',
        floor: 4),
  ];
  @override
  void initState() {
    super.initState();
  }

  void chooseFunction(String id) {
    setState(() {
      choosenId = id;
    });
  }

  late String choosenId = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
            width: 500,
            height: 500,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                gapH10,
                const Center(
                  child: Text(
                    "Wybierz Role",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                gapH10,
                DropdownButton(
                    value: role,
                    items: const [
                      DropdownMenuItem(
                        value: Roles.resident,
                        child: Text("Mieszkaniec"),
                      ),
                      DropdownMenuItem(
                        value: Roles.administrator,
                        child: Text("Adminstrator"),
                      ),
                      DropdownMenuItem(
                        value: Roles.manager,
                        child: Text("Zarządca"),
                      ),
                      DropdownMenuItem(
                        value: Roles.repairman,
                        child: Text("Majster"),
                      ),
                    ],
                    onChanged: (chooserole) {
                      setState(() {
                        role = chooserole!;
                      });
                    }),
                if (role == Roles.resident)
                  SizedBox(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SearchableList<Residence>(
                        seperatorBuilder: (context, index) {
                          return const Divider();
                        },
                        style: const TextStyle(fontSize: 25),
                        itemBuilder: (item) {
                          return item.residenceId == choosenId
                              ? ResidenceItem(
                                  residence: item,
                                  chooseFunction: chooseFunction,
                                  choosen: true,
                                )
                              : ResidenceItem(
                                  residence: item,
                                  chooseFunction: chooseFunction,
                                  choosen: false,
                                );
                        },
                        errorWidget: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Error while fetching Residences')
                          ],
                        ),
                        initialList: residences,
                        filter: (p0) {
                          var resultSet = <Residence>{};

                          resultSet.addAll(residences
                              .where((element) => element.street.contains(p0)));
                          resultSet.addAll(residences.where((element) =>
                              element.buildingNumber.contains(p0)));
                          resultSet.addAll(residences.where((element) =>
                              element.apartmentNumber.contains(p0)));

                          return resultSet.toList();
                        },
                        emptyWidget: const EmptyView(),
                        onRefresh: () async {},
                        onItemSelected: (Residence item) {},
                        inputDecoration: InputDecoration(
                          labelText: "Znajdz mieszkanie",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        closeKeyboardWhenScrolling: true,
                      ),
                    ),
                  ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          side: WidgetStatePropertyAll(
                              BorderSide(color: Colors.black, width: 1))),
                      child: const Text("OK", style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
                gapH10,
                gapH10
              ],
            )),
      ),
    );
  }
}

class ResidenceItem extends StatelessWidget {
  final Residence residence;
  final Function chooseFunction;
  final bool choosen;
  const ResidenceItem({
    required this.choosen,
    super.key,
    required this.residence,
    required this.chooseFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: !choosen
              ? Colors.grey[200]
              : const Color.fromARGB(255, 255, 235, 174),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.house_outlined,
              color: Colors.yellow[700],
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                chooseFunction(residence.residenceId);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BuildingNumber: ${residence.buildingNumber}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'ApartmentNumber: ${residence.apartmentNumber}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Street: ${residence.street}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
