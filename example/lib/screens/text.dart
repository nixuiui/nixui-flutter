import 'package:flutter/material.dart';
import 'package:nixui/widgets/nx_text.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {

  var showAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NxText Widget"),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 16, right: 16, bottom: 64, left: 16),
        children: [
          NxText.headline1('Headline 1'),
          NxText.headline2('Headline 2'),
          NxText.headline3('Headline 3'),
          NxText.headline4('Headline 4'),
          NxText.headline5('Headline 5'),
          NxText.headline6('Headline 6'),
          NxText.bodyLight('Body Light'),
          NxText.body('Body'),
          NxText.bodyMedium('Body Medium'),
          NxText.small('Small'),
          NxText.extraSmall('Extra Small'),
          NxText.caption('Caption'),
          Divider(height: 32),
          NxText.headline1(
            'Headline 1',
            decoration: TextDecoration.underline,
          ),
          NxText.headline2(
            'Headline 2',
            decoration: TextDecoration.underline,
          ),
          NxText.headline3(
            'Headline 3',
            decoration: TextDecoration.underline,
          ),
          NxText.headline4(
            'Headline 4',
            decoration: TextDecoration.underline,
          ),
          NxText.headline5(
            'Headline 5',
            decoration: TextDecoration.underline,
          ),
          NxText.headline6(
            'Headline 6',
            decoration: TextDecoration.underline,
          ),
          NxText.bodyLight(
            'Body Light',
            fontStyle: FontStyle.italic,
          ),
          NxText.body(
            'Body',
            fontStyle: FontStyle.italic,
          ),
          NxText.bodyMedium(
            'Body Medium',
            fontStyle: FontStyle.italic,
          ),
          NxText.small(
            'Small',
            decoration: TextDecoration.lineThrough,
            fontStyle: FontStyle.italic,
          ),
          NxText.extraSmall(
            'Extra Small',
            decoration: TextDecoration.lineThrough,
            fontStyle: FontStyle.italic,
          ),
          NxText.caption(
            'Caption',
            decoration: TextDecoration.lineThrough,
            fontStyle: FontStyle.italic,
          ),
          Divider(height: 32),
          NxText.headline3('Paragraph'),
          SizedBox(height: 12),
          showAll 
            ? NxText.body(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                textAlign: TextAlign.justify,
              ) 
            : NxText.body(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                textAlign: TextAlign.justify,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
          NxText.body(
            'show more',
            onPressed: () {
              setState(() {
                showAll = !showAll;
              });
            },
          ),
          Divider(height: 32),
          NxText('__Lorem Ipsum__ is simply dummy **text** of the ```printing``` and ```typesetting``` industry. ~~Lorem Ipsum~~ has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. #flutter @developer')
        ],
      ),
    );
  }
}