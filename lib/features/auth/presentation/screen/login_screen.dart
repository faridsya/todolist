import 'dart:async';



import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/core/config/extensions.dart';
import '../../../../core/config/constant.dart';
import '../../../../core/config/global.dart';
import '../../../../core/shared/widget/custom_appbar.dart';
import '../../../../core/shared/widget/form/custom_text_form_field.dart';
import '../../../../core/util/form_validator.dart';
import '../provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  late AuthProvider authOtp;
  String? _validatePassword,_validateMessageEmail;
 bool _passwordVisible=false;
  @override
  void initState() {
    // TODO: implement initState
    authOtp= Provider.of<AuthProvider>(context, listen: false);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAppBar(
        color: Colors.transparent,
        child: Text("1.0",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
        elevation: 0,
      ),
      appBar: CustomAppBar(context,back: false,),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
            horizontal: context.dp(36), vertical: context.dp(12)),
        child: SizedBox(
          height: context.dh - context.dp(100),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: context.dp(33),
                backgroundColor: context.primaryContainer,
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(height: 80,)),
              ),
              SizedBox(height: context.dp(16)),
              Text(
                'Selamat Datang',
                style: context.text.headlineMedium
                    ?.copyWith(color: context.onBackground),
              ),
              SizedBox(height: context.dp(16)),
              Text('Silahkan masukkan data anda',
                  style: context.text.titleMedium
                      ?.copyWith(color: context.hintColor)),


              SizedBox(height: context.dp(16)),
              CustomTextFormField(
                onChanged: (value) {
                  authOtp.email=value;
                  setState(() => _validateMessageEmail =
                      FormValidator.validateEmail(value));
                },
                validateMessage: _validateMessageEmail,
               // context: context,
                hintText: 'Email',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: context.dp(16)),
        Stack(children: [TextFormField(
          keyboardType: TextInputType.text,
          onChanged: (value) {
            authOtp.password=value;
            setState(() => _validatePassword =
                FormValidator.validatePassword(value));
          },
          obscureText: !_passwordVisible,//This will obscure text dynamically
          decoration: InputDecoration(
            enabledBorder: gsetBorder(),
            focusedBorder: gsetBorder(),
            errorBorder:gsetBorder(),
            hintText: 'Enter your password',
            prefixIcon: Icon(Icons.password),
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },

            ),
          ),

        ),
          if (_validatePassword != null && _validatePassword != '')
            Positioned.fill(
              left: 12,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  _validatePassword!,
                  style: const TextStyle(color: Colors.red, fontSize: 11),
                ),
              ),
            ),],),
              SizedBox(height: context.dp(16)),
              SizedBox(height: context.dp(26)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => _lanjutOnClick(context),
                    child: const Text('Masuk')),
              ),

              RichText(
                text: TextSpan(
                  text: 'Belum punya akun?',
                  style: context.text.labelMedium
                      ?.copyWith(color: context.hintColor),
                  children: [
                    TextSpan(
                        text: ' Klik Disini',
                        style: context.text.labelSmall
                            ?.copyWith(color: context.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushNamed(
                              context, Constant.kRouteDaftarScreen)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _lanjutOnClick(BuildContext context) async {
    bool _berhasil=false;

    if (_validatePassword != '' ) return;
    if (_validateMessageEmail != '' ) return;

    FocusScope.of(context).unfocus();

    Map<String, dynamic> response=await authOtp.login();
    if (!response["hasil"]) {

      return;
    }
    else {
      //KreasiSecureStorage.simpanDataLokal();


     // Navigator.pushReplacementNamed(context, Constant.kRouteHomeScreen);
      Navigator.pushNamedAndRemoveUntil(
          context, Constant.kRouteHomepageScreen, (route) => false);
    }



  }

   tologin(bool va){
    if(va) {
      Navigator.pushNamedAndRemoveUntil(
        context, Constant.kRouteHomeScreen, (route) => false);
    }
  }

}
