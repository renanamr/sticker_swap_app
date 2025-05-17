import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_app/src/core/components/app_bar_bottom_sheet.dart';
import 'package:sticker_swap_app/src/modules/filter/presenter/filter_bloc.dart';
import 'package:sticker_swap_app/src/utils/const/filter_modes_utils.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  final controller = Modular.get<FilterBloc>();

  @override
  void initState() {
    controller.initFilter();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarBottomSheet("Filtros", context),

        StreamBuilder<bool>(
          initialData: false,
          stream: controller.isLoading,
          builder: (_, snapshot) {
            if(snapshot.data!) {
              return const Center(child: CircularProgressIndicator(),);
            } else {
              return Column(
              children: [
                StreamBuilder<int>(
                  initialData: 0,
                  stream: controller.getModeFilter,
                  builder: (_, snapshot) {
                    return Column(
                      children: [
                        RadioListTile(
                          value: FilterModesUtils.all,
                          groupValue: snapshot.data,
                          onChanged:controller.setFilter,
                          title: const Text("Mostrar todos"),
                        ),
                        RadioListTile(
                          value: FilterModesUtils.onlyMissing,
                          groupValue: snapshot.data,
                          onChanged:controller.setFilter,
                          title: const Text("Somente faltantes"),
                        ),
                        RadioListTile(
                          value: FilterModesUtils.onlyObtained,
                          groupValue: snapshot.data,
                          onChanged:controller.setFilter,
                          title: const Text("Somente obitidas"),
                        ),
                        RadioListTile(
                          value: FilterModesUtils.onlyRepeated,
                          groupValue: snapshot.data,
                          onChanged:controller.setFilter,
                          title: const Text("Somente repetidas"),
                        ),
                      ],
                    );
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: 
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: controller.filterStickers, 
                      child: const Text("Filtrar")),
                  ),
                )
              ],
            );
            }
          },
        ),
      ],
    );
  }
}
