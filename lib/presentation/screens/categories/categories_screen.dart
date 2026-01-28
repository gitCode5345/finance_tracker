import 'package:finance_tracker/business/bloc/category_bloc/category_bloc.dart';
import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:finance_tracker/presentation/screens/transactions_by_category/transactions_by_category.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          padding: const EdgeInsets.only(top: 50.0, left: 24.0, right: 24.0, bottom: 24.0),
          children: [
            Text(
              'Categories',
              style: TextStyle(
                color: Color.fromRGBO(5, 34, 36, 1.0),
                fontFamily: 'Poppins',
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                style: IconButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
                icon: Icon(Icons.notifications_none),
              ),
            ),
          ],
        ),
        Expanded(
          child: BodyContainerWidget(
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => Center(child: CircularProgressIndicator()),
                  loaded: (categories) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 50,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<TransactionsBloc>().add(GetTransactionsByCategoryEvent(categoryId: categories[index].id!));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TransactionsByCategory(category: categories[index]),
                                  ),
                                );
                              },
                              icon: SvgPicture.asset(
                                categories[index].icon!,
                                height: 105,
                              ),
                            ),
                            Text(
                              categories[index].name,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  error: (message) => Center(child: Text('Error: $message')),
                  orElse: () => SizedBox.shrink(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
