import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sepet/setting/setting_cotroller.dart';
import 'package:sepet/setting/setting_model.dart';

class Seting extends StatefulWidget {
  const Seting({super.key});

  @override
  State<Seting> createState() => _SetingState();
}

class _SetingState extends State<Seting> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameEditingController = TextEditingController();
  final FocusNode _userNameFocusNode = FocusNode();

  final TextEditingController _passwordEditingController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  final model = SettingModel();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ayarlar'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: const Key('username'),
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
                  suffixIcon: GestureDetector(
                      onTap: () {
                        _userNameEditingController.clear();
                      },
                      child: const Icon(Icons.clear)),
                ),
                controller: _userNameEditingController,
                keyboardType: TextInputType.number,
                onSaved: (newValue) => model.name = newValue,
                focusNode: _userNameFocusNode,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocusNode),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kullanıcı adı boş olamaz';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: const Key('password'),
                decoration: InputDecoration(
                  labelText: 'Sifre',
                  suffixIcon: GestureDetector(
                      onTap: () {
                        _passwordEditingController.clear();
                      },
                      child: const Icon(Icons.clear)),
                ),
                controller: _passwordEditingController,
                focusNode: _passwordFocusNode,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_userNameFocusNode),
                keyboardType: TextInputType.number,
                onSaved: (newValue) => model.password = newValue,
                obscureText: true,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Active'),
                  Consumer(
                    builder: (context, ref, _) {
                      final isActive = ref.watch(settingCotrollerProvider.select((value) => value.isActive));
                      return Switch(
                          value: isActive,
                          onChanged: (value) {
                            ref.read(settingCotrollerProvider).isActive = value;
                          });
                    },
                  ),
                ],
              ),
              Consumer(
                builder: (context, ref, _) {
                  final drpValue = ref.watch(settingCotrollerProvider.select((value) => value.drpValue));
                  return DropdownButtonFormField<int>(
                    key: const Key('dropdown'),
                    value: drpValue, //model.selectedValue,
                    items: const <DropdownMenuItem<int>>[
                      DropdownMenuItem(
                        value: 1,
                        child: Text('Ali'),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text('Veli'),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text('Deli'),
                      )
                    ],
                    onChanged: (value) {
                      ref.read(settingCotrollerProvider).drpValue = value;
                    },
                  );
                },
              ),
              TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print(model.name);
                    }
                  },
                  child: const Text('Kaydet'))
            ],
          ),
        ),
      ),
    );
  }
}
