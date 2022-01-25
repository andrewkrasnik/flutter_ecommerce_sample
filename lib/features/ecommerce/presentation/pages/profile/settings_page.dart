import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/password_change_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/settings_switch_row.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/text_input_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/search_bar_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool salesNotification = false;
  bool newNotification = false;
  bool deliveryNotification = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
            backgroundColor: AppColors.mainColor,
            border: null,
            trailing: SearchBarButton()),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              child: Material(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 64,
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    const Text(
                      "Personal Information",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    TetxInputWidget(title: "Full name", text: ""),
                    TetxInputWidget(title: "Date of Birth", text: ""),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (currentContext) {
                                    return PasswordChangeWidget();
                                  });
                            },
                            child: const Text(
                              "Change",
                              style: TextStyle(color: AppColors.grayText),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 21,
                    ),
                    TetxInputWidget(title: "Password", text: ""),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Notifacations",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    SettingsSwitchRow(
                      title: "Sales",
                      value: salesNotification,
                      onChanged: (value) {
                        setState(() {
                          salesNotification = value;
                        });
                      },
                    ),
                    SettingsSwitchRow(
                      title: "New arrivals",
                      value: newNotification,
                      onChanged: (value) {
                        setState(() {
                          newNotification = value;
                        });
                      },
                    ),
                    SettingsSwitchRow(
                      title: "Delivery status changes",
                      value: deliveryNotification,
                      onChanged: (value) {
                        setState(() {
                          deliveryNotification = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
