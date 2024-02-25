import 'package:flutter/material.dart';

class PhotoshopVideoController {

  late BuildContext context;
  late Function refresh;

  

  init(BuildContext context, Function refresh) {
    this.context = context;
    this.refresh = refresh;
  }

}