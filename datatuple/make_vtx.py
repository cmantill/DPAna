#!/usr/bin/env python
import sys
tmpargv = sys.argv
sys.argv = []
import math
import getopt
import root_numpy, numpy
sys.argv = tmpargv

def print_usage():
    print "\nUsage: {0} <output ROOT file name> <input ROOT file name>".format(sys.argv[0])
    print

if len(sys.argv)!=3:
    print_usage()
    sys.exit(0)

branchlist=["x1_st1",
    "tx1_st1",
    "y1",
    "ty1",
    "x2_st1",
    "tx2_st1",
    "y2",
    "ty2"]

#events = root_numpy.root2array("dimuons.root",branches=branchlist)
events = root_numpy.root2array(sys.argv[2],branches=branchlist)

n = events.size
print(n)
#subevents = events[0:10]
#print subevents
#print subevents[0]
#pos_tracks = events[['x1_st1','tx1_st1',"y1","ty1"]]

pos_vecs = numpy.ones((events.size,3))
pos_vecs[:,:-1] = events[['tx1_st1',"ty1"]].view((float, 2))
#print pos_vecs

neg_vecs = numpy.ones((events.size,3))
neg_vecs[:,:-1] = events[['tx2_st1',"ty2"]].view((float, 2))
#print neg_vecs

pos_orgs = numpy.zeros((events.size,3))
pos_orgs[:,:-1] = events[['x1_st1',"y1"]].view((float, 2))
#print pos_orgs

neg_orgs = numpy.zeros((events.size,3))
neg_orgs[:,:-1] = events[['x2_st1',"y2"]].view((float, 2))
#print neg_orgs

diff_orgs = pos_orgs - neg_orgs

crosses = numpy.cross(pos_vecs,neg_vecs)
cross_norms = numpy.sqrt(numpy.einsum('ij,ij->i',crosses,crosses))
distances = abs(numpy.einsum('ij,ij->i',crosses,diff_orgs))/cross_norms
#print distances

dposdpos = numpy.einsum('ij,ij->i',pos_vecs,pos_vecs)
dnegdneg = numpy.einsum('ij,ij->i',neg_vecs,neg_vecs)
dposdneg = numpy.einsum('ij,ij->i',pos_vecs,neg_vecs)

dpospdiff = numpy.einsum('ij,ij->i',pos_vecs,diff_orgs)
dnegpdiff = numpy.einsum('ij,ij->i',neg_vecs,diff_orgs)

numerator_pos = dnegpdiff*dposdneg - dpospdiff*dnegdneg
numerator_neg = dnegpdiff*dposdpos - dpospdiff*dposdneg
denominator = dposdpos*dnegdneg - dposdneg*dposdneg

z_pos = numerator_pos/denominator
z_neg = numerator_neg/denominator

#print z_pos
#print z_neg

#print z_pos-z_neg

#print (events['x1_st1'] - events['x2_st1']) / (events['tx2_st1'] - events['tx1_st1']) #vertex in XZ-plane
#print (events['y1'] - events['y2']) / (events['ty2'] - events['ty1']) #vertex in YZ-plane

pos_points = pos_orgs + (pos_vecs.T*z_pos).T
neg_points = neg_orgs + (neg_vecs.T*z_neg).T

vertex = 0.5*(pos_points+neg_points)
#print pos_points
#print neg_points
#print vertex

#names = branchlist[:]
names = []
names.append('vtx_dist')
names.append('vtx_x')
names.append('vtx_y')
names.append('vtx_z')

dataarray = numpy.zeros((4,events.size))
dataarray[0,:] = distances
dataarray[1:4,:] = vertex.T
typearray = [(i,numpy.float) for i in names]
#stuff = [[events[i],(i,events.dtype[i])] for i in names]
output = numpy.core.records.fromarrays(dataarray,dtype=typearray)
root_numpy.array2root(output,sys.argv[1],mode="recreate",treename="vtx")
