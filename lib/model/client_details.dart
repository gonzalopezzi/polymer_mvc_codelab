part of polymer_mvc_codelab.model;

@jsProxyReflectable @serializable
class ClientDetails extends Observable {
  @observable @reflectable Client client;
  @observable @reflectable num upsellingProb;
  @observable @reflectable List<Variable> topVariables;

  ClientDetails ([this.client, this.upsellingProb, this.topVariables]);
}