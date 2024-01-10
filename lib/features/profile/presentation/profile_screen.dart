import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/login/presentation/login_screen.dart';
import '../../login/presentation/bloc/auth/authentication_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        
        
          return Scaffold(
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                const SizedBox(
                  height: 590,
                ),
                Align(
                  alignment: Alignment.center,
                  
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
                      height: 50,
                      width: 200,
                      child: MaterialButton(
                        onPressed: () {
                          context
                              .read<AuthenticationBloc>()
                              .add(const AuthenticationEvent.logout());
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => const LoginScreen()),
                              (route) => false);
                        },
                        color: Colors.blue,
                        child: const Text('Logout'),
                      ),
                    ),
                  ),
                ),
              ]));
      },
    );
  }
}
