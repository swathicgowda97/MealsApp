import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key,required this.currentFilters});

  final Map<Filter,bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;


  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFreeFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFreeFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
        ),
        // drawer: MainDrawer(onSelectScreen: (identifier){
        //   Navigator.pop(context);
        //   if(identifier == 'meals'){
        //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const TabsScreen()),);
        //   }
        // }),
        body: WillPopScope(
          onWillPop: () async{
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactoseFreeFilterSet,
              Filter.vegetarian: _vegetarianFreeFilterSet,
              Filter.vegan: _veganFreeFilterSet
            });
            return false;
          },
          child: Column(
            children: [
              SwitchListTile(
                  value: _glutenFreeFilterSet,
                  onChanged: (isChecked) {
                    setState(() {
                      _glutenFreeFilterSet = isChecked;
                    });
                  },
                  title: Text(
                    'Gluten-free',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  subtitle: Text(
                    'Only include gluten-free meal',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  activeColor: Theme.of(context).colorScheme.tertiary,
                  contentPadding: const EdgeInsets.only(left: 34, right: 22)),
              SwitchListTile(
                  value: _lactoseFreeFilterSet,
                  onChanged: (isChecked) {
                    setState(() {
                      _lactoseFreeFilterSet = isChecked;
                    });
                  },
                  title: Text(
                    'Lactose-free',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  subtitle: Text(
                    'Only include lactose-free meal',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  activeColor: Theme.of(context).colorScheme.tertiary,
                  contentPadding: const EdgeInsets.only(left: 34, right: 22)),
              SwitchListTile(
                  value: _vegetarianFreeFilterSet,
                  onChanged: (isChecked) {
                    setState(() {
                      _vegetarianFreeFilterSet = isChecked;
                    });
                  },
                  title: Text(
                    'Vegetarian-free',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  subtitle: Text(
                    'Only include vegetarian meal',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  activeColor: Theme.of(context).colorScheme.tertiary,
                  contentPadding: const EdgeInsets.only(left: 34, right: 22)),
              SwitchListTile(
                  value: _veganFreeFilterSet,
                  onChanged: (isChecked) {
                    setState(() {
                      _veganFreeFilterSet = isChecked;
                    });
                  },
                  title: Text(
                    'Vegan-free',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  subtitle: Text(
                    'Only include vegan meal',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  activeColor: Theme.of(context).colorScheme.tertiary,
                  contentPadding: const EdgeInsets.only(left: 34, right: 22)),
            ],
          ),
        ));
  }
}
