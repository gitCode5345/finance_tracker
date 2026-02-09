import 'package:finance_tracker/core/const/app_colors.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:finance_tracker/core/const/transaction_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

Widget buildTransactionItem(Transaction tx) {
  final date = tx.date;
  final fullMonthName = DateFormat('MMMM dd, yyyy').format(date.toLocal());

  return GestureDetector(
    onTap: () => print('Transaction tapped: ${tx.title}'),
    child: ListTile(
      title: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              tx.category?.icon ?? '',
              width: 57,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        color: AppColors.textPrimary,
                        fontStyle: FontStyle.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      '${DateFormat('HH:mm').format(date.toLocal())} - $fullMonthName',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              tx.type == TransactionType.expense ?'-${tx.amount}' : '${tx.amount}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
