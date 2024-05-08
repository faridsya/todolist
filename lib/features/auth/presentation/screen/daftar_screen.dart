import 'dart:async';



import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/core/config/extensions.dart';
import '../../../../core/config/constant.dart';


import '../../../../core/config/dialog.dart';
import '../../../../core/config/global.dart';
import '../../../../core/shared/widget/custom_appbar.dart';
import '../../../../core/shared/widget/form/custom_text_form_field.dart';
import '../../../../core/util/form_validator.dart';
import '../provider/auth_provider.dart';

class DaftarScreen extends StatefulWidget {
  const DaftarScreen({Key? key}) : super(key: key);

  @override
  State<DaftarScreen> createState() => _DaftarScreenState();
}

class _DaftarScreenState extends State<DaftarScreen> {
  late AuthProvider authOtp;
  String? _validatePassword,_validateUsername,_validateMessageEmail;

  @override
  void initState() {
    // TODO: implement initState
    authOtp= Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
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
                    child: Container(height: 100,)),
              ),
              SizedBox(height: context.dp(16)),
              Text(
                'Informasi Pendaftaran',
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
                  authOtp.username=value;
                  setState(() => _validateUsername =
                      FormValidator.validateusername(value));
                },
               // context: context,
                validateMessage: _validateUsername,
                hintText: 'Username ',
                prefixIcon: const Icon(Icons.perm_identity_rounded),
                textInputAction: TextInputAction.next,
              ),
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
              CustomTextFormField(
                onChanged: (value) {
                  authOtp.password=value;
                  setState(() => _validatePassword =
                      FormValidator.validatePassword(value));
                },
               // context: context,
                hintText: 'Password',
                prefixIcon: const Icon(Icons.password),

                validateMessage: _validatePassword,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: context.dp(16)),
             /* CustomTextFormField(
                context: context,
                hintText: 'Alamat',
                onTap: () {
                  // TODO: pindah ke halaman tambah alamat
                },
                textInputAction: TextInputAction.done,
                //suffixIcon: const Icon(Icons.chevron_right_rounded),
              ),*/
              SizedBox(height: context.dp(7)),
            /*  Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: _nantiSajaOnClick,
                  child: Text('Nanti saja',
                      style: context.text.labelSmall
                          ?.copyWith(color: context.errorColor)),
                ),
              ),*/
              SizedBox(height: context.dp(26)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => _lanjutOnClick(context),
                    child: const Text('Kirim')),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _nantiSajaOnClick() {
    // TODO: onClick Nanti Saja
  }

  void _lanjutOnClick(BuildContext context) async {
    bool _berhasil=false;

    if (_validateUsername != '' ) return;
    if (_validateMessageEmail != '' ) return;
    if (_validatePassword != '' ) return;

    FocusScope.of(context).unfocus();
    var completer = Completer();
    // TODO: onClick Lanjut Button
    context.showBlockDialog(
      dismissCompleter: completer,
    );

    _berhasil=await authOtp.simpanRegistrasi();
    if(!_berhasil) {

      completer.complete();
      return;
    }
    completer.complete();


  }

   tologin(bool va){
    if(va) {
      Navigator.pushNamedAndRemoveUntil(
        context, Constant.kRouteLoginScreen, (route) => false);
    }
  }

}
