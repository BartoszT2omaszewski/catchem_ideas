import 'package:catchem_ideas/app/features/home/cubit/home_cubit.dart';
import 'package:catchem_ideas/app/features/models/item_model.dart';
import 'package:catchem_ideas/app/features/repositories/items_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(ItemsRepository())..start(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      boxShadow: [BoxShadow(blurRadius: 10.0)],
                    ),
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        final itemModels = state.items;

                        return ListView(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            children: [
                              for (final itemModel in itemModels)
                                Dismissible(
                                  secondaryBackground: const DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                    ),
                                    child: Icon(
                                      Icons.delete,
                                    ),
                                  ),
                                  background: const DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                    ),
                                  ),
                                  confirmDismiss: (direction) async {
                                    // only from right to left
                                    return direction ==
                                        DismissDirection.endToStart;
                                  },
                                  key: ValueKey(itemModel.id),
                                  onDismissed: (direction) {
                                    context
                                        .read<HomeCubit>()
                                        .remove(documentID: itemModel.id);
                                  },
                                  child: IdeaTileItem(
                                    itemModel: itemModel,
                                  ),
                                ),
                            ]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IdeaTileItem extends StatelessWidget {
  const IdeaTileItem({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(104, 230, 154, 41),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          itemModel.title,
                          style: GoogleFonts.jost(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          itemModel.ideaDateFormatted(),
                          style: GoogleFonts.jost(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                  ),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        itemModel.daysLeft(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'days left',
                        style: GoogleFonts.jost(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
