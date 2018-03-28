/*
GeomSvc.cxx

Implementation of class GeomSvc.

Author: Kun Liu, liuk@fnal.gov
Created: 10-19-2011
*/

#include <iostream>
#include <fstream>
#include <sstream>
#include <cmath>
#include <algorithm>
#include <iomanip>

#include "GeomSvc.h"

Plane::Plane()
{
    detectorID = -1;
    planeType = -1;

    nElements = 0;
    x0 = 0.;
    y0 = 0.;
    z0 = 0.;

    x1 = 1.E6;
    y1 = 1.E6;
    x2 = -1.E6;
    y2 = -1.E6;

    thetaX = 0.;
    thetaY = 0.;
    thetaZ = 0.;
    rotX = 0.;
    rotY = 0.;
    rotZ = 0.;

    deltaX = 0.;
    deltaY = 0.;
    deltaZ = 0.;
    deltaW = 0.;
    for(int i = 0; i < 9; ++i) deltaW_module[i] = 0.;

    xc = 0.;
    yc = 0.;
    zc = 0.;
    wc = 0.;
    rX = 0.;
    rY = 0.;
    rZ = 0.;
}

void Plane::update()
{
    xc = x0 + deltaX;
    yc = y0 + deltaY;
    zc = z0 + deltaZ;

    rX = thetaX + rotX;
    rY = thetaY + rotY;
    rZ = thetaZ + rotZ;

    sintheta = sin(angleFromVert + rZ);
    costheta = cos(angleFromVert + rZ);
    tantheta = tan(angleFromVert + rZ);

    wc = getW(xc, yc);

    rotM[0][0] = cos(rZ)*cos(rY);
    rotM[0][1] = cos(rZ)*sin(rX)*sin(rY) - cos(rX)*sin(rZ);
    rotM[0][2] = cos(rX)*cos(rZ)*sin(rY) + sin(rX)*sin(rZ);
    rotM[1][0] = sin(rZ)*cos(rY);
    rotM[1][1] = sin(rZ)*sin(rX)*sin(rY) + cos(rZ)*cos(rX);
    rotM[1][2] = sin(rZ)*sin(rY)*cos(rX) - cos(rZ)*sin(rX);
    rotM[2][0] = -sin(rY);
    rotM[2][1] = cos(rY)*sin(rX);
    rotM[2][2] = cos(rY)*cos(rX);

    uVec[0] = cos(angleFromVert);
    uVec[1] = sin(angleFromVert);
    uVec[2] = 0.;

    vVec[0] = -sin(angleFromVert);
    vVec[1] = cos(angleFromVert);
    vVec[2] = 0.;

    nVec[0] = 0.;
    nVec[1] = 0.;
    nVec[2] = 1.;

    double temp[3];
    for(int i = 0; i < 3; ++i) temp[i] = uVec[i];
    for(int i = 0; i < 3; ++i)
    {
        uVec[i] = 0.;
        for(int j = 0; j < 3; ++j)
        {
            uVec[i] += rotM[i][j]*temp[j];
        }
    }

    for(int i = 0; i < 3; ++i) temp[i] = vVec[i];
    for(int i = 0; i < 3; ++i)
    {
        vVec[i] = 0.;
        for(int j = 0; j < 3; ++j)
        {
            vVec[i] += rotM[i][j]*temp[j];
        }
    }

    nVec[0] = uVec[1]*vVec[2] - vVec[1]*uVec[2];
    nVec[1] = uVec[2]*vVec[0] - vVec[2]*uVec[0];
    nVec[2] = uVec[0]*vVec[1] - vVec[0]*uVec[1];
}

double Plane::intercept(double tx, double ty, double x0_track, double y0_track) const
{
    //double mom[3] = {tx, ty, 1.};
    //double pos[3] = {x0_track, y0_track, 0.};

    double det = -(tx*nVec[0] + ty*nVec[1] + nVec[2]);
    double dpos[3] = {x0_track - xc, y0_track - yc, -zc};

    double vcp[3];
    vcp[0] = vVec[1] - vVec[2]*ty;
    vcp[1] = vVec[2]*tx - vVec[0];
    vcp[2] = vVec[0]*ty - vVec[1]*tx;

    //LogInfo(detectorID << "  " << detectorName << "  " << tx << "  " << ty << "  " << x0_track << "  " << y0_track << "  "  << -(vcp[0]*dpos[0] + vcp[1]*dpos[1] + vcp[2]*dpos[2])/det);
    return -(vcp[0]*dpos[0] + vcp[1]*dpos[1] + vcp[2]*dpos[2])/det + wc;
}

std::ostream& operator << (std::ostream& os, const Plane& plane)
{
    os << std::setw(6) << std::setiosflags(std::ios::right) << plane.detectorID
       << std::setw(6) << std::setiosflags(std::ios::right) << plane.detectorName
       << std::setw(6) << std::setiosflags(std::ios::right) << plane.planeType
       << std::setw(10) << std::setiosflags(std::ios::right) << plane.spacing
       << std::setw(10) << std::setiosflags(std::ios::right) << plane.xoffset
       << std::setw(10) << std::setiosflags(std::ios::right) << plane.overlap
       << std::setw(10) << std::setiosflags(std::ios::right) << plane.x2 - plane.x1
       << std::setw(10) << std::setiosflags(std::ios::right) << plane.y2 - plane.y1
       << std::setw(10) << std::setiosflags(std::ios::right) << plane.nElements
       << std::setw(10) << std::setiosflags(std::ios::right) << plane.angleFromVert
       << std::setw(10) << std::setiosflags(std::ios::right) << plane.z0
       << std::setw(10) << std::setiosflags(std::ios::right) << plane.x0
       << std::setw(10) << std::setiosflags(std::ios::right) << plane.y0;

    return os;
}

double Plane::intercept_x(double tx, double ty, double x0_track, double y0_track) const
{
    //double mom[3] = {tx, ty, 1.};
    //double pos[3] = {x0_track, y0_track, 0.};

    double det = -(tx*nVec[0] + ty*nVec[1] + nVec[2]);
    double dpos[3] = {x0_track - xc, y0_track - yc, -zc};

    double ucp[3];
    ucp[0] = uVec[1] - uVec[2]*ty;
    ucp[1] = uVec[2]*tx - uVec[0];
    ucp[2] = uVec[0]*ty - uVec[1]*tx;

    //LogInfo(detectorID << "  " << detectorName << "  " << tx << "  " << ty << "  " << x0_track << "  " << y0_track << "  "  << -(vcp[0]*dpos[0] + vcp[1]*dpos[1] + vcp[2]*dpos[2])/det);
    return -(ucp[0]*dpos[0] + ucp[1]*dpos[1] + ucp[2]*dpos[2])/det;
}

