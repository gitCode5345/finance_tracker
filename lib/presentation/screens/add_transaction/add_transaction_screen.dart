import 'package:finance_tracker/business/bloc/category_bloc/category_bloc.dart';
import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:finance_tracker/data/models/category/category.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:finance_tracker/presentation/widgets/body_container_widget.dart';
import 'package:finance_tracker/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:finance_tracker/core/const/app_colors.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderWidget(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 24.0,
              right: 24.0,
              bottom: 24.0,
            ),
            children: [
              Text(
                'Add Transaction',
                style: TextStyle(
                  color: AppColors.textPrimary,
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
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),
          Expanded(
            child: BodyContainerWidget(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 24.0,
                  bottom: 24.0,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15.0, bottom: 5.0),
                        child: Row(
                          children: [
                            Text(
                              'Date',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        readOnly: true,
                        onTap: () {
                          picker.DatePicker.showDateTimePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime(2000, 1, 1, 10, 0),
                            maxTime: DateTime.now(),
                            theme: picker.DatePickerTheme(
                              headerColor: AppColors.primary,
                              backgroundColor: Colors.white,
                              itemStyle: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              doneStyle: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onConfirm: (date) {
                              _dateController.text = DateFormat('dd/MM/yyyy HH:mm').format(date);
                            },
                            currentTime: DateTime.now(),
                            locale: picker.LocaleType.en,
                          );
                        },
                        controller: _dateController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: AppColors.secondary,
                          hintText: 'Select a date',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: AppColors.textHint,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(left: 15.0, bottom: 5.0),
                        child: Row(
                          children: [
                            Text(
                              'Category',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<CategoryBloc, CategoryState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loaded: (categories) {
                              return DropdownButtonFormField<Category>(
                                initialValue: selectedCategory,
                                icon: SvgPicture.asset(
                                  'assets/images/arrow_down.svg',
                                ),
                                items: categories.map((category) {
                                  return DropdownMenuItem<Category>(
                                    value: category,
                                    child: Text(category.name),
                                  );
                                }).toList(),
                                onChanged: (Category? newValue) {
                                  setState(() {
                                    selectedCategory = newValue;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: AppColors.secondary,
                                ),
                              );
                            },
                            orElse: () => SizedBox.shrink(),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(left: 15.0, bottom: 5.0),
                        child: Row(
                          children: [
                            Text(
                              'Amount',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: AppColors.secondary,
                          hintText: 'Enter amount',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: AppColors.textHint,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(left: 15.0, bottom: 5.0),
                        child: Row(
                          children: [
                            Text(
                              'Title',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: AppColors.secondary,
                          hintText: 'Enter title',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: AppColors.textHint,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        height: 150,
                        child: TextFormField(
                          controller: _noteController,
                          maxLines: null,
                          expands: true,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                            filled: true,
                            fillColor: AppColors.secondary,
                            hintText: 'Enter note',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: AppColors.textHint,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            minimumSize: Size(200.0, 50.0),
                          ),
                          onPressed: () {
                            context.read<TransactionsBloc>().add(
                              TransactionsEvent.saveTransaction(
                                transaction: Transaction(
                                  id: null,
                                  date: DateFormat('dd/MM/yyyy HH:mm').parse(_dateController.text),
                                  amount: double.parse(_amountController.text),
                                  title: _titleController.text,
                                  note: _noteController.text,
                                  categoryId: selectedCategory!.id!,
                                  category: selectedCategory,
                                  type: selectedCategory!.type,
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
