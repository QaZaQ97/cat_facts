import 'package:cat_facts/cubit/cat_cubit/cat_cubit.dart';
import 'package:cat_facts/cubit/cat_cubit/cat_state.dart';
import 'package:cat_facts/presentation/pages/history_screen.dart';
import 'package:cat_facts/presentation/widgets/custom_button.dart';
import 'package:cat_facts/presentation/widgets/image_widget.dart';
import 'package:cat_facts/presentation/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Random Cat Facts and Images'),
      ),
      body: BlocProvider(
        create: (context) => CatCubit(),
        child: BlocBuilder<CatCubit, CatState>(
          builder: (context, state) {
            if (state is CatInitialState) {
              context.read<CatCubit>().getCatData();
            }
            if (state is CatLoadingState) {
              return Center(child: Lottie.asset('assets/loading_cat.json'));
            }
            if (state is CatErrorState) {
              return const Center(child: Text('Error'));
            }
            if (state is CatLoadedState) {
              return Column(
                children: [
                  /// widget to display random cat image
                  ImageWidget(catImage: state.catImage),
                  const SizedBox(height: 20),

                  /// widget to display random fact about cats
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MainTextWidget(catText: state.catText),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /// button to navigate History screen
                      CustomButton(
                        buttonText: 'Fact history',
                        onPress: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HistoryScreen()),
                        ),
                      ),

                      /// button to get new random fact and image
                      CustomButton(
                        buttonText: 'Another fact',
                        onPress: () => setState(() {
                          context.read<CatCubit>().getCatData();
                          var facts = Hive.box('facts');
                          List<String> listFacts = List<String>.from(facts.get('facts') ?? []);
                          listFacts.add('${state.catText}\ncreated at: $now');
                          facts.put('facts', listFacts);
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              );
            } else {
              return Center(child: Lottie.asset('assets/loading_cat.json'));
            }
          },
        ),
      ),
    );
  }
}
