part of polymer_mvc_codelab.model;

@jsProxyReflectable @serializable
class Client extends Observable {
  @observable @reflectable int id;
  @observable @reflectable String name;
  @observable @reflectable String lastName;
  @observable @reflectable DateTime birthDate;
  @observable @reflectable String image;

  Client ([this.id, this.name, this.lastName, this.birthDate, this.image]);

}