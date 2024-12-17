import 'package:al_fatiha/view/pages/fotiha/pages/fotiha_main_page.dart';
import 'package:al_fatiha/view/pages/fotiha/pages/read_fotiha_page.dart';
import 'package:al_fatiha/view/pages/fotiha/widgets/audio_player_page.dart';
import 'package:al_fatiha/view/pages/todo/pages/add_todo.dart';
import 'package:al_fatiha/view/pages/todo/pages/todo_page.dart';
import 'package:get/get.dart';

import '../../view/pages/login/login.dart';


class RouteHelper {
  static const String initial = '/';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String fotihaPage = '/fotiha_page';
  static const String readFatihaPage = '/read_fotiha_page';
  static const String audioPlayerPage = '/audio_player_page';
  static const String todoPage = '/todo_page';
  static const String addTodo = '/add_todo';


  static String getInitial() => initial;

  static String getSignIn() => signIn;

  static String getSignUp() => signUp;
  static String getFotihaPage() => fotihaPage;
  static String getReadFatihaPage() => readFatihaPage;
  static String getAudioPlayerPage() => audioPlayerPage;
  static String getTodoPage() => todoPage;
  static String getAddTodo() => addTodo;


  // static String getMapScreen(
  //         {PlaceLocation location = const PlaceLocation(
  //             latitude: 41.3170726, longitude: 69.2740113, address: ''),
  //         bool isSelecting = true}) =>
  //     '$mapScreen?location=$location&isSelecting=$isSelecting';



  static List<GetPage> routes = [
    // GetPage(name: initial, page: () => const MainPage()),
    // GetPage(name: splashPage, page: () => const SplashScreen()),
    GetPage(
        name: signIn,
        page: () => const LoginPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: fotihaPage,
        page: () => const FotihaMainPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: readFatihaPage,
        page: () => const ReadFotihaPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: todoPage,
        page: () => const TodoPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: addTodo,
        page: () => const AddTodo(),
        transition: Transition.fadeIn),
    // GetPage(
    //     name: audioPlayerPage,
    //     page: () => const AudioPlayerPage(),
    //     transition: Transition.fadeIn),

    // GetPage(name: signUp, page: () => const SignUpPage()),
    // GetPage(
    //     name: mapScreen,
    //     page: () {
    //       var location = Get.parameters['location'];
    //       var isSelecting = Get.parameters['isSelecting'];
    //       return MapScreen(
    //         location: location as PlaceLocation,
    //         isSelecting: isSelecting as bool,
    //       );
    //     }),
    // GetPage(
    //     name: smsVerification,
    //     page: () => const SmsVerification(),
    //     transition: Transition.fadeIn),
    //
    // GetPage(
    //     name: passwordChange,
    //     page: () => const PasswordChange(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: aboutUs,
    //     page: () => const AboutUs(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: phoneChange,
    //     page: () =>  PhoneChangeVerification(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: home,
    //     page: () => const HomePage(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: profileAccount,
    //     page: () => const Profile(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: myAds,
    //     page: () => const ProfilePostPage(),
    //     transition: Transition.leftToRight,
    //     transitionDuration: const Duration(seconds: 1)),
    // GetPage(
    //   name: notification,
    //   page: () => const Notifications(),
    //   transition: Transition.fadeIn,
    //   // transitionDuration: const Duration(seconds: 1)
    // ),
    // GetPage(
    //     name: createPost,
    //     page: () =>  const CreatePost(),
    //     transition: Transition.fadeIn),
    //
    // GetPage(
    //     name: postDetail,
    //     page: () => const PostDetailPage(),
    //  ),
    // GetPage(
    //     name: likePostPage,
    //     page: () => const LikePostPage(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: imageOpen,
    //     page: () =>  ImageOpen(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: updateProfilePassword,
    //     page: () =>  const UpdateProfilePassword(),
    //     transition: Transition.fadeIn),
  ];
}
