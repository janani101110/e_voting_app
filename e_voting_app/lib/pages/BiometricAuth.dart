import 'package:e_voting_app/pages/fistpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Biometricauth extends StatefulWidget {
  final int userId;
  final String? nic;

  const Biometricauth({
    super.key,
    required this.userId,
    this.nic,
  });

  @override
  State<Biometricauth> createState() => _BiometricauthState();
}

class _BiometricauthState extends State<Biometricauth> {
  late final LocalAuthentication auth;
  bool _supportState = false; 

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() {
            _supportState = isSupported;
          }),
          
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (_supportState)
            const Text('This is supported')
          else
            const Text('not supported'),
          const Divider(height: 100),
          ElevatedButton(
            onPressed: _getAvailableBiometrics,
            child: const Text('get Available biometrics'),
          ),
          const Divider(height: 100),
          ElevatedButton(
            onPressed: _authenticate,
            child: Text('Click to authenticate'),
          )
        ],
      ),
    );
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.stopAuthentication();
      await auth.authenticate(
        localizedReason: 'must MFA',
        options: AuthenticationOptions(
          stickyAuth: false,
          biometricOnly: true,
        ),
      );
      if (authenticated) {
        Navigator.push(context,
            MaterialPageRoute( builder: (context) => Fistpage(userId: widget.userId, nic: widget.nic),));
      }
      print("Authenticated: $authenticated");
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    print('list of availableBiometrics: $availableBiometrics');

    if (!mounted) {
      return;
    }
  }
}
