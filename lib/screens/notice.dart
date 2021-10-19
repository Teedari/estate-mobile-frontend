import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uenr_estate/controllers/notice_controller.dart';
import 'package:uenr_estate/helpers/apis/api.dart';
import 'package:uenr_estate/helpers/dummy_data/data.dart';
import 'package:uenr_estate/widgets/form_group.dart';
import 'package:http/http.dart' as http;

class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  final noticeController = NoticeController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _facility = TextEditingController();
  final TextEditingController _comment = TextEditingController();
  final TextEditingController _startDate = TextEditingController();
  final TextEditingController _endDate = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool successSubmission = false;
  onSubmitForm(BuildContext ctx) {
    var data = {
      "applicant": _name.text,
      "contact": _phone.text,
      "facility": _facility.text,
      "comment": _comment.text,
      "start_date": formatDate(_startDate.text),
      "end_date": formatDate(_endDate.text)
    };
    var form = _formKey.currentState;
    if (form!.validate()) {
      // sendData(data, ctx);
      noticeController.postNotice(success: () => show(ctx), data: data);
    }
  }

  formatDate(String _date) {
    var date = DateFormat('yyyy-mm-dd').parse(_date);
    return date.toString();
  }

  // sendData(Map<String, dynamic> data, BuildContext ctx) async {
  //   await http.post(Api.notices, body: data).then((success) {
  //     var res = jsonDecode(utf8.decode(success.bodyBytes));
  //     show(ctx);
  //   }).catchError((err) {});
  // }

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
                const Text('Notice successfully submitted'),
                TextButton(
                    onPressed: () => {},
                    child: const Text('Add New'),
                    style: TextButton.styleFrom(shadowColor: Colors.blue))
              ],
            ),
          );
        });
  }

  clearFields() {
    _name.clear();
    _phone.clear();
    _facility.clear();
    _comment.clear();
    _startDate.clear();
    _endDate.clear();
  }

  @override
  void initState() {
    super.initState();
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
                    child: Text('Notice',
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
                              FormGroup.label('Name'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                  child: TextFormField(
                                    controller: _name,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('Contact'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: _phone,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('Facility'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                    child: DropDownField(
                                  required: true,
                                  controller: _facility,
                                  items: facilities,
                                  onValueChanged: (dynamic val) {},
                                )),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('Comment'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                    child: TextFormField(
                                        controller: _comment,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none))),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('Start Date'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                    child: DateTimePicker(
                                  controller: _startDate,
                                  type: DateTimePickerType.date,
                                  dateMask: 'd MM, yyyy',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2300),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                )),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('End Date'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                  child: DateTimePicker(
                                    controller: _endDate,
                                    type: DateTimePickerType.date,
                                    dateMask: 'd MM, yyyy',
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2300),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: TextButton(
                                  onPressed: () {
                                    // print(_username.text);

                                    onSubmitForm(context);
                                  },
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
