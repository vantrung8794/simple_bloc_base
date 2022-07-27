import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';

class AppScaffold<T extends Bloc> extends StatefulWidget {
  const AppScaffold({
    Key? key,
    required this.body,
    this.title,
    this.isBack = true,
    this.onReceiveArguments,
    this.onWillPop,
    this.safeArea = true,
    this.loadData,
    this.floatingActionButton,
    this.appBarElevation,
    this.actions,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  }) : super(key: key);

  final Widget body;
  final Widget? title;
  final Function(Object? params, T? bloc)? onReceiveArguments;
  final Function()? onWillPop;
  final Function(T? bloc)? loadData;
  final bool isBack;
  final bool safeArea;
  final FloatingActionButton? floatingActionButton;
  final double? appBarElevation;
  final List<Widget>? actions;
  final EdgeInsetsGeometry padding;

  @override
  State<AppScaffold<T>> createState() => _AppScaffoldState<T>();
}

class _AppScaffoldState<T extends Bloc> extends State<AppScaffold<T>> {
  T? bloc;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.instance.get<T>();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => widget.loadData?.call(bloc));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && widget.onReceiveArguments != null) {
      widget.onReceiveArguments?.call(args, bloc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _willPopCallback(),
      child: BlocProvider.value(
        value: bloc!,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: widget.title == null
              ? null
              : AppBar(
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                  ),
                  elevation: widget.appBarElevation ?? 0.0,
                  centerTitle: true,
                  title: widget.title!,
                  actions: widget.actions,
                ),
          body: SafeArea(
            top: widget.safeArea,
            bottom: widget.safeArea,
            left: widget.safeArea,
            right: widget.safeArea,
            child: Padding(
              padding: widget.padding,
              child: widget.body,
            ),
          ),
          floatingActionButton: widget.floatingActionButton,
        ),
      ),
    );
  }

  Future<bool> _willPopCallback() async {
    widget.onWillPop?.call();
    final isLoading = EasyLoading.isShow;
    return Future.value(widget.isBack && !isLoading);
  }
}
