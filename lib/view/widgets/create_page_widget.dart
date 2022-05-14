import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:goldgolia_project/controller/view/control_app_view_provider.dart';
import 'package:goldgolia_project/view/widgets/floating_alert_widget.dart';
import 'package:goldgolia_project/view/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class CreateScreenWidget extends StatefulWidget {
  final Widget page;
  final Widget? bottomAppbar;
  final AppBar? appBar;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const CreateScreenWidget({
    Key? key,
    required this.page,
    this.bottomAppbar,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  State<CreateScreenWidget> createState() => _CreateScreenWidgetState();
}

class _CreateScreenWidgetState extends State<CreateScreenWidget> {
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkConnctivityForIntiaalize();
      connectivitySubscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) {
          if (result == ConnectivityResult.none) {
            debugPrint("set the disconnect to true");
            context.read<ControlAppViewProvider>().hendelDisConnected(true);
          } else {
            debugPrint("set the disconnect to false");
            context.read<ControlAppViewProvider>().hendelDisConnected(false);
          }
        },
      );
    });
  }

  checkConnctivityForIntiaalize() {
    Connectivity().checkConnectivity().then(
      (ConnectivityResult connectivityResult) {
        if (connectivityResult == ConnectivityResult.none) {
          context.read<ControlAppViewProvider>().hendelDisConnected(true);
          debugPrint("set the disconnect to true second");
        } else {
          context.read<ControlAppViewProvider>().hendelDisConnected(false);
          debugPrint("set the disconnect to false second");
        }
      },
    );
  }

  @override
  dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      floatingActionButtonLocation: widget.floatingActionButtonLocation ??
          FloatingActionButtonLocation.centerDocked,
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: widget.bottomAppbar,
      body: SafeArea(
        child: Stack(
          children: [
            widget.page,
            if (context.watch<ControlAppViewProvider>().showLoadingScreen)
              const LoadingWidget(),
            if (context.watch<ControlAppViewProvider>().disConnected)
              const FloatingAlertWidget(
                text: "Please Check Your Connection",
                icon: Icons.wifi_off_rounded,
              ),
          ],
        ),
      ),
    );
  }
}
