import 'package:basics/DI.dart';
import 'package:basics/Domain/account_manager/user.dart';
import 'package:basics/Domain/paged_list.dart';
import 'package:basics/Domain/value_objects/fonts.dart';
import 'package:basics/Infrastructure/residences_repo.dart';
import 'package:basics/Infrastructure/user_manager_repo.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/gaps.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ResidenceListPage extends StatefulWidget {
  const ResidenceListPage({super.key});

  @override
  State<ResidenceListPage> createState() => _ResidenceListPageState();
}

class _ResidenceListPageState extends State<ResidenceListPage> {
  @override
  Widget build(BuildContext context) {
    return const AppPageBasics(children: [
      gapH40,

      Text("Lista użytkowników",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
      // gapH10,
      SizedBox(
        height: 800,
        width: 1000,
        child: ResidencesPaginatedTable(),
      )
    ]);
  }
}

class ResidencesDataSourceAsync extends AsyncDataTableSource {
  ResidencesDataSourceAsync({required this.context});

  final BuildContext context;

  final ResidenceManagerRepo _ResidenceRepo = getIt.get<ResidenceManagerRepo>();

  final bool _empty = false;
  int? _errorCounter;

  // final DesertsFakeWebService _repo = DesertsFakeWebService();

  String _sortColumn = "name";
  bool _sortAscending = true;

  void sort(String columnName, bool ascending) {
    _sortColumn = columnName;
    _sortAscending = ascending;
    refreshDatasource();
  }

  Future<int> getTotalRecords() {
    return Future<int>.delayed(
        const Duration(milliseconds: 0), () => _empty ? 0 : 10);
  }

  @override
  Future<AsyncRowsResponse> getRows(int startIndex, int count) async {
    // print('getRows($startIndex, $count)');
    // if (_errorCounter != null) {
    //   _errorCounter = _errorCounter! + 1;

    //   if (_errorCounter! % 2 == 1) {
    //     await Future.delayed(const Duration(milliseconds: 1000));
    //     throw 'Error #${((_errorCounter! - 1) / 2).round() + 1} has occured';
    //   }
    // }

    // try {
    var response = await _ResidenceRepo.getAllResidences(1, 5, null, null);

    return response.fold((error) {
      return AsyncRowsResponse(0, <DataRow2>[]);
    }, (x) {
      var dataRows = x.items.map((Residence) {
        return DataRow2(
          onTap: () {
            context.goNamed(
              pathParameters: {"ResidenceId": Residence.residenceId},
              "ResidenceAdminInfo",
            );
          },
          key: ValueKey<String>(Residence.residenceId),
          onSelectChanged: (value) {
            if (value != null) {
              setRowSelection(ValueKey<String>(Residence.residenceId), value);
            }
          },
          cells: [
            DataCell(Text(Residence.residenceId)),
            DataCell(Text(Residence.street)),
            DataCell(Text(Residence.buildingNumber)),
            DataCell(
              Text(Residence.apartmentNumber),
            ),
            DataCell(Text(Residence.floor.toString())),
          ],
        );
      }).toList();
      return AsyncRowsResponse(x.totalCount, dataRows);
    });

    // } catch (e) {
    //   return Future.error(e);
    // }
  }
}

class ResidencesPaginatedTable extends StatefulWidget {
  const ResidencesPaginatedTable({super.key});

  @override
  ResidencesPaginatedTableState createState() =>
      ResidencesPaginatedTableState();
}

class ResidencesPaginatedTableState extends State<ResidencesPaginatedTable> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _sortAscending = true;
  int? _sortColumnIndex;
  ResidencesDataSourceAsync? _ResidencessDataSource;
  final PaginatorController _controller = PaginatorController();

  final bool _dataSourceLoading = false;
  final int _initialRow = 0;

  @override
  void didChangeDependencies() {
    // initState is to early to access route options, context is invalid at that stage
    _ResidencessDataSource = ResidencesDataSourceAsync(context: context);

    super.didChangeDependencies();
  }

  void sort(
    int columnIndex,
    bool ascending,
  ) {
    var columnName = "name";
    switch (columnIndex) {
      case 1:
        columnName = "Name";
        break;
      case 2:
        columnName = "Surname";
        break;
      case 3:
        columnName = "Email";
        break;
      case 4:
        columnName = "Role";
        break;
      case 5:
        columnName = "Date";
        break;
    }
    _ResidencessDataSource!.sort(columnName, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  void dispose() {
    _ResidencessDataSource!.dispose();
    super.dispose();
  }

  List<DataColumn> get _columns {
    return [
      DataColumn(
        label: const Text('Name'),
        onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
      ),
      DataColumn(
        label: const Text('Surname'),
        numeric: true,
        onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
      ),
      DataColumn(
        label: const Text('Email'),
        numeric: true,
        onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
      ),
      DataColumn(
        label: const Text('Role'),
        numeric: true,
        onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
      ),
      DataColumn(
        label: const Text('Creation Date'),
        numeric: true,
        onSort: (columnIndex, ascending) => sort(columnIndex, ascending),
      ),
    ];
  }

  final GlobalKey _rangeSelectorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // Last ppage example uses extra API call to get the number of items in datasource
    if (_dataSourceLoading) return const SizedBox();

    return Stack(alignment: Alignment.bottomCenter, children: [
      AsyncPaginatedDataTable2(
          lmRatio: 0.6,
          smRatio: 0.5,
          renderEmptyRowsInTheEnd: true,
          //  loading: _Loading(),
          showCheckboxColumn: false,
          horizontalMargin: 20,
          checkboxHorizontalMargin: 12,
          columnSpacing: 0,
          wrapInCard: false,
          headingRowDecoration: const BoxDecoration(),
          header: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: []),
          rowsPerPage: _rowsPerPage,

          // Default - do nothing, autoRows - goToLast, other - goToFirst
          pageSyncApproach: PageSyncApproach.doNothing,
          minWidth: 800,
          fit: FlexFit.tight,
          border: TableBorder(
              top: BorderSide(color: Colors.grey[300]!),
              bottom: BorderSide(color: Colors.grey[300]!),
              left: BorderSide(color: Colors.grey[300]!),
              right: BorderSide(color: Colors.grey[300]!),
              // verticalInside: BorderSide(color: Colors.grey[300]!),
              horizontalInside: BorderSide(color: Colors.grey[300]!, width: 1)),
          onRowsPerPageChanged: (value) {
            // No need to wrap into setState, it will be called inside the widget
            //setState(() {
            // and trigger rebuild
            //  print('Row per page changed to $value');
            _rowsPerPage = value!;
            //});
          },
          initialFirstRowIndex: _initialRow,
          onPageChanged: (rowIndex) {
            //print(rowIndex / _rowsPerPage);
          },
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          sortArrowIcon: Icons.keyboard_arrow_up,
          sortArrowAnimationDuration: const Duration(milliseconds: 0),
          controller: _controller,
          columns: _columns,
          empty: Center(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.grey[200],
                  child: const Text('No data'))),
          //  loading: const CircularProgressIndicator(),
          // errorBuilder: (e) => _ErrorAndRetry(
          //     e.toString(), () => _ResidencessDataSource!.refreshDatasource()),
          source: _ResidencessDataSource!),
    ]);
  }
}
