/*
GeomSvc.h

Definition of the class GeomSvc, which provide geometry service to the
whole tracking system.

For now the drift time is not used so as to avoid left-right ambiguity

Author: Kun Liu, liuk@fnal.gov
Created: 10-18-2011

Updated by Kun Liu on 07-03-2012
---  Support all detector planes including chambers, hodoscopes, and prop.
tubes
---  The convention of detector plane ID is: firstly chambers, then hodos,
and then prop. tubes
*/

#ifndef _GEOMSVC_H
#define _GEOMSVC_H

#include <iostream>
#include <vector>
#include <string>
#include <map>
#include <algorithm>


class Plane
{
public:
    //Default constructor
    Plane();

    //Get interception with track
    double intercept(double tx, double ty, double x0_track, double y0_track) const;
    double intercept_x(double tx, double ty, double x0_track, double y0_track) const;

    //X, Y, U, V conversion
    double getX(double w, double y) const { return w/costheta - y*tantheta; }
    double getY(double x, double w) const { return w/sintheta - x/tantheta; }
    double getW(double x, double y) const { return x*costheta + y*sintheta; }

    //Calculate the internal variables
    void update();

    //Debugging output
    friend std::ostream& operator << (std::ostream& os, const Plane& plane);

public:
    //Detector identifier
    int detectorID;
    std::string detectorName;
    int planeType;   //X = 1, angleFromVert > 0 = 2, angleFromVert < 0 = 3, Y = 4

    //Ideal properties
    int nElements;
    double spacing;
    double cellWidth;
    double xoffset;
    double overlap;
    double angleFromVert;
    double sintheta;
    double costheta;
    double tantheta;

    //Survey info
    double x0;     //x0, y0, z0 define the center of detector
    double y0;
    double z0;
    double x1;     //x1, y1 define the lower/left edge of detector
    double y1;
    double x2;     //x2, y2 define the upper/right edge of detector
    double y2;
    double thetaX;
    double thetaY;
    double thetaZ;

    //Alignment info
    double deltaX;
    double deltaY;
    double deltaZ;
    double deltaW;             //for chambers and hodos
    double deltaW_module[9];   //for prop. tubes only
    double rotX;
    double rotY;
    double rotZ;
    double resolution;

    //Final position/rotation
    double xc;
    double yc;
    double zc;
    double wc;
    double rX;
    double rY;
    double rZ;


    //Geometric setup
    double nVec[3];             //Perpendicular to plane
    double uVec[3];             //measuring direction
    double vVec[3];             //non-measuring direction
    double rotM[3][3];          //rotation matrix

};

#endif
