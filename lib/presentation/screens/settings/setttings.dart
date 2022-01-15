import 'package:flutter/material.dart';
import 'package:virus_scan/config/valuenotif.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final AppNotifier _appNotifier = AppNotifier();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "News",
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 14, 16, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "General",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(height: 10),
                ValueListenableBuilder(
                  valueListenable: AppNotifier.appTheme,
                  builder: (context, build, child) {
                    return SettingsTile(
                      heading: "Theme Preference",
                      trailing: true,
                      subheading: "Dark Theme",
                      onChanged: (value) {
                        _appNotifier.changeTheme(value);
                      },
                      value: AppNotifier.appTheme.value,
                    );
                  },
                ),
                const SettingsTile(
                  heading: "Hide Apps To VT",
                  trailing: false,
                ),
                const SettingsTile(
                  heading: "Rate VirusTotal Mobile",
                  trailing: false,
                  subheading:
                      r"Enjoying the app? We’d love to get your rating.",
                ),
                const SettingsTile(
                  heading: "Blogs Info",
                  trailing: false,
                  subheading: "Information from news publishers",
                ),
                const SettingsTile(
                  heading: "View privacy policy",
                  trailing: false,
                ),
                const SettingsTile(
                  heading: "About",
                  trailing: false,
                ),
                const Divider(
                  thickness: 1.2,
                ),
                const SizedBox(height: 10),
                Text(
                  "Notifications",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SettingsTile(
                  heading: "New Message and Notifications",
                  trailing: true,
                  onChanged: (value) {},
                ),
                SettingsTile(
                  heading: "Sound and Vibrate",
                  trailing: true,
                  onChanged: (value) {},
                ),
                const Divider(
                  thickness: 1.2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String heading;
  final String? subheading;
  final bool trailing;
  final bool? value;
  final Function(bool)? onChanged;
  const SettingsTile({
    Key? key,
    required this.heading,
    this.subheading,
    required this.trailing,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        heading,
        style: Theme.of(context).textTheme.headline4!.copyWith(
              fontSize: 17,
            ),
      ),
      subtitle: subheading != null
          ? Text(
              subheading!,
              style: Theme.of(context).textTheme.subtitle1,
            )
          : null,
      trailing: trailing
          ? Switch(
              value: value ?? false,
              onChanged: onChanged,
            )
          : const SizedBox(),
    );
  }
}
