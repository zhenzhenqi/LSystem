import toxi.math.conversion.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh2d.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.math.noise.*;
import peasy.*;

PeasyCam cam;

Stick bob;

ArrayList <Stick> allBobs;


void setup(){
  size(800, 1400, P3D);
  filter(BLUR, 6);
  
  smooth();
  cam = new PeasyCam(this, 100);
  
  Vec3D v = new Vec3D(0, 0, 0);
  Vec3D iniVel = new Vec3D(10, 0, 0);
  
  allBobs = new ArrayList<Stick>();
  bob = new Stick(v, iniVel, 20, "A");
  allBobs.add(bob);
}

void draw(){
  background(255);
  
//  stroke(255);
//  noFill();
//  strokeWeight(1);
//  box(600);
  
  for (Stick b:allBobs){
    b.run();
  }
}

