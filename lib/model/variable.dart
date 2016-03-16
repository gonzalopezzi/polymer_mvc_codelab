part of polymer_mvc_codelab.model;

@jsProxyReflectable @serializable
class Variable extends Observable {
  @observable @reflectable String id;
  @observable @reflectable int ranking;
  @observable @reflectable String name;
  @observable @reflectable num value;

  Variable ([this.id, this.ranking, this.name, this.value]);
}