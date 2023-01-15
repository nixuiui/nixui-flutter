import 'package:flutter/material.dart';
import 'package:nixui/widgets/nx_text.dart';

class NxOptions<T> {
    String? imageAsset;
    String? imageNetwork;
    String? name;
    T? value;
    bool? isSelected;

    NxOptions({
        this.imageAsset,
        this.imageNetwork,
        this.name,
        this.value
    });
    
    NxOptions.withSelected({
        this.imageAsset,
        this.imageNetwork,
        this.name,
        this.value,
        this.isSelected
    });
}

class NxOptionsSelector extends StatelessWidget {
  const NxOptionsSelector({
    Key? key,
    this.options,
    this.selected,
    this.onSelected,
    this.child,
    this.useFilter = false,
    this.multipleSelect = false,
    this.label,
  }) : super(key: key);

  final List<NxOptions>? options;
  final dynamic selected;
  final ValueChanged<dynamic>? onSelected;
  final Widget? child;
  final bool useFilter;
  final bool multipleSelect;
  final String? label;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => select(context),
      child: child,
    );
  }

  Future select(BuildContext context) async {
    final Map? results = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _NxOptionSelectorScreen(
        title: 'Select ${label?.toLowerCase() ?? ''}',
        options: options ?? [],
        selected: selected,
        useFilter: useFilter,
        multipleSelect: multipleSelect,
      )),
    );

    if (results != null && results.containsKey('data')) {
      onSelected?.call(results['data']);
    }
  }
}

class _NxOptionSelectorScreen extends StatefulWidget {
  const _NxOptionSelectorScreen({
    Key? key,
    required this.options,
    this.selected,
    this.title = "Select",
    this.useImageAsset = false,
    this.useImageNetwork = false,
    this.multipleSelect = false,
    this.useFilter = false
  }) : super(key: key);

  final bool multipleSelect;
  final bool useImageAsset;
  final bool useImageNetwork;
  final bool useFilter;
  final dynamic selected;
  final List<NxOptions> options;
  final String title;

  @override
  __NxOptionSelectorScreenState createState() => __NxOptionSelectorScreenState();
}

class __NxOptionSelectorScreenState extends State<_NxOptionSelectorScreen> {

  final _searchController = TextEditingController();
  List<NxOptions> optionsFiltered = <NxOptions>[];
  List<NxOptions> optionsSelected = <NxOptions>[];

  @override
  void initState() {
    print('selected1: ${widget.selected}');
    optionsFiltered = widget.options;
    if(widget.multipleSelect) optionsSelected.addAll(widget.selected);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).appBarTheme.iconTheme?.color),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.title),
        systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
        actions: <Widget>[
          widget.multipleSelect ? 
          IconButton(
            icon: Icon(Icons.check, color: Theme.of(context).appBarTheme.actionsIconTheme?.color), 
            onPressed: () => Navigator.of(context).pop({'data': optionsSelected})
          ) : Container()
        ],
      ),
      body: Column(
        children: <Widget>[
          widget.useFilter ? Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: TextFormField(
              controller: _searchController,
              cursorColor: Colors.black54,
              style: TextStyle(color: Colors.black87),
              onChanged: (value) {
                setState(() {
                  optionsFiltered = value.isEmpty ? widget.options : widget.options.where((q) => q.name?.toLowerCase().contains(value.toLowerCase()) ?? false).toList();
                });
              },
              decoration: InputDecoration(
                hintText: "Cari disini...",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.black38),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16)
              ),
            ),
          ) : Container(),
          widget.useFilter ? Divider() : Container(),
          widget.multipleSelect ? ListTile(
            trailing: Icon(Icons.check_circle, color: optionsSelected.length == selectedCount(widget.options) ? Colors.green : Colors.grey[300]),
            title: NxText.bodyMedium("${optionsSelected.length} selected"),
            onTap: () {
              if(optionsSelected.length < widget.options.length) {
                setState(() {
                  optionsSelected.clear();
                  selectAll(widget.options);
                });
              } 
              else {
                setState(() => optionsSelected.clear());
              }
            }
          ) : Container(),
          widget.multipleSelect ? Divider() : Container(),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: optionsFiltered.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                if(optionsFiltered[index].value is List) {
                  return createParentItem(context, optionsFiltered[index]);
                }
                return createItemSelectable(context, optionsFiltered[index]);
              }
            ),
          ),
        ],
      ),
    );
  }

  void selectAll(List<NxOptions> data) {
    for(int i=0; i<data.length; i++) {
      if(data[i].value is List) {
        selectAll(data[i].value);
      } else {
        optionsSelected.add(data[i]);
      }
    }
  }

  int selectedCount(List<NxOptions> data) {
    int count = 0;
    for(int i=0; i<data.length; i++) {
      if(data[i].value is List) count += selectedCount(data[i].value);
      else count++;
    }
    return count;
  }

  ListView createParentItem(BuildContext context, NxOptions data) {
    print('selected2: ${widget.selected}');
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.grey[100],
          child: ListTile(
            trailing: !widget.multipleSelect ? null
              : Icon(Icons.check_circle, color: Colors.green),
            title: NxText.body(data.name ?? ''),
            onTap: () {},
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: data.value.length,
          separatorBuilder: (context, i) => Divider(),
          itemBuilder: (context, i) {
            return createItemSelectable(context, data.value[i]);
          }
        )
      ],
    );
  }

  Widget createItemSelectable(BuildContext context, NxOptions item) {
    bool isSelected = false;
    int indexSelected = 0;
    if(widget.multipleSelect) {
      for(int i=0; i<optionsSelected.length; i++) {
        if(optionsSelected[i].value == item.value) {
          isSelected = true;
          indexSelected = i;
        }
      }
    } else {
      if((widget.selected as NxOptions?)?.value == item.value) isSelected = true;
    } 
    return ListTile(
      trailing: Icon(Icons.check_circle, color: isSelected ? Colors.green : Colors.transparent),
      title: Row(
        children: <Widget>[
          widget.useImageAsset ? Padding(
            padding: EdgeInsets.only(right: 16),
            child: item.imageAsset != null ? Image.asset(
              item.imageAsset!,
              width: 40,
              height: 40,
            ) : Container(),
          ) : Container(),
          widget.useImageNetwork ? Padding(
            padding: EdgeInsets.only(right: 16),
            child: item.imageNetwork != null ? FadeInImage.assetNetwork(
              placeholder: "assets/grey.jpeg",
              image: item.imageNetwork!,
              width: 40,
              height: 40,
            ) : Container(),
          ) : Container(),
          Expanded(child: Text(item.name ?? '')),
        ],
      ),
      onTap: () {
        if(!widget.multipleSelect) {
          Navigator.of(context).pop({'data': item});
        } else {
          if(isSelected) {
            setState(() => optionsSelected.removeAt(indexSelected));
          } else {
            setState(() => optionsSelected.add(item));
          }
        }
      }
    );
  }
}