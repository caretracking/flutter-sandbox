import 'dart:core';

import 'package:flutter_sandbox/prototipo-rotina/model/Rotina.dart';

class Pessoa {
  int _id;
  String _nome;
  List<Rotina> _rotinas = new List();

  Pessoa(this._id, [this._nome, this._rotinas]) ;

  int     get  id   => _id;
  String  get  nome => _nome;



  static Pessoa getPessoaExemplo(){
    List<Rotina> r = new List();
    r.add(new Rotina(1,"Rotina 1","Desc rotina 1", DateTime.parse("2020-02-04 20:00")));
    r.add(new Rotina(2,"Rotina 2","Desc rotina 2", DateTime.parse("2020-02-04 20:00")));
    r.add(new Rotina(2,"Rotina 2","Desc rotina 2", DateTime.parse("2020-02-04 20:00")));
    
    Pessoa p = new Pessoa(1,"Asdrubal", r);
    return p;
  }
  

}

main(List<String> args) {
  Pessoa p = Pessoa.getPessoaExemplo();
  print(p.nome + " Rotinas:");
  p._rotinas.forEach((r)=> {print(r.dataHoraExecucao.toString() + " -> " +r.titulo.toString())});
}