class Stick {
  Vec3D loc;
  Vec3D oriLoc;
  Vec3D vel;
  int generations;
  String type;

  Stick(Vec3D _loc, Vec3D _vel, int _generations, String _type) {
    loc = _loc;
    oriLoc = _loc.copy(); //preserve original loc

    vel = _vel;

    generations = _generations;

    type = _type;

    //stack of functions that get executed only once
    updateLoc();
    updateDir();
    spawn();
  }

  void run() {
    display();
  }


  void spawn() {
    if (generations > 0) {
      Vec3D v = loc.copy();
      Vec3D iniVel = vel.copy();
      Stick newBob = new Stick(v, iniVel, generations-1, "A");

      allBobs.add(newBob);
      
      Vec3D v2 = loc.copy();
      Vec3D iniVel2 = vel.copy();
      Stick newBob2 = new Stick(v, iniVel2, generations-1, "B");

      allBobs.add(newBob2);
      
      
    }
  }

  void updateLoc() {
    loc.addSelf(vel);
  }

  void updateDir() {
    if (type == "A") {
      float angle1 = radians(random(-30, 35));
      float angle2 = radians(random(-30, 30));
      float angle3 = radians(random(-30, 43));
      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);
    }
    if (type == "B"){
      float angle1 = radians(random(-10, 15));
      float angle2 = radians(random(-15, 10));
      float angle3 = radians(random(-20, 10));
      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);
    }
  }

  void display() {
    stroke(0, 0, 0, 100);
    strokeWeight(3);
    point(loc.x, loc.y, loc.z);

    stroke(0, 0, 0, 100);
    strokeWeight(1);
    line(loc.x, loc.y, loc.z, oriLoc.x, oriLoc.y, oriLoc.z);
  }
}

