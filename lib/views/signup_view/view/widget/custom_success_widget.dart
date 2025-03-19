// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class CustomSuccessWidget extends StatelessWidget {
  const CustomSuccessWidget({
    Key? key,
    required this.contextt,
    required this.succmsg,
  }) : super(key: key);
final BuildContext contextt;
final String succmsg;
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
                  text: 'Success Dialog',
                  color: Colors.green,
                  pressEvent: () {
                    AwesomeDialog(
                      context: contextt,
                      animType: AnimType.leftSlide,
                      headerAnimationLoop: false,
                      dialogType: DialogType.success,
                      showCloseIcon: true,
                      title: 'Succes',
                      desc:
                          succmsg,
                      btnOkOnPress: () {
                        debugPrint('OnClcik');
                      },
                      btnOkIcon: Icons.check_circle,
                      onDismissCallback: (type) {
                        debugPrint('Dialog Dissmiss from callback $type');
                      },
                    ).show();
                  },
                );
  }
}
