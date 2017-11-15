/**
  Copyright (C) 2017 by Kenny Lozowski
  All rights reserved.

  CR Onsrud Tablemate 2x3 with B&R controller post processor configuration.

  
  FORKID {04622D27-72F0-45d4-85FB-DB346FD1AE22}
*/

description = "CR Onsrud Tablemate 2x3 with B&R Controller";
vendor = "C.R. Onsrud";
vendorUrl = "http://www.cronsrud.com";
legal = "Copyright (C) 2017 by Kenny Lozowski";
certificationLevel = 2;
minimumRevision = 1000;

longDescription = "CR Onsrud 5-axis Router with Fanuc 31i control.";

extension = "nc";
programNameIsInteger = true;
setCodePage("ascii");

capabilities = CAPABILITY_MILLING;
tolerance = spatial(0.002, MM);

allowHelicalMoves = false;
allowedCircularPlanes = false; // allow any circular motion

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