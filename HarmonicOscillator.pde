float x,y,k,R,m,Period,AngularVelocity,A0,Time,a0,a,v0,v,startTime;
void setup()
{
  fullScreen();
  frameRate(150);
  k=500;
  R=50;
  m=1000;
  y=height/2;
  Period=2*PI*sqrt(m/k);
  AngularVelocity=sqrt(k/m);
  
  
}
void draw()
{
  background(255);
  fill(100);
  if(mousePressed)
  {
    x=mouseX;
    ellipse(x,y,2*R,2*R);
    A0=x-width/2;
    Time=0;
    a0=A0*sq(AngularVelocity)/(width/2);
    line(width/2,0,width/2,height);
    v0=A0*AngularVelocity/(width/2);
    startTime=millis();
    v=0;
    a=0;
  }
  else
  {
    Time=(millis()-startTime)/1000;
    x=width/2+A0*sin(AngularVelocity*Time+PI/2);
    a=(width/2-x)*sq(AngularVelocity)/(width/2);
    v=v0*cos(AngularVelocity*Time+PI/2);
    ellipse(x,y,2*R,2*R);
    textSize(20);
    text("m="+m+" kg"+"\nk="+k+" N/m"+"\nT="+String.format("%.2f",Period)+" s"+"\n\u03c9= "+String.format("%.2f",AngularVelocity)+" /s"+"\nA\u2080="+String.format("%.2f",abs(A0/(width/2)))+" m"+"\nA="+String.format("%.2f",-(width/2-x)/(width/2))+" m"+"\nv\u2080="+String.format("%.2f",abs(v0))+" m/s"+"\nv="+String.format("%.2f",v)+" m/s"+"\na\u2080="+String.format("%.2f",abs(a0))+" m/s\u00b2"+"\na="+String.format("%.2f",a)+" m/s\u00b2"+"\nTime: "+String.format("%.2f",Time)+" s"+"\nFrameRate:"+String.format("%.2f",frameRate),100,100);
    line(width/2,0,width/2,height);
  }
  fill(255);
  stroke(0);
  rectMode(CORNERS);
  rect(width-100,height/2+2*R,width,height);
  rect(width-100,height/2+2*R,width-200,height);
  line(width-200,3*height/4+R,width,3*height/4+R);
  fill(255,0,0);
  rect(width-100,3*height/4+R,width,3*height/4+R+v*(height/4-R)/v0);
  fill(0,255,0);
  rect(width-200,3*height/4+R,width-100,3*height/4+R+a*(height/4-R)/a0);
  fill(0);
  textSize(32);
  text("a",width-150,height-10);
  text("v",width-50,height-10);
  
   
  
}