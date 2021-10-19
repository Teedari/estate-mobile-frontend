import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uenr_estate/controllers/allowance_controller.dart';
import 'package:uenr_estate/helpers/apis/api.dart';
import 'package:uenr_estate/widgets/form_group.dart';
import 'package:http/http.dart' as http;

class Allowance extends StatefulWidget {
  const Allowance({Key? key}) : super(key: key);

  @override
  _AllowanceState createState() => _AllowanceState();
}

class _AllowanceState extends State<Allowance> {
  var allowanceController = AllowanceController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _introduction = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _floorArea = TextEditingController();
  final TextEditingController _distance = TextEditingController();
  final TextEditingController _rentPerMonth = TextEditingController();
  final TextEditingController _rentPerAnnum = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  onSumbitAllowance(BuildContext ctx) {
    var data = {
      "name": _name.text,
      "introduction": _introduction.text,
      "location": _location.text,
      "description": _description.text,
      "address": _address.text,
      "floor_area": _floorArea.text,
      "distance": _distance.text,
      "rent_per_month": _rentPerMonth.text,
      "rent_per_annum": _rentPerAnnum.text
    };
    var form = _formKey.currentState;
    if (form!.validate()) {
      allowanceController.postAllowance(success: () => show(ctx), data: data);
    }
  }

  sendData(Map<String, dynamic> data, BuildContext ctx) async {
    await http.post(Api.allowances, body: data).then((success) {
      var res = jsonDecode(utf8.decode(success.bodyBytes));
      print(res);
      show(ctx);
    }).catchError((err) {});
  }

  show(BuildContext ctx) {
    showModalBottomSheet(
        context: (ctx),
        builder: (BuildContext context) {
          return SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Complaint successfully submitted'),
                TextButton(
                    onPressed: () => {},
                    child: const Text('Add New'),
                    style: TextButton.styleFrom(shadowColor: Colors.blue))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                color: Colors.blue,
                child: const Center(
                    child: Text('Allowance',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          FormGroup(
                            children: [
                              FormGroup.label('Name of applicant'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                  child: TextFormField(
                                    controller: _name,
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return 'This field cannot be empty';
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('Introduction'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                  child: TextFormField(
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return 'This field cannot be empty';
                                      }
                                    },
                                    controller: _introduction,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('Location'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                  child: TextFormField(
                                    controller: _location,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return 'This field cannot be empty';
                                      }
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('Description'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                  child: TextFormField(
                                    controller: _description,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return 'This field cannot be empty';
                                      }
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('Address'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                  child: TextFormField(
                                    controller: _address,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return 'This field cannot be empty';
                                      }
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('Total floor Area(m)'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                    child: TextFormField(
                                  controller: _floorArea,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                  validator: (String? val) {
                                    if (val!.isEmpty) {
                                      return 'This field cannot be empty';
                                    }
                                  },
                                )),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('Distance from campus(km)'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                    child: TextFormField(
                                  controller: _distance,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                  validator: (String? val) {
                                    if (val!.isEmpty) {
                                      return 'This field cannot be empty';
                                    }
                                  },
                                )),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('Rent Per month(GHc)'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                    child: TextFormField(
                                  controller: _rentPerMonth,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                  validator: (String? val) {
                                    if (val!.isEmpty) {
                                      return 'This field cannot be empty';
                                    }
                                  },
                                )),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('Rent Per annum(GHc)'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                    child: TextFormField(
                                  controller: _rentPerAnnum,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                  validator: (String? val) {
                                    if (val!.isEmpty) {
                                      return 'This field cannot be empty';
                                    }
                                  },
                                )),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: TextButton(
                                  onPressed: () => onSumbitAllowance(context),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.blue[800]),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 20),
                                    child: Text(
                                      'submit',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 23),
                                    ),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
