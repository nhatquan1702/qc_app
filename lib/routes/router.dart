import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/mvvm/view/screen/auth/login/login_screen.dart';
import 'package:chat_app/mvvm/view/screen/auth/register/register_number_phone_screen.dart';
import 'package:chat_app/mvvm/view/screen/auth/register/verification.dart';
import 'package:chat_app/mvvm/view/screen/chat/chat_screen.dart';
import 'package:chat_app/mvvm/view/screen/dial/dial_screen.dart';
import 'package:chat_app/mvvm/view/screen/home/home_screen.dart';
import 'package:chat_app/mvvm/view/screen/others/error_screen.dart';
import 'package:chat_app/mvvm/view/screen/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ConstantStrings.routeToRegisterNumberPhoneScreen:
      return MaterialPageRoute(
        builder: (context) => const RegisterWithPhoneNumber(),
      );
    case ConstantStrings.routeToLoginScreen:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case ConstantStrings.routeToHomeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case ConstantStrings.routeToDialScreen:
      return MaterialPageRoute(
        builder: (context) => const DialScreen(),
      );
    case ConstantStrings.routeToChatDetailScreen:
      return MaterialPageRoute(
        builder: (context) => const ChatDetailScreen(),
      );
    case ConstantStrings.routeToEditProfileScreen:
      return MaterialPageRoute(
        builder: (context) => const EditProfileScreen(),
      );
    case ConstantStrings.routeToVerificationScreen:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => VerificationScreen(
          verificationId: verificationId,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(
            messageError: 'Một lỗi đã xảy ra',
            codeError: '000',
            titleError: 'Lỗi',
          ),
        ),
      );
    // case MobileChatScreen.routeName:
    //   final arguments = settings.arguments as Map<String, dynamic>;
    //   final name = arguments['name'];
    //   final uid = arguments['uid'];
    //   final isGroupChat = arguments['isGroupChat'];
    //   final profilePic = arguments['profilePic'];
    //   return MaterialPageRoute(
    //     builder: (context) => MobileChatScreen(
    //       name: name,
    //       uid: uid,
    //       isGroupChat: isGroupChat,
    //       profilePic: profilePic,
    //     ),
    //   );
    // case ConfirmStatusScreen.routeName:
    //   final file = settings.arguments as File;
    //   return MaterialPageRoute(
    //     builder: (context) => ConfirmStatusScreen(
    //       file: file,
    //     ),
    //   );
    // case StatusScreen.routeName:
    //   final status = settings.arguments as Status;
    //   return MaterialPageRoute(
    //     builder: (context) => StatusScreen(
    //       status: status,
    //     ),
    //   );
  }
}
