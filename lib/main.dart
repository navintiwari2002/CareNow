import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'routes/app_routes.dart';

// Common Screens
import 'screens/common/role_redirect_screen.dart';

// 🟢 User Panel Screens
import 'screens/user_panel/splash_screen.dart';
import 'screens/user_panel/welcome_screen.dart';
import 'screens/user_panel/user_register_screen.dart';
import 'screens/user_panel/login_screen.dart';
import 'screens/user_panel/otp_screen.dart';
import 'screens/user_panel/home_screen.dart';
import 'screens/user_panel/caretaker_details_screen.dart';
import 'screens/user_panel/booking_screen.dart';
import 'screens/user_panel/payment_screen.dart';
import 'screens/user_panel/confirmation_screen.dart';
import 'screens/user_panel/my_bookings_screen.dart';
import 'screens/user_panel/profile_screen.dart';
import 'screens/user_panel/support_screen.dart';
import 'screens/user_panel/notifications_screen.dart';
import 'screens/user_panel/settings_screen.dart';

// 🟢 Caretaker Panel Screens (✔️ Avoiding conflicts using alias + renamed widget classes)
import 'screens/caretaker_panel/caretaker_register_screen.dart';
import 'screens/caretaker_panel/caretaker_login_screen.dart';
import 'screens/caretaker_panel/caretaker_dashboard_screen.dart';
import 'screens/caretaker_panel/availability_screen.dart';
import 'screens/caretaker_panel/bookings_screen.dart';
import 'screens/caretaker_panel/chat_screen.dart';
import 'screens/caretaker_panel/profile_screen.dart' as caretaker;
import 'screens/caretaker_panel/support_screen.dart' as caretaker;
import 'screens/caretaker_panel/notifications_screen.dart' as caretaker;
import 'screens/caretaker_panel/settings_screen.dart' as caretaker;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CareNowApp());
}

class CareNowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care_Now',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        // Common
        AppRoutes.roleRedirect: (context) => RoleRedirectScreen(),

        // 🔷 User Panel Routes
        AppRoutes.splash: (context) => SplashScreen(),
        AppRoutes.welcome: (context) => WelcomeScreen(),
        AppRoutes.userRegister: (context) => UserRegisterScreen(),
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.otp: (context) => OTPScreen(),
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.caretakerDetails: (context) => CaretakerDetailsScreen(),
        AppRoutes.booking: (context) => BookingScreen(),
        AppRoutes.payment: (context) => PaymentScreen(),
        AppRoutes.confirmation: (context) => ConfirmationScreen(),
        AppRoutes.myBookings: (context) => MyBookingsScreen(),
        AppRoutes.profile: (context) => ProfileScreen(),
        AppRoutes.support: (context) => SupportScreen(),
        AppRoutes.notifications: (context) => NotificationsScreen(),
        AppRoutes.settings: (context) => SettingsScreen(),

        // 🔷 Caretaker Panel Routes
        AppRoutes.caretakerRegister: (context) => CaretakerRegisterScreen(),
        AppRoutes.caretakerLogin: (context) => CaretakerLoginScreen(),
        AppRoutes.caretakerDashboard: (context) => CaretakerDashboardScreen(),
        AppRoutes.caretakerAvailability: (context) => AvailabilityScreen(),
        AppRoutes.caretakerBookings: (context) => BookingsScreen(),
        AppRoutes.caretakerChat: (context) => ChatScreen(),
        AppRoutes.caretakerProfile: (context) => caretaker.CaretakerProfileScreen(),
        AppRoutes.caretakerSupport: (context) => caretaker.CaretakerSupportScreen(),
        AppRoutes.caretakerNotifications: (context) => caretaker.CaretakerNotificationsScreen(),
        AppRoutes.caretakerSettings: (context) => caretaker.CaretakerSettingsScreen(),
      },
    );
  }
}
