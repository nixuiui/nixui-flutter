import 'package:flutter/material.dart';
import 'package:nixui/widgets/nixui.dart';

class FormFieldBasicScreen extends StatefulWidget {
  const FormFieldBasicScreen({super.key});

  @override
  State<FormFieldBasicScreen> createState() => _FormFieldBasicScreenState();
}

class _FormFieldBasicScreenState extends State<FormFieldBasicScreen> {

  var showAll = false;
  var obsecure = true;
  var checked = true;
  var controller = TextEditingController();
  var result = '';

  final options = <String>[
    'Messi',
    'Cristiano Ronaldo Eloko gonxales Eloko gonxales ',
  ];
  String? selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("NxTextFormField Widget"),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 16, right: 16, bottom: 64, left: 16),
          children: [
            NxTextFormField.stepper(
              label: NxText.small('Default TextField'),
              hintText: '0',
              controller: controller,
              onChanged: (value) => setState(() => result = value),
            ),
            SizedBox(height: 16),
            NxTextFormField(
              label: NxText.small('Number'),
              textColor: Colors.green,
              inputType: TextInputType.number,
            ),
            SizedBox(height: 16),
            NxTextFormField(
              label: NxText.small('Email'),
              inputType: TextInputType.emailAddress,
              prefix: Icon(
                Icons.email,
                size: 18,
              ),
            ),
            SizedBox(height: 16),
            NxTextFormField(
              label: NxText.small('Password'),
              inputType: TextInputType.visiblePassword,
              controller: TextEditingController()..text = 'password',
              obsecure: obsecure,
              prefix: Icon(
                Icons.lock_rounded,
                size: 18,
              ),
              suffix: Icon(
                obsecure ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                size: 18,
              ),
              suffixClicked: () => setState(() => obsecure = !obsecure),
            ),
            SizedBox(height: 16),
            NxTextFormField(
              label: NxText.small('Read Only'),
              controller: TextEditingController()..text = '#USERID',
              readonly: true,
            ),
            SizedBox(height: 16),
            NxTextFormField(
              label: NxText.small('Disabled'),
              controller: TextEditingController()..text = 'user@gmail.com',
              enable: false,
            ),
            SizedBox(height: 16),
            NxTextFormField(
              label: NxText.small('Disabled Readonly'),
              controller: TextEditingController()..text = 'user@gmail.com',
              enable: false,
              readonly: 
              true,
            ),
            SizedBox(height: 16),
            NxTextFormField(
              label: NxText.small('Error State'),
              errorText: 'Please fill text field',
              errorIcon: Icon(Icons.info_rounded),
            ),
            SizedBox(height: 16),
            NxTextFormField(
              label: NxText.small('Success State'),
              controller: TextEditingController()..text = 'Correct',
              successText: 'Please fill text field',
              successIcon: Icon(Icons.info_rounded),
            ),
            SizedBox(height: 16),
            NxTextFormField.multiLine(
              label: NxText.small('Multiline'),
              hintText: 'Address',
              controller: TextEditingController()..text = '',
            ),
            SizedBox(height: 16),
            NxTextFormField<String>.dropdownList(
              items: options,
              value: selected,
              hintText: 'Select Favorit Player',
              valueLabel: (v) => v,
              onChanged:(v) {
                setState(() => selected = v);
              },
            ),
            SizedBox(height: 16),
            NxCheckbox(
              size: 20,
              checked: checked,
              space: 12,
              onTap: (val) => setState(() => checked = !checked),
              child: NxText('sss'),
            ),
          ],
        ),
      ),
    );
  }
}