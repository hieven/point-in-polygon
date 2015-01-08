# point in convex polygon

## Infrastructure

* There are two models including Point and Polygon
* Point inherits from Vector
* Polygon has some important method
  1. isConvex<br>

     It will return whether the polygon is convex or convave

  2. isInside

     It will return the target point is inside polygon or not

## Get started

    ruby main.rb

## Test

    gem install rspec
    rspec

## Test case

You follow rules below to customize your own test case

    3     # vertices of polygon
    1 2   # first point
    5 9   # second point
    4 7   # third point
    1 2   # target point

