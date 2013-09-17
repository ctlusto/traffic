Traffic
=======

Simple traffic flow modeling with [Rule 184](http://en.wikipedia.org/wiki/Rule_184) in Processing.

Create a line of vehicles and click the window to begin the flow of traffic.  Each vehicle follows a simple rule: move forward if there is an open space in the road, and stop if there is another vehicle blocking its path.
Vary the 'density' parameter in order to increase or decrease traffic density from 0 (no cars) to 1 (a car in every available spot).  A density of 1 corresponds to gridlock.
Below a density of 0.5, traffic flows freely, and average speed is one unit of distance per unit of time.  Above this density, the system exhibits a phase transition and traffic jams propagate through the line of cars, and average speed decreases.
