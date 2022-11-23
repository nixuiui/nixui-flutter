import 'package:flutter/material.dart';
import 'package:nixui/widgets/nx_button.dart';
import 'package:nixui/widgets/nx_text.dart';
import 'package:nixui/themes/theme.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {

  final variants = <Map<String, dynamic>>[
    {"color": NxColor.primary, "label": "Primary"},
    {"color": NxColor.secondary, "label": "secondary"},
    {"color": NxColor.tertiary, "label": "tertiary"},
    {"color": NxColor.info, "label": "Info"},
    {"color": NxColor.success, "label": "Success"},
    {"color": NxColor.warning, "label": "Warning"},
    {"color": NxColor.error, "label": "Error"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NxButton'),
      ),
      body: ListView(
        children: [
          _buildButtonList(),
          _buildOnlinedButtonList(),
          _buildFullwidthButtonList(),
          _buildSizeButton(),
          _buildButtonIconList(),
          _buildSquareButton(),
        ],
      ),
    );
  }

  Widget _buildButtonList() {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(16),
      children: [
        NxText.headline3('Buttons'),
        SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: variants.length,
          separatorBuilder: (_, __) => SizedBox(height: 4),
          itemBuilder: (_, index) => Row(
            children: [
              NxButton(
                onPressed: () {},
                text: '${variants[index]["label"]}',
                color: variants[index]["color"],
                // color: Colors.green,
              ),
              SizedBox(width: 8),
              NxButton(
                onPressed: () {},
                text: '${variants[index]["label"]} Dark',
                color: (variants[index]["color"] as Color).dark,
              ),
              SizedBox(width: 8),
              NxButton(
                onPressed: () {},
                text: '${variants[index]["label"]} Light',
                isLoading: true,
                color: variants[index]["color"],
                // color: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildFullwidthButtonList() {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(16),
      children: [
        NxText.headline3('Fullwidth Button'),
        SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: variants.length,
          separatorBuilder: (_, __) => SizedBox(height: 4),
          itemBuilder: (_, index) => IntrinsicWidth(
            child: NxButton(
              onPressed: () {},
              text: '${variants[index]["label"]}',
              color: variants[index]["color"],
              width: MediaQuery.of(context).size.width,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildSizeButton() {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(16),
      children: [
        NxText.headline3('Sized Button'),
        SizedBox(height: 12),
        Row(
          children: [
            NxButton.large(
              onPressed: () {},
              text: 'Large Button',
              fontWeight: FontWeight.w700,
            ),
            SizedBox(width: 4),
            NxButton.medium(
              onPressed: () {},
              text: 'Medium Button',
              fontWeight: FontWeight.w700,
            ),
            SizedBox(width: 4),
            NxButton.small(
              onPressed: () {},
              text: 'Small Button',
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ],
    );
  }
  
  Widget _buildSquareButton() {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(16),
      children: [
        NxText.headline3('Square Button'),
        SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(variants.length, (i) => NxButton.square(
            onPressed: () {},
            color: variants[i]['color'],
            child: Icon(Icons.home),
          )).toList(),
        ),
      ],
    );
  }
  
  Widget _buildOnlinedButtonList() {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(16),
      children: [
        NxText.headline3('Outlined Button'),
        SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: variants.length,
          separatorBuilder: (_, __) => SizedBox(height: 4),
          itemBuilder: (_, index) => Row(
            children: [
              NxButton(
                onPressed: () {},
                text: '${variants[index]["label"]}',
                color: variants[index]["color"],
                outlined: true,
                // color: Colors.green,
              ),
              SizedBox(width: 8),
              NxButton(
                onPressed: () {},
                text: '${variants[index]["label"]} Dark',
                color: (variants[index]["color"] as Color).dark,
                outlined: true,
              ),
              SizedBox(width: 8),
              NxButton(
                onPressed: () {},
                text: '${variants[index]["label"]} Light',
                isLoading: true,
                color: variants[index]["color"],
                outlined: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonIconList() {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(16),
      children: [
        NxText.headline3('Button Icon'),
        SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: variants.length,
          separatorBuilder: (_, __) => SizedBox(height: 4),
          itemBuilder: (_, index) => Row(
            children: [
              NxButton(
                onPressed: () {},
                text: 'Left',
                color: variants[index]["color"],
                leftIcon: Icon(
                  Icons.arrow_back,
                ),
                // color: Colors.green,
              ),
              SizedBox(width: 8),
              NxButton(
                onPressed: () {},
                text: 'Right',
                color: variants[index]["color"],
                rightIcon: Icon(
                  Icons.arrow_forward,
                ),
              ),
              SizedBox(width: 8),
              NxButton(
                onPressed: () {},
                text: 'Right',
                color: variants[index]["color"],
                leftIcon: Icon(
                  Icons.home
                ),
                rightIcon: Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
}