import 'package:get/get.dart';
import 'package:test_bloc/base_one/view/gmehgh.dart';

import '../base_one/view/home_page.dart';
import '../base_one/view/navigatore.dart';
import '../base_one/view/profil.dart';
import '../base_one/view/splash.dart';
import '../logic/bindings/bottom_binding.dart';
import '../logic/bindings/game_binding.dart';
import '../logic/bindings/home_binding.dart';
import '../logic/bindings/login_binding.dart';
import '../logic/bindings/register_binding.dart';
import '../register_login/login_view.dart';
import '../register_login/register_view.dart';







class AppRoutes {
  static const home = Routes.home;
  static const register = Routes.register;
  static const login = Routes.login;
  static const splash = Routes.splash;
static const navigate  = Routes.navigate ;
  static const profile  = Routes.profile ;
  static const game  = Routes.game ;

  static final routes = [
    GetPage(name: Routes.home , page: () =>  HomePage() , binding: HomeBinding()),
    GetPage(name: Routes.profile , page: () =>  ProfilePage()),
    GetPage(name: Routes.navigate , page: () =>  NavigationBottom() , binding: BottomBinding()),
    GetPage(name: Routes.register, page: () =>  RegisterView() , binding: RegisterBinding()),
    GetPage(name: Routes.login, page: () =>  LoginView() , binding: LoginBinding()),
    GetPage(name: Routes.splash, page: () =>  Splash() , binding: LoginBinding()),
    GetPage(name: Routes.splash, page: () =>  GamePag() , binding: GameBinding()),
  ];

}
class Routes {
  static const home = '/home';
  static const register = '/register';
  static const login = '/login';
  static const splash = '/splash';
  static const navigate = '/navigate';
  static const profile = '/profile';
  static const game = '/game';
}