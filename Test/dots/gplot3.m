function [Xout,Yout,Zout]=gplot3(A,xy,lc)
% gplot‚Ì3ŽŸŒ³•\Ž¦
%
% 2005/04/11    Haruna MATSUSHITA

%GPLOT Plot graph, as in "graph theory".
%   GPLOT(A,xy) plots the graph specified by A and xy. A graph, G, is
%   a set of nodes numbered from 1 to n, and a set of connections, or
%   edges, between them.  
%
%   In order to plot G, two matrices are needed. The adjacency matrix,
%   A, has a(i,j) nonzero if and only if node i is connected to node
%   j.  The coordinates array, xy, is an n-by-2 matrix with the
%   position for node i in the i-th row, xy(i,:) = [x(i) y(i)].
%   
%   GPLOT(A,xy,LineSpec) uses line type and color specified in the
%   string LineSpec. See PLOT for possibilities.
%
%   [X,Y] = GPLOT(A,xy) returns the NaN-punctuated vectors
%   X and Y without actually generating a plot. These vectors
%   can be used to generate the plot at a later time if desired.
%   
%   See also SPY, TREEPLOT.

%   John Gilbert, 1991.
%   Modified 1-21-91, LS; 2-28-92, 6-16-92 CBM.
%   Copyright 1984-2002 The MathWorks, Inc. 
%   $Revision: 5.12 $  $Date: 2002/04/09 00:26:12 $

[i,j] = find(A);
[ignore, p] = sort(max(i,j));
i = i(p);
j = j(p);

% Create a long, NaN-separated list of line segments,
% rather than individual segments.

X = [ xy(i,1) xy(j,1) repmat(NaN,size(i))]';
Y = [ xy(i,2) xy(j,2) repmat(NaN,size(i))]';
Z = [ xy(i,3) xy(j,3) repmat(NaN,size(i))]';
X = X(:);
Y = Y(:);
Z = Z(:);

if nargout==0,
    if nargin<3,
        plot3(X, Y, Z)
    else
        plot3(X, Y, Z,lc,'MarkerFaceColor','none','MarkerEdgeColor','b','MarkerSize',5);
    end
else
    Xout = X;
    Yout = Y;
    Zout = Z;
end