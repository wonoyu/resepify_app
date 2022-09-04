import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resepify_app/src/modules/home/model/food_model.dart';
import 'package:resepify_app/src/modules/home/view/controller/food_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Search Foods",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 8.0,
        ),
        const SearchTextField(),
        Expanded(
          child: Consumer(
            builder: (context, ref, _) {
              final controller = ref.watch(foodsControllerProvider);
              return controller.when(
                  data: (stateData) {
                    final data = stateData.foods;
                    if (stateData.error != null) {
                      return Text(
                          "${stateData.error?.code ?? "Code"}: ${stateData.error?.message ?? "Unexpected Error"}");
                    }
                    if (data.isEmpty) {
                      return const Text("No foods found");
                    }
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(data[index].foodName ?? ""),
                          subtitle: Text(data[index].brandName ?? ""),
                        );
                      },
                    );
                  },
                  error: (e, st) => Text(e.toString()),
                  loading: () => const CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}

class SearchTextField extends ConsumerStatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchTextFieldState();
}

class _SearchTextFieldState extends ConsumerState<SearchTextField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onFieldSubmitted: (value) {
        ref.read(foodsControllerProvider.notifier).searchFoods(FoodBody(
            method: 'foods.search', format: 'json', searchExpression: value));
      },
    );
  }
}
