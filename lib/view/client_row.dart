@HtmlImport('client_row.html')
library polymer_mvc_codelab.client_row;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_autonotify/polymer_autonotify.dart' show AutonotifyBehavior;
import 'package:observe/observe.dart';
import 'package:polymer_mvc_codelab/model/model.dart';
import 'package:polymer_elements/iron_image.dart';

/**
 * A Polymer client-row element.
 */
@PolymerRegister('client-row')
class ClientRow extends PolymerElement with AutonotifyBehavior, Observable {

  @observable @property Client clientData;

  /// Constructor used to create instance of ClientRow.
  ClientRow.created() : super.created();

}
