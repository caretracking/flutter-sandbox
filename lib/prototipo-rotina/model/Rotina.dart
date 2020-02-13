
class Rotina {
  int _idRotina;
  String _titulo;
  String _descricao;
  DateTime _dataHoraExecucao;


  Rotina([this._idRotina, this._titulo, this._descricao, this._dataHoraExecucao]);

  int get idRotina => _idRotina;
  String get titulo =>_titulo;
  String get descricao =>_descricao;
  DateTime get dataHoraExecucao =>_dataHoraExecucao;

}