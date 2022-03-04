import 'package:flutter/material.dart';
import 'package:vendor_flutter/UI/Auth/login_bloc.dart';
import 'package:vendor_flutter/UI/Home/home_bloc.dart';

class BlocProvider extends InheritedWidget {

  // these blocs are the objects that we want to access throughout the app
 HomeBloc? homeBloc;
 LoginBloc? loginBloc;

  /// Inherited widgets require a child widget
  /// which they implicitly return in the same way
  /// all widgets return other widgets in their 'Widget.build' method.
  BlocProvider({
    Key? key,
    required Widget child,
    this.homeBloc,
    this.loginBloc,
  })  : assert(child != null),
        super(key: key, child: child);

  /// this method is used to access an instance of
  /// an inherited widget from lower in the tree.
  /// `BuildContext.dependOnInheritedWidgetOfExactType` is a built in
  /// Flutter method that does the hard work of traversing the tree for you
  static BlocProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider>();
  }

  @override
  bool updateShouldNotify(BlocProvider old) {
    return true;
  }
}