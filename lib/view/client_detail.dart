@HtmlImport('client_detail.html')
library polymer_mvc_codelab.client_detail;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_autonotify/polymer_autonotify.dart' show AutonotifyBehavior;
import 'package:observe/observe.dart';
import 'package:polymer_elements/paper_toast.dart';
import 'package:polymer_mvc_codelab/model/model.dart';
import 'package:polymer_mvc_codelab/view/bar_chart_d3.dart';

/**
 * A Polymer client-detail element.
 */
@PolymerRegister('client-detail')
class ClientDetail extends PolymerElement with AutonotifyBehavior, Observable {

  @observable @Property(observer:'clientDataChanged') ClientDetails clientData;
  @Property(computed: 'getUpsellingProbClass(clientData)') String upsellingProbClasses;

  /// Constructor used to create instance of ClientDetail.
  ClientDetail.created() : super.created();

  @reflectable
  String getUpsellingProbClass(ClientDetails clientDetails) => "upselling-prob-value ${clientDetails != null && clientDetails.upsellingProb > 50 ? 'green' : 'red'}";

  @reflectable
  void clientDataChanged (ClientDetails newValue, ClientDetails oldValue) {
    if ($['toast'] != null) {
      $['toast'].open();
    }
  }

}
