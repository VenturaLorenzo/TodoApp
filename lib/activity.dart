class Activity {
  String name;
  int stars;
  int _id;

  Activity(this.name);
  

  Activity setID(int id) {
    _id = id;
    return this;
  }

  getID() {
    return _id;
  }
}
