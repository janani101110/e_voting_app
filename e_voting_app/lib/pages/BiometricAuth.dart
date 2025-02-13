// import 'package:local_auth/local_auth.dart';

// class BiometricAuth {
//   final LocalAuthentication _localAuth = LocalAuthentication();

//   Future<bool> authenticateUser() async {
//     try {
//       List<BiometricType> availableBiometrics = await _localAuth.getAvailableBiometrics();
//       if (availableBiometrics.isEmpty) return false;

//       return await _localAuth.authenticate(
//         localizedReason: "Authenticate to access your account",
//         options: const AuthenticationOptions(
//           biometricOnly: true,
//           useErrorDialogs: true,
//           stickyAuth: true,
//         ),
//       );
//     } catch (e) {
//       print("Biometric authentication error: $e");
//       return false;
//     }
//   }
// }
