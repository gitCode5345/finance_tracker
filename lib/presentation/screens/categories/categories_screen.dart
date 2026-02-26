import 'package:finance_tracker/business/bloc/category_bloc/category_bloc.dart';
import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:finance_tracker/presentation/screens/transactions_by_category/transactions_by_category.dart';
import 'package:finance_tracker/presentation/widgets/add_category_widget.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finance_tracker/core/const/app_colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 5,
            left: 20,
            right: 20,
            bottom: 20
          ),
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: 'Poppins',
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal
              )
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                style: IconButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white
                ),
                onPressed: () {},
                icon: const Icon(Icons.notifications_none)
              )
            )
          ]
        ),
        Expanded(
          child: BodyContainerWidget(
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  loaded: (categories) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150,
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12
                      ),
                      itemCount: categories.length + 1,
                      itemBuilder: (context, index) {
                        if (index == categories.length) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      content: AddCategoryWidget()
                                    )
                                  );
                                },
                                icon: SvgPicture.asset('assets/images/add_category.svg', height: 105)
                              ),
                              const Text(
                                'Add New',
                                style: TextStyle(fontWeight: FontWeight.w500)
                              )
                            ]
                          );
                        }

                        final category = categories[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onLongPress: category.isSystem ? null : () {
                                showDialog(
                                  context: context, 
                                  builder: (context) => AlertDialog(
                                  title: const Text('Delete Category'),
                                  content: const Text('Are you sure you want to delete this category?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel')
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.read<CategoryBloc>().add(DeleteCategoryEvent(category.id!));
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Delete')
                                    )
                                  ]
                                )
                              );
                              },
                              onPressed: () {
                                context.read<TransactionsBloc>().add(GetTransactionsByCategoryEvent(categoryId: category.id!));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TransactionsByCategory(category: category)
                                  )
                                );
                              },
                              icon: SvgPicture.asset(
                                category.icon!,
                                height: 105
                              )
                            ),
                            Text(
                              category.name,
                              style: const TextStyle(fontWeight: FontWeight.w500)
                            )
                          ]
                        );
                      }
                    );
                  },
                  error: (message) => Center(child: Text('Error: $message')),
                  orElse: () => const SizedBox.shrink()
                );
              }
            )
          )
        )
      ]
    );
  }
}
