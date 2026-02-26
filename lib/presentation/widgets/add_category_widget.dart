import 'package:finance_tracker/business/bloc/category_bloc/category_bloc.dart';
import 'package:finance_tracker/core/validators/validators.dart';
import 'package:finance_tracker/data/models/category/category.dart';
import 'package:flutter/material.dart';
import 'package:finance_tracker/core/const/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoryWidget extends StatefulWidget {
  const AddCategoryWidget({super.key});

  @override
  State<AddCategoryWidget> createState() => _AddCategoryWidgetState();
}

class _AddCategoryWidgetState extends State<AddCategoryWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedType;

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'New Category',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: AppColors.borderGrafik,
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nameController,
              validator: (value) => Validators.text(value),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide.none
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: AppColors.secondary,
                hintText: 'Write category name',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: AppColors.primary
                ),
              ),
            ),
            const SizedBox(height: 12),
            DropdownMenu<String>(
              initialSelection: 'expense',
              width: MediaQuery.of(context).size.width - 40,
              hintText: 'Select Type',
              textStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: AppColors.secondary,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: 'expense',
                  label: 'Expense',
                  style: MenuItemButton.styleFrom(
                    textStyle: const TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
                DropdownMenuEntry(
                  value: 'income',
                  label: 'Income',
                  style: MenuItemButton.styleFrom(
                    textStyle: const TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
              ],
              onSelected: (value) {
                setState(() {
                  selectedType = value;
                });
              },
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  minimumSize: const Size(200.0, 50.0)
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final category = Category(
                      name: _nameController.text,
                      type: selectedType ?? 'expense',
                      isSystem: false,
                      icon: 'assets/images/user_category.svg'
                    );

                    context.read<CategoryBloc>().add(
                      AddCategoryEvent(category),
                    );
                  }
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: AppColors.textSecondary
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  minimumSize: const Size(200.0, 50.0)
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: AppColors.textSecondary
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
