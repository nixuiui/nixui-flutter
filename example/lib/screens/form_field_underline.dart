import 'package:flutter/material.dart';
import 'package:nixui/widgets/nixui.dart';

class FormFieldUnderlineScreen extends StatefulWidget {
  const FormFieldUnderlineScreen({super.key});

  @override
  State<FormFieldUnderlineScreen> createState() => _FormFieldUnderlineScreenState();
}

class _FormFieldUnderlineScreenState extends State<FormFieldUnderlineScreen> {

  var showAll = false;
  var obsecure = true;
  var checked = true;
  var controller = TextEditingController();
  var result = '';
  var date = DateTime.now();
  var time = TimeOfDay.now();

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
              underline: true,
              onChanged: (value) => setState(() => result = value),
            ),
            SizedBox(height: 16),
            NxTextFormField(
              label: NxText.small('Number'),
              underline: true,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            NxTextFormField.date(
              label: NxText.small('Calendar'),
              initialDate: date,
              underline: true,
              onChanged: (date) => setState(() => this.date = date ?? this.date),
              dateValueText: (date) => '${date.year}-${date.month}-${date.day}',
              lastDate: DateTime.now().add(Duration(days: 365)),
            ),
            SizedBox(height: 16),
            NxTextFormField.time(
              label: NxText.small('Time'),
              initialTime: time,
              underline: true,
              onChanged: (time) => setState(() => this.time = time ?? this.time),
              timeValueText: (time) => '${time.hourOfPeriod}:${time.minute} ${time.period.name}',
            ),
            SizedBox(height: 16),
            NxTextFormField(
              label: NxText.small('Email'),
              keyboardType: TextInputType.emailAddress,
              underline: true,
              prefix: Icon(
                Icons.email,
                size: 18,
              ),
            ),
            SizedBox(height: 16),
            NxTextFormField(
              label: NxText.small('Password'),
              underline: true,
              keyboardType: TextInputType.visiblePassword,
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
              underline: true,
              controller: TextEditingController()..text = '#USERID',
              readonly: true,
            ),
            SizedBox(height: 16),
            NxTextFormField(
              label: NxText.small('Disabled'),
              underline: true,
              controller: TextEditingController()..text = 'user@gmail.com',
              enable: false,
            ),
            SizedBox(height: 16),
            NxTextFormField(
              label: NxText.small('Disabled Readonly'),
              controller: TextEditingController()..text = 'user@gmail.com',
              enable: false,
              readonly: true,
              underline: true,
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
              underline: true,
            ),
            SizedBox(height: 16),
            NxTextFormField.multiLine(
              label: NxText.small('Multiline'),
              hintText: 'Address',
              controller: TextEditingController()..text = '',
              underline: true,
            ),
            SizedBox(height: 16),
            NxTextFormField<String>.dropdownList(
              items: options,
              value: selected,
              hintText: 'Select Favorit Player',
              label: NxText.small('Select'),
              valueLabel: (v) => v,
              underline: true,
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