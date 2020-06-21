import 'package:flutter/material.dart';
import 'Employee.dart';
import 'EmployeeBlock.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeesBloc _employeesBloc = EmployeesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Employee App'),
        ),
        body: Container(
          child: StreamBuilder<List<Employee>>(
              stream: _employeesBloc.employeeListStream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Employee>> snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, position) {
                      return Card(
                        elevation: 5.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                snapshot.data[position].id.toString(),
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    snapshot.data[position].name,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  Text(
                                    snapshot.data[position].salary.toString(),
                                    style: TextStyle(fontSize: 16.0),
 
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: IconButton(
                                  icon: Icon(Icons.thumb_up),
                                  color: Colors.green,
                                  onPressed: () => _employeesBloc
                                      .employeeSalaryIncrementSink
                                      .add(snapshot.data[position])),
                            ),
                            Container(
                              child: IconButton(
                                  icon: Icon(Icons.thumb_down),
                                  color: Colors.red,
                                  onPressed: () => _employeesBloc
                                      .employeeSalaryDecrementSink
                                      .add(snapshot.data[position])),
                            )
                          ],
                        ),
                      );
                    });
              }),
        ));
  }

  @override
  void dispose() {
    _employeesBloc.dispose();
    super.dispose();
  }
}
