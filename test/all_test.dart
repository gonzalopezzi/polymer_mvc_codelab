@HtmlImport('client_scoring_pm_test.html')
@TestOn('browser')
library polymer_mvc_codelab.test;

import 'package:test/test.dart';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';
import 'package:polymer_mvc_codelab/pm/client_scoring_pm.dart';
import 'package:polymer_mvc_codelab/model/model.dart';
import 'dart:html';

@PolymerRegister('client-scoring-pm-test')
class ClientScoringPmTest extends PolymerElement {
  ClientScoringPmTest.created() : super.created();
  factory ClientScoringPmTest  () => new Element.tag('client-scoring-pm-test');
}

main () async {
  await initPolymer();

  group ('ClientScoringPm', () {
    ClientScoringPmTest clientScoringPmTest = querySelector("client-scoring-pm-test");
    ClientScoringPm clientScoringPm = clientScoringPmTest.$['pm'] as ClientScoringPm;
    test ('Once the element is ready, the clients should be loaded', () {
      List<Client> clients = clientScoringPm.clients;
      expect (clients==null, equals(false));
      expect (clients.length, equals(7));
      expect (clients[0].name, equals('Peter'));
      expect (clients[0].lastName, equals('Parker'));
    });
    test ('Initially, clientDetails should be null', () {
      ClientDetails clientDetails = clientScoringPm.clientDetails;
      expect (clientDetails==null, equals(true));
    });
    test ('Selection of a client should download client details', () async {
      await clientScoringPm.selectClient(clientScoringPm.clients[0]);
      expect (clientScoringPm.clientDetails==null, equals(false));
      expect (clientScoringPm.clientDetails.client.name, equals("Peter"));
      expect (clientScoringPm.clientDetails.client.lastName, equals("Parker"));
      expect (clientScoringPm.clientDetails.topVariables==null, equals(false));
      expect (clientScoringPm.clientDetails.topVariables.length, equals(3));
    });
  });
}