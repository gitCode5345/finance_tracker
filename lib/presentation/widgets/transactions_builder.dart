import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:finance_tracker/presentation/widgets/transaction_item_widget.dart';
import 'package:flutter/material.dart';

ListView buildTransactions(Map<int, Map<String, List<Transaction>>> grouped) {
    return ListView(
            children: grouped.entries.map((yearEntry) {
              final year = yearEntry.key;
              final months = yearEntry.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: Text(
                        year.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ...months.entries.map((monthEntry) {
                    final month = monthEntry.key;
                    final items = monthEntry.value;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                          child: Text(
                            month,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        ...items.map(
                          (transaction) => buildTransactionItem(transaction),
                        ),
                      ],
                    );
                  }),
                ],
              );
            }).toList(),
          );
  }