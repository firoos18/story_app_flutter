import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_flutter/core/common/common.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingAppBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title:
                          Text(AppLocalizations.of(context)!.loggingOutAlert),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        TextButton(
                          onPressed: () {
                            userLogout();
                            context.goNamed("authentication");
                          },
                          child: Text(
                            AppLocalizations.of(context)!.logOutButton,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.cancelLogOut,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.redAccent,
              ),
              child: Text(
                AppLocalizations.of(context)!.logOutButton,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void userLogout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("token");
  }
}
