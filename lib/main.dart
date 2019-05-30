import 'package:http/http.dart' as http;
import 'package:flutter_web/material.dart';
import 'package:flutter_web/material.dart' as prefix0;
import 'package:notexfrontend/user.dart';

void main() => runApp(NoteX());

class NoteX extends StatefulWidget {
  NoteX({Key key}) : super(key: key);

  _NoteXState createState() => _NoteXState();
}

class _NoteXState extends State<NoteX> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AuthenticationPage(),
      ),
    );
  }
}

class AuthenticationPage extends StatefulWidget {
  AuthenticationPage({Key key}) : super(key: key);

  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {

  //Declaring variables and instances of classes.
  final formKey = new GlobalKey<FormState>();
  UserData userData = new UserData();
  String name;
  String username;
  var progress = 0;
  bool _isobs = true;
  Color _eyeBC = Colors.grey;
  var t = 'random string';

  //Declaring functions
  _submit() async{
    var url = 'http://127.0.0.1:8000/notex/userList/?username=skullcrushersss&password=helloxssss';
    var response = await http.post(url);
    print(response.statusCode);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
      var screenWidth = MediaQuery.of(context).size.width;
      var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Row(children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                width: screenWidth/2,
                height: double.infinity,
                child: Image(
                  image: AssetImage("images/pexels-photo-583846.jpeg"),
                  fit: BoxFit.cover,
                  color: Colors.black54,
                  colorBlendMode: BlendMode.darken,
                )
              ),
              Container(
                width: screenWidth/2,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 100.0,
                    left: 50.0,
                    right: 50.0
                  ),
                  child: Center(
                    child :Column(children: <Widget>[
                      prefix0.Text("Plan your activities and control your activities across all devices",style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontFamily: 'Open Sans',
                      fontSize: 30.0),
                      textAlign: TextAlign.center,)
                    ],)
                  ),
                ),
              ),
            ],
          ),
        ),
       Container(
          padding : const EdgeInsets.all(50.0),
          width: MediaQuery.of(context).size.width /2,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0XFF2F3D4E)
          ),
          child : Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){},
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontFamily: 'Open Sans'
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text("Or",style:TextStyle(
                    fontSize: 28.0,
                    color: Colors.grey.shade400,
                    fontFamily: 'Open Sans'
                  )),
                  SizedBox(
                    width: 15.0,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Open Sans',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                    height: 20.0,
                  ),
              Form(
                autovalidate: true,
                key: formKey,
                      child: new Theme(
                        data: new ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.teal,
                          inputDecorationTheme: InputDecorationTheme(
                            labelStyle: new TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontFamily: 'Open Sans'
                            )
                          )
                        ),
                child: new Container(
                  height: screenHeight*0.5,
                  alignment: Alignment.center,
                            //padding: new EdgeInsets.symmetric(horizontal:35.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new TextFormField(
                                  decoration: new InputDecoration(
                                    labelText: "FULL NAME",
                                  ),
                                  validator: (val)=>val.isEmpty || val.substring(0)==null?'Names field is empty':null,
                                  keyboardType: TextInputType.text,
                                  onSaved: (val) => userData.displayName = val,
                                ),
                                new TextFormField(
                                  decoration: new InputDecoration(
                                    labelText: "USERNAME"
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator: (val)=>val.isEmpty || val.substring(0)==null?'Password field is empty':null,
                                  onSaved: (val)=> userData.uid = val,
                                ),
                                new TextFormField(
                                  decoration: new InputDecoration(
                                    labelText: "E-MAIL"
                                  ),
                                  validator: (val)=>!val.contains('@')?'Invalid E-mail':null,
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (val)=> userData.email = val,
                                ),
                                new TextFormField(
                                  decoration: new InputDecoration(
                                    labelText: "PASSWORD",
                                    suffixIcon: IconButton(
                                    onPressed: (){
                                    if(_isobs)
                                    {
                                      setState(() {
                                      _isobs = false;
                                      _eyeBC = Theme.of(context).primaryColor;
                                    });
                                    }
                                    else
                                    {
                                      setState(() {
                                      _isobs = true;
                                      _eyeBC = Colors.grey;
                                    });
                                    }
                                  },
                                  icon: Icon(Icons.remove_red_eye,color: _eyeBC,),
                                  ),
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator: (val)=>val.isEmpty || val.substring(0)==null?'Password field is empty':null,
                                  onSaved: (val)=> userData.password = val,
                                  obscureText: _isobs,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.all(15.0),
                                ),
                                new RaisedButton(
                                  onPressed: (){
                                    _submit();
                                    print('elll');
                                  },
                                  padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
                                  child: new Text("Sign up",style: TextStyle(
                                    fontSize: 17.0,
                                    fontFamily: 'Open Sans'
                                  ),),
                                  highlightColor: Colors.tealAccent,
                                  splashColor: Colors.white,
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                                ),
                                Text(
                                  t
                                ),
                          ],
                        ),
                    ),
              ))
            ],
          ),)
        ), 
      ],),
    );
  }
}

