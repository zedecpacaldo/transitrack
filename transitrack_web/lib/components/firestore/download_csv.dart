import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../style/constants.dart';
import 'download_as_table.dart';

class DownloadCSV extends StatelessWidget {
  const DownloadCSV({
    super.key,
    required this.route_choice,
    required DateTime selectedDateStart,
    required DateTime selectedDateEnd,
  }) : _selectedDateStart = selectedDateStart, _selectedDateEnd = selectedDateEnd;

  final int route_choice;
  final DateTime _selectedDateStart;
  final DateTime _selectedDateEnd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await downloadCollectionAsCSV(route_choice, Timestamp.fromDate(_selectedDateStart), Timestamp.fromDate(_selectedDateEnd));
        },
        child: Container(
            padding: const EdgeInsets.all(Constants.defaultPadding/2),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.lightBlue,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(Constants.defaultPadding)),
            ),
            child: const Center(child: Icon(Icons.download_outlined, size: 20, color: Colors.lightBlue))
        )
    );
  }
}