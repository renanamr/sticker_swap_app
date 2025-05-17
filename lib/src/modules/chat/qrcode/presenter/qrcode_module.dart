import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/chat/qrcode/presenter/qrcode_bloc.dart';
import 'package:sticker_swap_app/src/modules/chat/qrcode/presenter/qrcode_screen.dart';

class QRCodeModule extends Module{
  @override
  void binds(i) {
    i.add<QRCodeBloc>((i) => QRCodeBloc());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const QrCodeScreen());
  }
}