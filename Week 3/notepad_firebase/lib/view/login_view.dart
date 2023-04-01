import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notepad_firebase/utils/routes/route_names.dart';
import 'package:notepad_firebase/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../resources/components/round_button.dart';
import '../utils/utils.dart';

class Login_view extends StatefulWidget {
  const Login_view({Key? key}) : super(key: key);

  @override
  State<Login_view> createState() => _Login_viewState();
}

class _Login_viewState extends State<Login_view> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  FocusNode emailFocusnode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

    passwordFocusNode.dispose();
    emailFocusnode.dispose();

    _obsecurePassword.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<Auth_view_model>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Image(
                    height:200,
            width: 200,
            image: AssetImage('assets/logo2.png')),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.04),
                  child: const Text('Welcome to Mr Notepad', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: TextFormField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocusnode,
                    onFieldSubmitted: (value){
                      Utils.fieldFoucsChange(context, emailFocusnode, passwordFocusNode);
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter username',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)

                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)

                      ),
                    ),
                  ),
                ),

                ValueListenableBuilder(valueListenable: _obsecurePassword,
                    builder: (context, value, child){
                      return  TextFormField(
                        controller: _passwordcontroller,
                        obscureText: _obsecurePassword.value,
                        obscuringCharacter: '*',
                        focusNode: passwordFocusNode,
                        decoration: InputDecoration(
                          hintText: 'Enter password',
                          prefixIcon: Icon(Icons.lock_open),
                          suffixIcon: InkWell (
                              onTap: () {
                                _obsecurePassword.value = !_obsecurePassword.value;
                              },
                              child: _obsecurePassword.value ? const Icon(Icons.visibility_off) :
                              const Icon(Icons.visibility)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)

                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)

                          ),
                        ),
                      );
                    }),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Forgot password?', style: TextStyle(fontSize: 16, color: Color(0xff7B7B7B),
                      ),),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Round_Button(title: 'Log In',
                    loading: Auth_view_model.loading,
                    onpress: (){
                      if(_emailcontroller.text.isEmpty){
                        Utils.snackBar("please enter email", context);
                      } else if(_passwordcontroller.text.isEmpty){
                        Utils.snackBar("please enter password", context);

                      }else if(_passwordcontroller.text.length < 6){
                        Utils.snackBar("please enter 6 digit password", context);

                      }else{
                        _auth.signInWithEmailAndPassword(
                            email: _emailcontroller.text.toString(),
                            password: _passwordcontroller.text.toString()).then((value) {
                              Utils.toastMessage('Login Succesful');
                              Navigator.pushReplacementNamed(context, RouteNames.Home);
                        }).onError((error, stackTrace) {
                          Utils.toastMessage(error.toString());
                        });

                      }

                    }),

                Padding(
                  padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.052),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Sign-in with', style: TextStyle(fontSize: 14),),
                    ],
                  ),
                ),



                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text('Dont have an account?'),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, RouteNames.SignUp);
                      },
                      child: Text('Create One',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline ),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
