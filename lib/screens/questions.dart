import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:yocel/screens/login.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  String fullName;
  String id;
  String selectItem;
  String district;
  String resident;
  String community;
  String ageGroup;
  String gender;
  String number;
  String education;
  String maritalStatus;



//  String gender;
  String gbvIncident;
  String kindOfGbvIncident;
  String wasItHandled;
  String reasonOfGbvIncident;
  String victimAge;
  String victimGender;
  String victimParent;

//  covid 19 awareness of Gender Base Violence
  String gbvHotLine;
  String covid19HealthMeasure;
  String heardOfGbv;
  String gbvAwarenessMedium;
  String isCovid19Reason;
  String whyCovid19;
  String latitude;
  String longitude;
  String createdAt;



  Future<void> _getLocation() async {
    final locData = await Location().getLocation();
    //print(locData.latitude);
    setState(() {
      latitude = locData.latitude.toString();
      longitude = locData.longitude.toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('YOCEL GBV Questions'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[100]))
                  ),
                  child: TextField(
                    onChanged: (value){
                      fullName = value;
                      _getLocation();
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Your Name",
                        hintStyle: TextStyle(color: Colors.grey[400])
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[100]))
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      id = value;

                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "User Id",
                        hintStyle: TextStyle(color: Colors.grey[400])
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.near_me, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'Bomi',
                        'Bong',
                        'Gbarpolu',
                        'Grand Bassa',
                        'Grand Cape Mount',
                        'Grand Gedeh',
                        'Grand Kru',
                        'Lofa',
                        'Margibi',
                        'Maryland',
                        'Montserrado',
                        'Nimba',
                        'Rivercess',
                        'River Gee',
                        'Sinoe'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectItem = value;
                        });
                      },
                      value: selectItem,
                      isExpanded: false,
                      hint: Text('Select County',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[100]))
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      district = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Distric 4",
                        hintStyle: TextStyle(color: Colors.grey[400])
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.home, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'Rural',
                        'Urban'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          resident = value;
                        });
                      },
                      value: resident,
                      isExpanded: false,
                      hint: Text('Resident Type',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[100]))
                  ),
                  child: TextField(
                    onChanged: (value){
                      community = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Community Name",
                        hintStyle: TextStyle(color: Colors.grey[400])
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.people, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'Male',
                        'Female'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                      value: gender,
                      isExpanded: false,
                      hint: Text('Select Gender',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),//Gender
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.near_me, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        '18 - 24',
                        '25 - 35',
                        '35 - 55',
                        '55 - 75'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          ageGroup = value;
                        });
                      },
                      value: ageGroup,
                      isExpanded: false,
                      hint: Text('Select Age Group',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),  //age range
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[100]))
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      number = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Phone Number",
                        hintStyle: TextStyle(color: Colors.grey[400])
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.attach_file, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'Not Educated',
                        'High School Diploma',
                        'College/University Degree',
                        'Vocational Training',
                        'High School DropOut'

                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          education = value;
                        });
                      },
                      value: education,
                      isExpanded: false,
                      hint: Text('Educational Level',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),//Education
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.wc, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'Single',
                        'Married',
                        'Divorced'

                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          maritalStatus = value;
                        });
                      },
                      value: maritalStatus,
                      isExpanded: false,
                      hint: Text('Select Gender',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),


                Container(
                  padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
                  child: Text('Gbv Information Sections')
                ),



                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text('Have you experienced or been aware of incidents regarding Gender Based Violence and abuse within your community? Yes/No')
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.rounded_corner, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'Yes',
                        'No'

                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          gbvIncident = value;
                        });
                      },
                      value: gbvIncident,
                      isExpanded: false,
                      hint: Text('Select Yes or No',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),


                //kind of gbv
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text('What kind of Gender Based Violence Case was it?')
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.rounded_corner, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'None',
                        'Sexual Violance',
                        'Domestic Violance',
                        'Corporal Punishment',
                        'Child Abuse'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          kindOfGbvIncident = value;
                        });
                      },
                      value: kindOfGbvIncident,
                      isExpanded: false,
                      hint: Text('Select Kind',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),


                //How was the case henddle
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text('How was the case (s) handled?')
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.rounded_corner, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'Not at All',
                        'By the Police',
                        'By the Court',
                        'Community Way',
                        'Family Way'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          wasItHandled = value;
                        });
                      },
                      value: wasItHandled,
                      isExpanded: false,
                      hint: Text('How was it handled?',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),

                //reason the person was abuse
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text('What do you think was the reason while the person was abused?')
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.rounded_corner, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'Not at All',
                        'Because of Dresscode',
                        'Poverty',
                        'Single Parenting',
                        'Low Public Awareness'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          reasonOfGbvIncident = value;
                        });
                      },
                      value: reasonOfGbvIncident,
                      isExpanded: false,
                      hint: Text('Select Reason',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),


                //Age range of the person
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text('What was the age category of the Abuse Person in question?')
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.rounded_corner, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        '5 - 17',
                        '18 - 35',
                        '35 - 70'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          victimAge = value;
                        });
                      },
                      value: victimAge,
                      isExpanded: false,
                      hint: Text('Victim age range',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),



                //Gender of the victim
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text('What was the gender of the abuse person?')
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.wc, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'Male',
                        'Female'

                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          victimGender = value;
                        });
                      },
                      value: victimGender,
                      isExpanded: false,
                      hint: Text('Select Victim Gender',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),//Gender



                //Who is the victim living with?
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text('Who was the parent of the abuse person?')
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.rounded_corner, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'i Do not Know',
                        'Parents',
                        'Guardian',
                        'Relatives'

                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          victimParent = value;
                        });
                      },
                      value: victimParent,
                      isExpanded: false,
                      hint: Text('Victim Guardian',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),//Gender



                //-------------------------------------


                Container(
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
                    child: Text('Community Awareness of GBV during COVID-19')
                ),


                //GBV hotline for reporting cases
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text('Do you know there is a GBV hotline for reporting cases?')
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.rounded_corner, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'No ',
                        'Yes'

                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          gbvHotLine = value;
                        });
                      },
                      value: gbvHotLine,
                      isExpanded: false,
                      hint: Text('Select Yes or No',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),//Gender



                //What are the key COVID-19 heath measures you experience
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text('What are the key COVID-19 heath measures you experience or observe people practicing in your community?')
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.rounded_corner, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'Hand Washing ',
                        'Wearing of Face Mask/Shield',
                        'Phisical Distancing'

                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          covid19HealthMeasure = value;
                        });
                      },
                      value: covid19HealthMeasure,
                      isExpanded: false,
                      hint: Text('Covid19 Measure',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),//Gender



                //awareness of GBV in your community?'
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text('Have you listen, observe community mobilizer creating awareness of GBV in your community?')
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.rounded_corner, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'No ',
                        'Yes'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          heardOfGbv = value;
                        });
                      },
                      value: heardOfGbv,
                      isExpanded: false,
                      hint: Text('Select Yes or No',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),// gbv awareness

                //awareness of GBV in your community?'
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text('By what medium did you heard or Read of such awareness?')
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.rounded_corner, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'None',
                        'Radio',
                        'Television',
                        'Social Media',
                        'Community Mobilizer'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          gbvAwarenessMedium = value;
                        });
                      },
                      value: gbvAwarenessMedium,
                      isExpanded: false,
                      hint: Text('Gbv Awareness Medium',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),//awareness medium


                //is covid19 the key reasons why GBV is happening?
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text('Do you think that COVID-19 are some of the key reasons why GBV is happening?')
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.rounded_corner, size: 25.0, color: Colors.black,),
                    DropdownButton<String>(
                      items: <String>[
                        'No ',
                        'Yes'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          isCovid19Reason = value;
                        });
                      },
                      value: isCovid19Reason,
                      isExpanded: false,
                      hint: Text('Select Yes or No',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),// gbv awareness
















                Container(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 30),

                  child: TextField(
                    onChanged: (value){
                      whyCovid19 = value;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "If yes why do you think so? (Explaination: 100 Words*** )",
                        hintStyle: TextStyle(color: Colors.grey[400])
                    ),
                  ),
                ),











                // Save button
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: FlatButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Save'),
                      onPressed: () async {
                        print(latitude);
                        print(longitude);
                        _getLocation();


                        // send information to web server

                        var url = 'https://yocel.herokuapp.com/api/post';

                        var response = await http.post(url,
                            body: {
                              'fullName': fullName,
                              'id': id,
                              'county': selectItem,
                              'district':  district,
                              'resident': resident,
                              'community': community,

                              'sex': gender,
                              'ageGroup': ageGroup,
                              'cellNumber': number,
                              'education': education,
                              'maritalStatus': maritalStatus,


                              'gbvIncident': gbvIncident,
                              'kindOfGbvIncident': kindOfGbvIncident,
                              'wasItHandled': wasItHandled,
                              'reasonOfGbvIncident': reasonOfGbvIncident,
                              'gbvIncidentAge': victimAge,
                              'gbvIncidentGender': victimGender,
                              'gbvVictimsParent': victimParent,

//  covid 19 awareness of Gender Base Violence
                              'gbvHotLine': gbvHotLine,
                              'covid19HealthMeasure': covid19HealthMeasure,
                              'heardOfGbv': heardOfGbv,
                              'gbvAwarenessMedium': gbvAwarenessMedium,
                              'isCovid19Reason': isCovid19Reason,
                              'whyCovid19': whyCovid19,
                              'latitude': latitude,
                              'longitude': longitude
                            });
                        print(response);
                        print('Response status: ${response.statusCode}');

                        Fluttertoast.showToast(
                            msg: "Your case was Successfully Sent",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              LoginPage()),
                        );


                      },
                    )),


              ],
            )));
  }
}
