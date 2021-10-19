// ignore: import_of_legacy_library_into_null_safe
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:uenr_estate/controllers/complaints_controller.dart';
import 'package:uenr_estate/helpers/dummy_data/data.dart';
import 'package:uenr_estate/widgets/form_group.dart';

class Complaint extends StatefulWidget {
  const Complaint({Key? key}) : super(key: key);

  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  final complaintsController = ComplaintsController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _building = TextEditingController();
  final TextEditingController _comment = TextEditingController();
  final TextEditingController _complaintType = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool successSubmission = false;
  onSubmitForm(BuildContext ctx) {
    var data = {
      "name": _name.text,
      "contact": _phone.text,
      "building": _building.text,
      "complaint_type": _complaintType.text,
      "location": _location.text,
      "comment": _comment.text
    };
    var form = _formKey.currentState;
    if (form!.validate()) {
      complaintsController.postComplain(success: () => show(ctx), data: data);
    }
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
                const Text('Complain successfully submitted'),
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
    _building.clear();
    _comment.clear();
    _complaintType.clear();
    _location.clear();
  }

  @override
  void dispose() {
    clearFields();

    super.dispose();
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
                    child: Text('Complaint',
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
                              FormGroup.label('Building'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                    child: DropDownField(
                                  required: true,
                                  controller: _building,
                                  items: buildings,
                                )),
                              )
                            ],
                          ),
                          FormGroup(
                            children: [
                              FormGroup.label('Complaint Type'),
                              SizedBox(
                                width: double.infinity,
                                // height: 50,
                                child: FormGroup.container(
                                    child: DropDownField(
                                  required: true,
                                  controller: _complaintType,
                                  items: complaint_types,
                                  onValueChanged: (dynamic val) {},
                                )),
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
                                            border: InputBorder.none))),
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
