import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/bag/bag_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/bag/bag_list_page.dart';

class BagPage extends StatelessWidget {
  const BagPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagBloc, BagState>(
      buildWhen: (previous, current) =>
          current is BagInitial || current is BagPageState,
      builder: (context, state) {
        if (state is BagInitial) {
          BlocProvider.of<BagBloc>(context, listen: false)
              .add(BagInitListEvent());
        } else if (state is BagPageState) {
          return BagListPage();
        }
        return Container();
      },
    );
  }
}
