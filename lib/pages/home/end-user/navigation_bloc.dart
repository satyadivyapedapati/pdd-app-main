import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationEvents {
  LogoutClickedEvent,
  SearchClickedEvent,
}

class NavigationBloc extends Bloc<NavigationEvents, dynamic> {
  NavigationBloc() : super(null);

  @override
  Stream<dynamic> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.LogoutClickedEvent:
        // Perform logout logic here
        break;
      case NavigationEvents.SearchClickedEvent:
        //yield YourSearchPage();
        break;
    }
  }
}
