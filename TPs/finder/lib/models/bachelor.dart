class Bachelor {
  String firstname;
  String lastname;
  Gender gender;
  String avatar;
  List<Gender>? searchFor;
  String? job;
  String? description;
  bool isRemoved = false;

  Bachelor(this.firstname, this.lastname, this.gender, this.avatar,
      [this.searchFor, this.job, this.description]);

  void setIsRemoved(bool isRemoved) {
    this.isRemoved = isRemoved;
  }
}

enum Gender { male, female }
