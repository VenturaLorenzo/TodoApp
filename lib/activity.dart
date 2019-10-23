class Activity {
  String name;
  int _id;
Activity(this.name);
Activity setID(int id){
  _id=id;
  return this;
}

  getID() {
    return _id;
  }
  
}