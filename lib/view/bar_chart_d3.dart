@HtmlImport('bar_chart_d3.html')
library polymer_mvc_codelab.bar_chart_d3;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer_autonotify/polymer_autonotify.dart' show AutonotifyBehavior;
import 'package:observe/observe.dart';
import 'package:polymer_mvc_codelab/model/model.dart';
import 'package:js/js.dart';
import 'dart:html';
import 'package:dson/dson.dart' as dson;

@JS()
class BarChart {
  external BarChart (Node rootNode, num barsWidth, num barsHeight, num barsMargin, String baseColor, String rangeColor);
  external renderBars (dynamic data);
}

/**
 * A Polymer bar-chart-d3 element.
 */
@PolymerRegister('bar-chart-d3')
class BarChartD3 extends PolymerElement with AutonotifyBehavior, Observable {

  BarChart barChart;
  @observable @Property(observer:'dataChanged') List<Variable> variables;

  /// Constructor used to create instance of BarChartD3.
  BarChartD3.created() : super.created();

  @reflectable
  void dataChanged (List<Variable> newValue, List<Variable> oldValue) {
    if (variables != null && barChart != null) {
      barChart.renderBars(convertToJs(variables));
    }
  }
/*
var barChart = new BarChart ('#variables', 300, 120, 5, '#333', '#3e3');
    barChart.renderBars(variables);
 */
  ready () {
    barChart = new BarChart($['main-container'], 300, 120, 5, '#333', '#3e3');
    if (variables != null) {
      barChart.renderBars(convertToJs(variables));
    }
  }

}
