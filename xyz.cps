/**
  Copyright (C) 2012-2013 by Autodesk, Inc.
  All rights reserved.

  XYZ post processor configuration.

  $Revision: 41369 65a1f6cb57e3c7389dc895ea10958fc2f7947b0d $
  $Date: 2017-03-20 14:12:44 $
  
  FORKID {0352867A-2BF3-4bf6-8BA0-2FF360B65929}
*/

description = "XYZ";
vendor = "Autodesk";
vendorUrl = "http://www.autodesk.com";
legal = "Copyright (C) 2012-2013 by Autodesk, Inc.";
certificationLevel = 2;
minimumRevision = 24000;

longDescription = "Simple post to export toolpath in CSV format as 3D coordinates.";

extension = "csv";
setCodePage("ascii");

capabilities = CAPABILITY_MILLING;
tolerance = spatial(0.002, MM);



// user-defined properties
properties = {
};



var xyzFormat = createFormat({decimals:(unit == MM ? 3 : 4)});

var xOutput = createVariable({force:true}, xyzFormat);
var yOutput = createVariable({force:true}, xyzFormat);
var zOutput = createVariable({force:true}, xyzFormat);

/**
  Writes the specified block.
*/
function writeBlock() {
  writeWords(arguments);
}

/**
  Output a comment.
*/
function writeComment(text) {
  // writeln("# " + text);
}

function onOpen() {
  setWordSeparator(";");
  
  if (programName) {
    writeComment(programName);
  }
  if (programComment) {
    writeComment(programComment);
  }
  
  switch (unit) {
  case IN:
    writeComment("Inches");
    break;
  case MM:
    writeComment("Millimeters");
    break;
  }
}

function onComment(message) {
  writeComment(message);
}

function onSection() {
  { // pure 3D
    var remaining = currentSection.workPlane;
    if (!isSameDirection(remaining.forward, new Vector(0, 0, 1))) {
      error(localize("Tool orientation is not supported."));
      return;
    }
    setRotation(remaining);
  }

  // writeln("");
}

function onRadiusCompensation() {
  switch (radiusCompensation) {
  case RADIUS_COMPENSATION_LEFT:
  case RADIUS_COMPENSATION_RIGHT:
    error(localize("Radius compensation is not supported."));
    break;
  }
}

function onRapid(_x, _y, _z) {
  var x = xOutput.format(_x);
  var y = yOutput.format(_y);
  var z = zOutput.format(_z);
  if (x || y || z) {
    writeBlock(x, y, z);
  }
}

function onLinear(x, y, z, feed) {
  onRapid(x, y, z);
}

function onCommand(command) {
}
