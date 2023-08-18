import 'package:flutter/material.dart';
import 'package:flutter_localization/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Locale _currentLocale = const Locale('en');
  bool _obscureText = true;
  final TextEditingController _userIdController = TextEditingController(text: "users1");
  final TextEditingController _passwordController = TextEditingController(text: "users1Sifre");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Text(S.of(context).change_language),
              PopupMenuButton<Locale>(
                onSelected: _changeLanguage,
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<Locale>(
                      value: Locale('en'),
                      child: Text('English'),
                    ),
                    const PopupMenuItem<Locale>(
                      value: Locale('de'),
                      child: Text('Deutsch'),
                    ),
                    const PopupMenuItem<Locale>(
                      value: Locale('fr'),
                      child: Text('French'),
                    ),
                  ];
                },
              ),
            ],
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - AppBar().preferredSize.height * 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      S.of(context).loginTitle,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      S.of(context).loginDescription,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _userIdController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: S.of(context).user_name,
                        prefixIcon: const Icon(
                          Icons.person_outline_outlined,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      autofillHints: const <String>[AutofillHints.password],
                      decoration: InputDecoration(
                        labelText: S.of(context).password,
                        prefixIcon: const Icon(Icons.password_outlined),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: _obscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                        ),
                      ),
                      obscureText: _obscureText,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () async {},
                        child: Text(
                          S.of(context).loginTitle.toUpperCase(),
                        ),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: null,
                    child: RichText(
                      text: TextSpan(
                        text: S.of(context).signup_button_text,
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: <TextSpan>[
                          TextSpan(
                            text: S.of(context).signup_button_link,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _changeLanguage(Locale newLocale) {
    setState(() {
      _currentLocale = newLocale;
      S.load(newLocale);
    });
  }
}
