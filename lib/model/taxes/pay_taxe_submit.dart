class PayTaxeSubmit {
  int idDeclaration;
  int idModePyt;
  double accompte;

  PayTaxeSubmit({this.idDeclaration, this.idModePyt, this.accompte});

  PayTaxeSubmit.fromJson(Map<String, dynamic> json) {
    idDeclaration = json['id_declaration'];
    idModePyt = json['id_mode_pyt'];
    accompte = json['accompte'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_declaration'] = this.idDeclaration;
    data['id_mode_pyt'] = this.idModePyt;
    data['accompte'] = this.accompte;
    return data;
  }
}
