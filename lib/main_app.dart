// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
@HtmlImport('main_app.html')
library formacion_polymer_2016.lib.main_app;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';
import 'package:polymer_autonotify/polymer_autonotify.dart' show AutonotifyBehavior;
import 'package:observe/observe.dart';
import 'package:polymer_elements/paper_card.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_mvc_codelab/pm/client_scoring_pm.dart';
import 'package:polymer_mvc_codelab/view/client_row.dart';
import 'package:polymer_mvc_codelab/view/client_detail.dart';
import 'package:polymer_mvc_codelab/model/model.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement with AutonotifyBehavior, Observable {

  @observable @property ClientScoringPm clientScoringPm;

  MainApp.created() : super.created();

  // In the ready () method, we get the Presentation Model from the DOM
  ready () {
    clientScoringPm = querySelector("client-scoring-pm");
  }

  @reflectable
  void clientTap (e, [_]) {
    Client tappedClient = new DomRepeatModel.fromEvent(e)['item'] as Client;
    clientScoringPm.selectClient(tappedClient);
  }
}
