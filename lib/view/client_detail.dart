@HtmlImport('client_detail.html')
library polymer_mvc_codelab.client_detail;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_autonotify/polymer_autonotify.dart' show AutonotifyBehavior;
import 'package:observe/observe.dart';
import 'package:polymer_mvc_codelab/model/model.dart';


/**
 * A Polymer client-detail element.
 */
@PolymerRegister('client-detail')
class ClientDetail extends PolymerElement with AutonotifyBehavior, Observable {

  @observable @property ClientDetails clientData;

  /// Constructor used to create instance of ClientDetail.
  ClientDetail.created() : super.created();

}
