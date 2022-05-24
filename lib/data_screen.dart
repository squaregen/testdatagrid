import 'dart:async';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'employe.dart';
import 'employee_datasource.dart';




class DataScreen extends StatefulWidget {
  const DataScreen({
    Key? key,
  }) : super(key: key);

  @override
  DataScreenState createState() => DataScreenState();
}

class DataScreenState extends State<DataScreen>
    with AutomaticKeepAliveClientMixin<DataScreen> {

  DataGridController? gridController;
  final GlobalKey _sfGridKey = GlobalKey(debugLabel: "sfGridKey");

  late List<Employee> _employees;
  late EmployeeDataSource _employeeDataSource;
  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(employees: _employees);
    gridController = DataGridController();
  }






  @override
  Widget build(BuildContext context) {
    super.build(context);




    return  Scaffold(
            appBar: AppBar(title: const Text("Datagrid checkbox test"),),
            body: _grid(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.clear),
        onPressed: (){
        setState((){


              gridController?.selectedRows = [];


        });
      },),
            );
  }

  Widget _grid() {
    return SfDataGrid(
          key: _sfGridKey,
          controller: gridController,
          frozenColumnsCount: 1,
          frozenRowsCount: 0,
          allowSorting: true,
          showCheckboxColumn: true,
          columnWidthMode: ColumnWidthMode.auto,
          source: _employeeDataSource,
          columns: getColumns(),
          selectionMode: SelectionMode.multiple,
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both
          );
  }






  List<GridColumn> getColumns(){
    return [
      GridColumn(
          columnName: 'id',
          label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerRight,
              child: const Text(
                'ID',
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          columnName: 'name',
          label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Name',
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          columnName: 'designation',
          label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Designation',
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          columnName: 'salary',
          label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerRight,
              child: const Text(
                'Salary',
                overflow: TextOverflow.ellipsis,
              ))),
    ];
  }
  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }


  @override
  void dispose() {


    gridController?.dispose();
    super.dispose();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }


  @override
  bool get wantKeepAlive => true;
}
