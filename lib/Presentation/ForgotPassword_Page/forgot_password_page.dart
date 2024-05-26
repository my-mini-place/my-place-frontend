import 'package:basics/Api/Forgot_password_cubit/forgot_cubit.dart';
import 'package:basics/Domain/value_objects/colors.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/Gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final TextEditingController _emailController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotState>(
      listener: (context, state) {
        if (state is ForgotLoading) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is ForgotError) {
          setState(() {
            isLoading = false;
          });
        }
        if (state is ForgotSuccess) {
          setState(() {
            isLoading = false;
          });

          context.goNamed("reset", extra: _emailController.text);
        }
      },
      child: AppPageBasics(children: [
        gapH40,
        gapH10,
        isLoading
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  Text("Odzyskiwanie hasła",
                      style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 123, 121, 121))),
                  const Text(
                      "Podaj email na który wyślemy kod do resetowania hasła."),
                  gapH40,
                  FractionallySizedBox(
                    widthFactor: 0.35,
                    child: Form(
                        child: Column(
                      children: [
                        TextFormField(
                            validator: (value) {
                              if (value == '' || value == null) {
                                return "Please Enter Email";
                              }

                              return "";
                            },
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(),
                            )),
                        gapH40,
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(myOrange),
                            ),
                            onPressed: () async {
                              await context
                                  .read<ForgotPasswordCubit>()
                                  .forgotPassword(_emailController.text);
                            },
                            child: const Text(
                              "Wyślij",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    )),
                  )
                ],
              ),
      ]),
    );
  }
}
