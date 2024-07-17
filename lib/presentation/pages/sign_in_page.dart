import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_market/presentation/pages/discover_page.dart';
import 'package:nft_market/presentation/pages/sign_up_page.dart';
import 'package:nft_market/presentation/widgets/button_widget.dart';
import 'package:nft_market/presentation/widgets/input_widget.dart';
import 'package:nft_market/presentation/widgets/page_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PageWidget(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _body(),

              // Sign in
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ));
                },
                child: Text(
                  'Create new account',
                  style: GoogleFonts.inter(
                      color: const Color(0xFF909FB4), fontSize: 16),
                ),
              )
            ]),
      ),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Column(children: [
        // Title
        const Gap(60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Start Collecting Amazing Artworks',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                color: const Color(0xFF0D1220),
                fontSize: 26,
                fontWeight: FontWeight.w600,
                height: 36 / 26),
          ),
        ),
        const Gap(40),

        // Form
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(24)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email',
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all((Radius.circular(13)))),
                  ),
                ),
                const Text(
                  'Password',
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all((Radius.circular(13)))),
                  ),
                ),

                // Action
                const Gap(10),
                Builder(builder: (context) {
                  return ButtonWidget(
                    text: 'Sign In',
                    isFullWidth: true,
                    onPressed: () async {
                      final authResponse = await supabase.auth
                          .signInWithPassword(
                              email: emailController.text,
                              password: passwordController.text);
                      if (authResponse.user != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiscoverPage()),
                        );
                      }
                    },
                  );
                })
              ]),
        )
      ]),
    );
  }
}
