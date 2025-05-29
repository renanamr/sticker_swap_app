import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/core/entities/album_manager.dart';
import 'package:sticker_swap_app/src/core/entities/auth.dart';
import 'package:sticker_swap_app/src/core/entities/user.dart';
import 'package:sticker_swap_app/src/modules/chat/qrcode/presenter/qrcode_module.dart';
import 'package:sticker_swap_app/src/modules/home/presenter/home_module.dart';
import 'package:sticker_swap_app/src/modules/login/presenter/login_module.dart';
import 'package:sticker_swap_app/src/modules/message_chat/presenter/message_chat_module.dart';
import 'package:sticker_swap_app/src/modules/splashscreen/presenter/splash_screen.dart';
import 'package:sticker_swap_app/src/modules/splashscreen/presenter/splash_screen_bloc.dart';
import 'package:sticker_swap_app/src/modules/user/presenter/search_user_chat/search_user_chat_module.dart';
import 'package:sticker_swap_app/src/modules/user/presenter/sync_user/sync_user_module.dart';

import 'modules/recover/presenter/recover_module.dart';
import 'modules/register/presenter/register_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add<Dio>(() => Dio());
    i.addSingleton<Auth>(Auth.new);
    i.addSingleton<AlbumManager>(AlbumManager.new);
    i.add<User>(() => User(
        image: "https://pbs.twimg.com/profile_images/1480660529840492546/nTVLSngG_400x400.jpg",));

    i.add<SplashScreenBloc>(SplashScreenBloc.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashScreen());
    r.module('/login',
        module: LoginModule(), transition: TransitionType.fadeIn);
    r.module('/home',
        module: HomeModule(), transition: TransitionType.fadeIn);
    r.module('/message_chat',
        module: MessageChatModule(), transition: TransitionType.fadeIn);
    r.module('/register',
        module: RegisterModule(), transition: TransitionType.fadeIn);
    r.module('/recover',
        module: RecoverModule(), transition: TransitionType.fadeIn);
    r.module('/qrcode',
        module: QRCodeModule(), transition: TransitionType.fadeIn);
    r.module('/search_user',
        module: SearchUserChatModule(), transition: TransitionType.fadeIn);
    r.module('/sync_user',
        module: SyncUserModule(), transition: TransitionType.fadeIn);
  }
}
