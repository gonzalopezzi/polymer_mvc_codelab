library polymer_mvc_codelab.delegate;

import 'dart:async';
import 'package:http/browser_client.dart';
import 'package:dson/dson.dart';

import 'package:polymer_mvc_codelab/model/model.dart';


class Delegate {
  static final Delegate _instance = new Delegate._privateConstructor();

  factory Delegate () {
    return _instance;
  }

  Delegate._privateConstructor ();

  Future<List<Client>> getClientsList () async {
    var response = await new BrowserClient().get ("services/client_list.json");
    return fromJsonList(response.body, Client);
  }

  Future<ClientDetails> getClientDetails (int clientId) async {
    var response = await new BrowserClient().get ("services/client_details_$clientId.json");
    return fromJson (response.body, ClientDetails);
  }
}

