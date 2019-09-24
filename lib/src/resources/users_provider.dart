import 'package:flutter/widgets.dart';

import '../blocs/user_bloc.dart';

class UsersProvider extends InheritedWidget{
  final UserBloc bloc;
  UsersProvider({Key key, Widget child})
    : bloc = UserBloc(),
    super (key: key, child: child);
  
  bool updateShouldNotify(_) => true;

  static UserBloc of (BuildContext context){
    return (context.inheritFromWidgetOfExactType(UsersProvider) as UsersProvider)
      .bloc;
    
  }
}
