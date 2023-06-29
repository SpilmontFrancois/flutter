class Bachelor {
  String firstname;
  String lastname;
  Gender gender;
  String avatar;
  List<Gender>? searchFor;
  String? job;
  String? description;
  bool isDisliked = false;
  bool show = true;

  Bachelor(this.firstname, this.lastname, this.gender, this.avatar,
      [this.searchFor, this.job, this.description]);

  void setIsDisliked(bool isDisliked) {
    this.isDisliked = isDisliked;
  }

  void setIsShow(bool show) {
    this.show = show;
  }
}

enum Gender { male, female, all }
