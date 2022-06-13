class Video {
  String _id;
  String _titulo;
  String _descricao;
  String _imagem;
  String _canal;

  Video(this._id, this._titulo, this._descricao, this._imagem, this._canal);

  get id => this._id;

  set id(value) => this._id = value;

  get titulo => this._titulo;

  set titulo(value) => this._titulo = value;

  get descricao => this._descricao;

  set descricao(value) => this._descricao = value;

  get imagem => this._imagem;

  set imagem(value) => this._imagem = value;

  get canal => this._canal;

  set canal(value) => this._canal = value;
}
