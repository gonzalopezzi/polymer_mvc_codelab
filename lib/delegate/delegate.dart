library polymer_mvc_codelab.delegate;

import 'dart:async';
import 'package:http/browser_client.dart';
import 'package:dson/dson.dart' as dson;

import 'package:polymer_mvc_codelab/model/model.dart';


class Delegate {
  static final Delegate _instance = new Delegate._privateConstructor();

  factory Delegate () {
    return _instance;
  }

  Delegate._privateConstructor ();

  Future<List<Client>> getClientsList () async {
    var response = await new BrowserClient().get ("services/client_list.json");
    return dson.fromJsonList(response.body, Client);
  }

  Future<ClientDetails> getClientDetails (int clientId) async {
    var response = await new BrowserClient().get ("services/client_details_$clientId.json");
    return dson.fromJson (response.body, ClientDetails);
  }
}

