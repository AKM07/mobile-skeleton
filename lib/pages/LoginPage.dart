import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_skeleton/bloc/LoginBloc.dart';
import 'package:mobile_skeleton/model/LoadApiStatus.dart';
import 'package:mobile_skeleton/model/response/BaseResponse.dart';
import 'package:mobile_skeleton/model/response/LoginResponse.dart';
import 'package:mobile_skeleton/utils/SizeUtil.dart';

import '../constants/Constants.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String email, password;
  bool obscureText = true;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoggingIn = false;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      bloc.doLogin(email, password);
    }
  }

  Widget buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        loginButton(),
        SizedBox(
          height: 5,
        ),
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget loginButton() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(17.0),
        onPressed: () {
          submit();
        },
        child: Text(
          "Masuk",
          style: TextStyle(
            color: Color(Constants.appMainColor),
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
            side: BorderSide(color: Color(Constants.appMainColor))),
      ),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeUtil().init(context);
    double defaultSize = SizeUtil.defaultSize;
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: defaultSize * 40,
              width: SizeUtil.screenWidth,
              decoration: BoxDecoration(
                color: Color(Constants.appMainColor),
              ),
            ),
            SafeArea(
                child: Form(
              key: formKey,
              child: Container(
                width: SizeUtil.screenWidth,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(vertical: 150),
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    width: SizeUtil.screenWidth,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/dragon_logo_white.png",
                          height: 150,
                          width: 150,
                        ),
                        TextFormField(
                          showCursor: true,
                          onSaved: (val) => email = val,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            return val.length > 0
                                ? null
                                : "Email tidak boleh kosong.";
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                color: Color(Constants.appMainColor),
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            prefixIcon: Icon(
                              FeatherIcons.user,
                              color: Color(0xFF666666),
                            ),
                            fillColor: Color(0xFFF2F3F5),
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                            ),
                            hintText: "Email",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          showCursor: true,
                          onSaved: (val) => password = val,
                          keyboardType: TextInputType.text,
                          obscureText: obscureText,
                          validator: (val) {
                            return val.length > 0
                                ? null
                                : "Kata Sandi tidak boleh kosong.";
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                color: Color(Constants.appMainColor),
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            prefixIcon: Icon(
                              FeatherIcons.lock,
                              color: Color(0xFF666666),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: toggle,
                              child: Icon(
                                obscureText
                                    ? FeatherIcons.eyeOff
                                    : FeatherIcons.eye,
                                color: Color(0xFF666666),
                              ),
                            ),
                            fillColor: Color(0xFFF2F3F5),
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                            ),
                            hintText: "Kata Sandi",
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        StreamBuilder(
                            stream: bloc.subject.stream,
                            builder: (context,
                                AsyncSnapshot<BaseResponse<LoginResponse>>
                                    snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data.loadStatus ==
                                    LoadApiStatus.LOADING) {
                                  return CircularProgressIndicator(
                                      backgroundColor:
                                          Color(Constants.appMainColor));
                                } else if (snapshot.data.loadStatus ==
                                    LoadApiStatus.COMPLETED) {
                                  if (snapshot.data.status == "error" &&
                                      snapshot.data.data == null &&
                                      snapshot.data.data.length == 0) {
                                    return buildErrorWidget(
                                        snapshot.data.message);
                                  } else {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil('/home',
                                              (Route<dynamic> route) => false);
                                    });
                                  }
                                } else if (snapshot.data.loadStatus ==
                                    LoadApiStatus.ERROR) {
                                  return buildErrorWidget(snapshot.error);
                                }
                                return Container();
                              } else if (snapshot.hasError) {
                                return buildErrorWidget(snapshot.error);
                              } else {
                                return loginButton();
                              }
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Tidak mempunyai akun? ",
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => RegisterPage()),
                                // )
                              },
                              child: Container(
                                child: Text(
                                  "Daftar",
                                  style: TextStyle(
                                    color: Color(0xFF6d4c41),
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
