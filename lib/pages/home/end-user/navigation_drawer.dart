import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_disease_detector/pages/home/end-user/navigation_bloc.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('About Us'),
            onTap: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvents.SearchClickedEvent);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Contact Us'),
            onTap: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvents.SearchClickedEvent);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvents.LogoutClickedEvent);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Search'),
            onTap: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvents.SearchClickedEvent);
              Navigator.pop(context);
            },
          ),
          
        ],
      ),
    );
  }
}
