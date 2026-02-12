import 'package:finance_tracker/data/models/transactions_get_count/transactions_get_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:finance_tracker/core/const/app_colors.dart';

Widget buildFilterButton(BuildContext context, String title, String value, String activePeriod, TransactionsGetCount countTransactions, {VoidCallback? onPressed}) {
  final isActive = value == activePeriod;

  return Expanded(
    child: SizedBox(
      height: 50.0,
      child: TextButton(
        onPressed: onPressed ?? () {
          context.read<TransactionsBloc>().add(
            TransactionsEvent.getTransactions(period: value, count: countTransactions),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: isActive ? AppColors.primary : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 15.0,
            height: 1.5,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    ),
  );
}
