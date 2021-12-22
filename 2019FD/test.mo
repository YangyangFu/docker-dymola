within ;
model test
  Buildings.Controls.OBC.CDL.Continuous.Add add2;
  Modelica.Blocks.Sources.Constant k1(k=1);
  Modelica.Blocks.Sources.Constant k2(k=2);
equation 
  connect(k2.y, add2.u2) ;
  connect(k1.y, add2.u1);
end test;