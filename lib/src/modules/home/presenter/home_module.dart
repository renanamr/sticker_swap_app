import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/modules/filter/domain/entities/filter.dart';
import 'package:sticker_swap_app/src/modules/home/presenter/home_bloc.dart';
import 'package:sticker_swap_app/src/modules/home/presenter/home_screen.dart';

class HomeModule extends Module{
  @override
  void binds(i) {
    i.add<Filter>(Filter.new);
    i.add<HomeBloc>(HomeBloc.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomeScreen());
  }
}