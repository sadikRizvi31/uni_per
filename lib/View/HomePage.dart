import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uni_per/Utils/AppColor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? _selectedUniversity = "Gujarat Technological University";
  var universities = {"Gujarat Technological University":"GTU","Veer Narmada South Gujarat University":"VNSGU", "Sarvajanik University": "SU"};

  List _universities=[];
  UniversityDependentDropDown(){
    universities.forEach((key, value) {
      _universities.add(key);
    });
  }

  String? _selectedDegree;
  var degrees = {"Diploma Engg":"GTU","Diploma Pharmacy":"GTU","Bachelor in Engineering":"GTU","Master in Commerce":"VNSGU","Bachelor in Commerce":"VNSGU", "Bachelor in Engineering": "SU"};
  //var degrees = {"Diploma Engg":"GTU","Master in Commerce":"VNSGU","Bachelor in Engineering": "SU"};
  List _degrees=[];
  degreeDependentDropDown(degShort){
    degrees.forEach((key, value) {
      if(degShort == value){
        _degrees.add(key);
      }
    });
    _selectedDegree = _degrees[0];
  }

  String? _selectedDepartment;
  var Departments = {"Computer Engineering":"Diploma Engg","Civil Engineering":"Diploma Engg","Computer Science Engineering":"Bachelor in Engineering",
    "Chemical Engineering":"Bachelor in Engineering","FYBA":"Bachelor in Commerce", "Aeronautical Engineering": "Bachelor in Engineering"};
  //var Departments = {"Computer Engineering":"Diploma Engg","Computer Science Engineering":"Bachelor in Engineering", "FYBA":"Bachelor in Commerce"};

  List _departments=[];
  DepartmentDependentDropDown(deptShort){
    Departments.forEach((key, value) {
      if(deptShort == value){
        _departments.add(key);
      }
    });
    _selectedDepartment = _departments[0];
  }

  int? _selectedSemester;
  var Semester = {"Diploma Engg":6,"Diploma Pharmacy":6,"Bachelor in Engineering":8,"Master in Commerce":4,"Bachelor in Commerce":6};

  List _semester=[];
  List<int> lst=[];
  SemesterDependentDropDown(semShort){
    Semester.forEach((key, value) {
      if(semShort == key){
        lst = List.generate(value+1, ((index) => index));
        _semester.add(lst.sublist(1,lst.length));
      }
    });
    _selectedSemester = _semester[0];
  }

  @override
  void initState(){
    super.initState();
    UniversityDependentDropDown();
  }
  
  @override
  Widget build(BuildContext context) {
    double SHeight = MediaQuery.of(context).size.height;
    double SWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: SHeight * 0.20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.0),bottomLeft: Radius.circular(25.0)),
                  color: AppColor.primarySwatchColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SHeight * 0.1,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: SWidth * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          hintText: 'Enter Query',
                          hintStyle: TextStyle(fontSize: 15.0),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: SHeight * 0.05,),
          Container(
            height: SHeight * 0.09,
            width: SWidth * 0.9,
            padding: const EdgeInsets.only(left: 16.0,right: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.LogoWriteColor, width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text('Select University'),
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                value: _selectedUniversity,
                onChanged: (newValue){
                  setState(() {
                    _departments = [];
                    _degrees=[];
                    degreeDependentDropDown(universities[newValue]);
                    _selectedUniversity = "$newValue";
                  });
                },
                items: _universities.map((university){
                  return DropdownMenuItem(child: new Text(university),
                    value: university,
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: SHeight * 0.05,),
          Container(
            height: SHeight * 0.09,
            width: SWidth * 0.9,
            padding: const EdgeInsets.only(left: 16.0,right: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.LogoWriteColor, width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text('Select Degree'),
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                value: _selectedDegree,
                onChanged: (newValue){
                  setState(() {
                    _departments = [];
                    DepartmentDependentDropDown(newValue);
                    _selectedDegree = "$newValue";
                  });
                },
                items: _degrees.map((degree){
                  return DropdownMenuItem(child: new Text(degree),
                    value: degree,
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: SHeight * 0.05,),
          Container(
            height: SHeight * 0.09,
            width: SWidth * 0.9,
            padding: const EdgeInsets.only(left: 16.0,right: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.LogoWriteColor, width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text('Select Department'),
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                value: _selectedDepartment,
                onChanged: (newValue){
                  setState(() {
                    SemesterDependentDropDown(_selectedDegree);
                    _selectedDepartment = "$newValue";
                  });
                },
                items: _departments.map((department){
                  return DropdownMenuItem(child: new Text(department),
                    value: department,
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: SHeight * 0.05,),
          Container(
            height: SHeight * 0.09,
            width: SWidth * 0.9,
            padding: const EdgeInsets.only(left: 16.0,right: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.LogoWriteColor, width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text('Select Semester :'),
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                value: _selectedSemester,
                onChanged: (newValue){
                  setState(() {
                    _selectedSemester = int.parse("$newValue");
                  });
                },
                //items: GenrateList(_selectedSemester)
                items: _semester.map((semester){
                  return DropdownMenuItem(child: new Text(semester),
                    value: semester,
                  );
                }).toList(),
                // items: _selectedSemester == null
                //     ? []
                //     : List<DropdownMenuItem>.generate(
                //   _selectedSemester!,
                //       (index) => DropdownMenuItem(
                //     value: _selectedSemester!,
                //     child: Text(_selectedSemester!.toString()),
                //   ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
