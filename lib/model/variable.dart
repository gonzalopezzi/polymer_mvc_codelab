part of polymer_mvc_codelab.model;

@jsProxyReflectable @serializable
class Variable extends Observable {
  @observable @reflectable String name;
  @observable @reflectable num value;

  Variable ([this.name, this.value]);
}