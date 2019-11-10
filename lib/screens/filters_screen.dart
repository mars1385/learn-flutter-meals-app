//import
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  //route
  static const routeName = '/filters';
  //props
  final Map<String, bool> ourFilters;
  final Function onSave;
  //constr
  FiltersScreen(this.ourFilters, this.onSave);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  //props
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState() {
    _glutenFree = widget.ourFilters['gluten'];
    _lactoseFree = widget.ourFilters['lactose'];
    _vegetarian = widget.ourFilters['vegetarian'];
    _vegan = widget.ourFilters['vegen'];
    super.initState();
  }

  //methode
  Widget _switchListBuilder(
      String title, String descriptin, bool currentValue, Function update) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(descriptin),
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final ourFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegen': _vegan,
              };
              widget.onSave(ourFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal filter',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _switchListBuilder(
                  'Gluten-Free',
                  'Only includs gluten free',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _switchListBuilder(
                  'Lactose-Free',
                  'Only includs lactose free',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _switchListBuilder(
                  'Vegetarian',
                  'Only includs vegetariann',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _switchListBuilder(
                  'Vegen',
                  'Only includs Vegen',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
