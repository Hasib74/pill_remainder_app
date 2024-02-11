import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:remainder_flutter/core/theme/app_colors.dart';
import 'package:remainder_flutter/core/theme/app_theme.dart';
import 'package:remainder_flutter/presentation/medicine/domain/medicine_model.dart';

Widget SearchMedicine(Function(MedicineModel?) searchResult) {
  return Builder(builder: (BuildContext context) {
    return DropdownSearch<MedicineModel>(
      popupProps: const PopupProps.menu(
        //showSelectedItems: true,
        showSearchBox: true,
        // searchDelay: Duration(seconds: 3000),
      ),
      items: MedicineModel.getMedicineList(),
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColor.primaryTextColor,
            ),
        dropdownSearchDecoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Search Medicine",
            hintStyle: Theme.of(context).textTheme.bodyMedium),
      ),
      onChanged: searchResult,
      selectedItem: MedicineModel.getMedicineList()[0],
      itemAsString: (MedicineModel u) => u.name.toString(),
    );
  });
}
