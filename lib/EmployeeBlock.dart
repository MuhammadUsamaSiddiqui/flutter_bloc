// * imports
import 'dart:async';
import 'package:blockemployee/Employee.dart';

class EmployeesBloc {
  // * List of Employees
  List<Employee> _employeeList = [
    Employee(1, 'Employee One', 10000.00),
    Employee(2, 'Employee Two', 20000.00),
    Employee(3, 'Employee Three', 30000.00),
    Employee(4, 'Employee Four', 40000.00),
    Employee(5, 'Employee Five', 50000.00),
  ];

  // Sink to add data in pipe
  // Stream to get data from pipe
  // By Pipe mean Data flow

  // * Stream Controllers
  final _employeeListStreamContoller = StreamController<List<Employee>>();

  // for inc and dec
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  // * Stream Sink Getter
  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamContoller.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamContoller.sink;

  StreamSink<Employee> get employeeSalaryIncrementSink =>
      _employeeSalaryIncrementStreamController.sink;

  StreamSink<Employee> get employeeSalaryDecrementSink =>
      _employeeSalaryDecrementStreamController.sink;

  // * Constructor - add data; Listen to Changes
  EmployeesBloc() {
    _employeeListStreamContoller.add(_employeeList);

    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  // * Core Functions

  void _incrementSalary(Employee employee) {
    double increment = employee.salary * 20 / 100;
    _employeeList[employee.id - 1].salary = employee.salary + increment;

    employeeListSink.add(_employeeList);
  }

  void _decrementSalary(Employee employee) {
    double decrement = employee.salary * 20 / 100;
    _employeeList[employee.id - 1].salary = employee.salary - decrement;

    employeeListSink.add(_employeeList);
  }

  // * Dispose
  void dispose() {
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
    _employeeListStreamContoller.close();
  }
}
