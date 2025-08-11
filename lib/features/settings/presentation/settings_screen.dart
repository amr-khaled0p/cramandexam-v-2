import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/presentation/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Settings state
  bool _darkMode = true;
  bool _notifications = true;
  bool _studyReminders = false;
  String _selectedLanguage = '\u0627\u0644\u0639\u0631\u0628\u064a\u0629';
  String _selectedFontSize = '\u0645\u062a\u0648\u0633\u0637';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              "\u0627\u0644\u0625\u0639\u062f\u0627\u062f\u0627\u062a",
              style: TextStyle(fontFamily: 'Cairo')),
          backgroundColor: AppTheme.surfaceColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Account Settings Card
              _buildSettingsCard(
                title: "\u0627\u0644\u062d\u0633\u0627\u0628",
                icon: Icons.person,
                iconColor: AppTheme.primaryColor,
                children: [
                  _buildSettingsTile(
                    title:
                        "\u062a\u0639\u062f\u064a\u0644 \u0627\u0644\u0645\u0644\u0641 \u0627\u0644\u0634\u062e\u0635\u064a",
                    icon: Icons.edit,
                    iconColor: AppTheme.primaryColor,
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.white70),
                  ),
                  _buildDivider(),
                  _buildSettingsTile(
                    title:
                        "\u062a\u063a\u064a\u064a\u0631 \u0643\u0644\u0645\u0629 \u0627\u0644\u0645\u0631\u0648\u0631",
                    icon: Icons.lock,
                    iconColor: AppTheme.errorColor,
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.white70),
                  ),
                  _buildDivider(),
                  _buildSettingsTile(
                    title:
                        "\u0627\u0644\u062d\u0633\u0627\u0628\u0627\u062a \u0627\u0644\u0645\u0631\u062a\u0628\u0637\u0629",
                    icon: Icons.link,
                    iconColor: AppTheme.secondaryColor,
                    onTap: () {},
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppTheme.secondaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "2 \u062d\u0633\u0627\u0628",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppTheme.secondaryColor,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.white70),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // App Settings Card
              _buildSettingsCard(
                title: "\u0627\u0644\u062a\u0637\u0628\u064a\u0642",
                icon: Icons.settings,
                iconColor: AppTheme.warningColor,
                children: [
                  _buildSwitchTile(
                    title:
                        "\u0627\u0644\u0648\u0636\u0639 \u0627\u0644\u0644\u064a\u0644\u064a",
                    icon: Icons.dark_mode,
                    iconColor: AppTheme.warningColor,
                    value: _darkMode,
                    onChanged: (value) {
                      setState(() {
                        _darkMode = value;
                      });
                    },
                  ),
                  _buildDivider(),
                  _buildDropdownTile(
                    title: "\u0627\u0644\u0644\u063a\u0629",
                    icon: Icons.language,
                    iconColor: AppTheme.primaryColor,
                    value: _selectedLanguage,
                    items: const [
                      '\u0627\u0644\u0639\u0631\u0628\u064a\u0629',
                      'English'
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value!;
                      });
                    },
                  ),
                  _buildDivider(),
                  _buildDropdownTile(
                    title: "\u062d\u062c\u0645 \u0627\u0644\u062e\u0637",
                    icon: Icons.text_fields,
                    iconColor: AppTheme.secondaryColor,
                    value: _selectedFontSize,
                    items: const [
                      '\u0635\u063a\u064a\u0631',
                      '\u0645\u062a\u0648\u0633\u0637',
                      '\u0643\u0628\u064a\u0631'
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedFontSize = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Notifications Card
              _buildSettingsCard(
                title: "\u0627\u0644\u0625\u0634\u0639\u0627\u0631\u0627\u062a",
                icon: Icons.notifications,
                iconColor: AppTheme.errorColor,
                children: [
                  _buildSwitchTile(
                    title:
                        "\u0627\u0644\u0625\u0634\u0639\u0627\u0631\u0627\u062a",
                    icon: Icons.notifications,
                    iconColor: AppTheme.errorColor,
                    value: _notifications,
                    onChanged: (value) {
                      setState(() {
                        _notifications = value;
                      });
                    },
                  ),
                  _buildDivider(),
                  _buildSwitchTile(
                    title:
                        "\u062a\u0630\u0643\u064a\u0631\u0627\u062a \u0627\u0644\u062f\u0631\u0627\u0633\u0629",
                    icon: Icons.alarm,
                    iconColor: AppTheme.secondaryColor,
                    value: _studyReminders,
                    onChanged: _notifications
                        ? (value) {
                            setState(() {
                              _studyReminders = value;
                            });
                          }
                        : null,
                  ),
                  if (_notifications && _studyReminders) ...[
                    _buildDivider(),
                    _buildSettingsTile(
                      title:
                          "\u062c\u062f\u0648\u0644 \u0627\u0644\u062a\u0630\u0643\u064a\u0631\u0627\u062a",
                      icon: Icons.schedule,
                      iconColor: AppTheme.primaryColor,
                      onTap: () {},
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.white70),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 16),

              // Support Card
              _buildSettingsCard(
                title: "\u0627\u0644\u062f\u0639\u0645",
                icon: Icons.help,
                iconColor: AppTheme.secondaryColor,
                children: [
                  _buildSettingsTile(
                    title:
                        "\u0645\u0631\u0643\u0632 \u0627\u0644\u0645\u0633\u0627\u0639\u062f\u0629",
                    icon: Icons.help,
                    iconColor: AppTheme.secondaryColor,
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.white70),
                  ),
                  _buildDivider(),
                  _buildSettingsTile(
                    title:
                        "\u0627\u0644\u0625\u0628\u0644\u0627\u063a \u0639\u0646 \u0645\u0634\u0643\u0644\u0629",
                    icon: Icons.bug_report,
                    iconColor: AppTheme.errorColor,
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.white70),
                  ),
                  _buildDivider(),
                  _buildSettingsTile(
                    title:
                        "\u0627\u0644\u062a\u0648\u0627\u0635\u0644 \u0645\u0639 \u0627\u0644\u062f\u0639\u0645",
                    icon: Icons.support_agent,
                    iconColor: AppTheme.primaryColor,
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.white70),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // About Card
              _buildSettingsCard(
                title:
                    "\u062d\u0648\u0644 \u0627\u0644\u062a\u0637\u0628\u064a\u0642",
                icon: Icons.info,
                iconColor: AppTheme.purpleColor,
                children: [
                  _buildSettingsTile(
                    title: "\u0639\u0646 CRAM & EXAM",
                    icon: Icons.info,
                    iconColor: AppTheme.primaryColor,
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.white70),
                  ),
                  _buildDivider(),
                  _buildSettingsTile(
                    title:
                        "\u0633\u064a\u0627\u0633\u0629 \u0627\u0644\u062e\u0635\u0648\u0635\u064a\u0629",
                    icon: Icons.privacy_tip,
                    iconColor: AppTheme.warningColor,
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.white70),
                  ),
                  _buildDivider(),
                  _buildSettingsTile(
                    title:
                        "\u0634\u0631\u0648\u0637 \u0627\u0644\u0627\u0633\u062a\u062e\u062f\u0627\u0645",
                    icon: Icons.description,
                    iconColor: AppTheme.secondaryColor,
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.white70),
                  ),
                  _buildDivider(),
                  _buildSettingsTile(
                    title: "\u0627\u0644\u0625\u0635\u062f\u0627\u0631",
                    icon: Icons.android,
                    iconColor: Colors.green,
                    onTap: null,
                    trailing: const Text(
                      "1.0.0",
                      style: TextStyle(
                        color: Colors.white54,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Logout Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showLogoutConfirmationDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.logout),
                  label: const Text(
                    "\u062a\u0633\u062c\u064a\u0644 \u0627\u0644\u062e\u0631\u0648\u062c",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ),
          // Card Content
          ...children,
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required String title,
    required IconData icon,
    required Color iconColor,
    required VoidCallback? onTap,
    required Widget trailing,
  }) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Cairo',
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required IconData icon,
    required Color iconColor,
    required bool value,
    required ValueChanged<bool>? onChanged,
  }) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: onChanged == null ? Colors.white54 : Colors.white,
          fontFamily: 'Cairo',
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppTheme.primaryColor,
        activeTrackColor: AppTheme.primaryColor.withOpacity(0.3),
      ),
    );
  }

  Widget _buildDropdownTile({
    required String title,
    required IconData icon,
    required Color iconColor,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Cairo',
        ),
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: DropdownButton<String>(
          value: value,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white70),
          elevation: 16,
          style: const TextStyle(color: Colors.white, fontFamily: 'Cairo'),
          underline: Container(),
          dropdownColor: const Color(0xFF2A2A2A),
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Colors.white12,
      height: 1,
      indent: 16,
      endIndent: 16,
    );
  }

  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        title: const Text(
          '\u062a\u0633\u062c\u064a\u0644 \u0627\u0644\u062e\u0631\u0648\u062c',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          '\u0647\u0644 \u0623\u0646\u062a \u0645\u062a\u0623\u0643\u062f \u0645\u0646 \u0631\u063a\u0628\u062a\u0643 \u0641\u064a \u062a\u0633\u062c\u064a\u0644 \u0627\u0644\u062e\u0631\u0648\u062c\u061f',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white70,
            fontFamily: 'Cairo',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              '\u0625\u0644\u063a\u0627\u0621',
              style: TextStyle(
                color: Colors.white70,
                fontFamily: 'Cairo',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (Route<dynamic> route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            child: const Text(
              '\u062a\u0633\u062c\u064a\u0644 \u0627\u0644\u062e\u0631\u0648\u062c',
              style: TextStyle(fontFamily: 'Cairo'),
            ),
          ),
        ],
      ),
    );
  }
}
