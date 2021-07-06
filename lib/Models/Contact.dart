class Contact {
  String id;
  String email;
  String nom;
  String prenom;
  String urlImage;
  String statut = "Hello WOrld";

  Contact.fromJson(dynamic obj) {
    id = obj["userId"];
    email = obj["email"];
    nom = obj["nom"];
    prenom=obj["prenom"];
    urlImage = obj["urlImg"];
  }

  Contact(this.email,this.nom,this.prenom,this.urlImage);
}
