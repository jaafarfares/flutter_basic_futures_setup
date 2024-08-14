import 'package:get/get.dart';
import 'package:pneusshop_web/ui/common/app_colors.dart';
import 'package:pneusshop_web/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(appBar: AppBar(title: const Text("Mobile UI"),),);
  }
}