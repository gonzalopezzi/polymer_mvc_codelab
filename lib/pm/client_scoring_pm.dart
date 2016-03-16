@HtmlImport('client_scoring_pm.html')
library polymer_mvc_codelab.client_scoring_pm;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_autonotify/polymer_autonotify.dart' show AutonotifyBehavior;
import 'package:observe/observe.dart';
import 'package:polymer_mvc_codelab/model/model.dart';
import 'package:polymer_mvc_codelab/delegate/delegate.dart';

import 'dart:math';

/**
 * A Polymer client-scoring-pm element.
 */
@PolymerRegister('client-scoring-pm')
class ClientScoringPm extends PolymerElement with AutonotifyBehavior, Observable {

  @observable @property List<Client> clients;
  @observable @property ClientDetails clientDetails;

  /// Constructor used to create instance of ClientScoringPm.
  ClientScoringPm.created() : super.created();

  selectClient (Client client) async {
    clientDetails = await new Delegate().getClientDetails(client.id);
  }

  ready () async {
    clients = await new Delegate().getClientsList();
  }

}
