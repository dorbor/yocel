import 'package:flutter/material.dart';
import 'package:yocel/screens/questions.dart';


class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('YOCEL GBV Case '),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Submit a Case ',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
//                  child: TextField(
//                    controller: nameController,
//                    decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                      labelText: 'User Name',
//                    ),
//                  ),
//                  flex: 3,
                  child: Image(
                    image: AssetImage('images/yocel.jpg'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
//                  child: TextField(
//                    obscureText: true,
//                    controller: passwordController,
//                    decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                      labelText: 'Password',
//                    ),
//                  ),
                ),
//                FlatButton(
//                  onPressed: (){
//                    //forgot password screen
//                  },
//                  textColor: Colors.blue,
//                  child: Text('Forgot Password'),
//                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Report a New Case'),
                      onPressed: () {
//                        print(nameController.text);
//                        print(passwordController.text);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Questions(),
                          ),
                        );
                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Powared By MrRichards'),
//                        FlatButton(
//                          textColor: Colors.blue,
//                          child: Text(
//                            'Sign in',
//                            style: TextStyle(fontSize: 20),
//                          ),
//                          onPressed: () {
//                            //signup screen
//                          },
//                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))


              ],
            )));
  }
}