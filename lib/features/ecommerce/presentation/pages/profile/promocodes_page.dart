import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/promocodes/promocodes_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/promocode_tile_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/search_bar_button.dart';
import 'package:get_it/get_it.dart';

class PromocodesPage extends StatelessWidget {
  const PromocodesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<PromocodesCubit>()..loadList(),
      child: const PromocodesListPage(),
    );
  }
}

class PromocodesListPage extends StatelessWidget {
  const PromocodesListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromocodesCubit, PromocodesState>(
      builder: (context, state) {
        (state as PromocodesListPageState);
        return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
                backgroundColor: AppColors.mainColor,
                border: null,
                trailing: SearchBarButton()),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: [
                  Container(
                    height: 64,
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "My Promocodes",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ...List.generate(
                      state.list.length,
                      (index) =>
                          PromocodeTileWidget(promocode: state.list[index])),
                ]),
              ),
            ));
      },
    );
  }
}
