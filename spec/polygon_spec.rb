require 'spec_helper'
require 'point-in-polygon/Polygon'
require 'point-in-polygon/Point'

describe Polygon do

  it "sholud be new" do
    points = [ Point[1, 2, 0], Point[5, 9, 0], Point[4, 7, 0] ]
    p = Polygon.new points

  end

  describe "method isConvex" do

    it "should return true" do
      points = [ Point[1, 2, 0], Point[5, 9, 0], Point[4, 7, 0] ]
      p = Polygon.new points
      p.isConvex.should == true
    end
    it "should return false" do
      points = [ Point[0, 0, 0], Point[3, 0, 0], Point[0, 3, 0], Point[1, 1, 0] ]
      p = Polygon.new points
      p.isConvex.should == false
    end
  end

  describe "method isInside" do

    it "should return 'Inside'" do
      points = [ Point[0, 0, 0], Point[3, 0, 0], Point[0, 3, 0] ]
      p = Polygon.new points
      target = Point[0, 0, 0]
      p.isInside(target).should == 1
    end
    it "should return 'Inside'" do
      points = [ Point[0, 0, 0], Point[3, 0, 0], Point[0, 3, 0] ]
      p = Polygon.new points
      target = Point[1, 1, 0]
      p.isInside(target).should == 1
    end
    it "should return 'Outside'" do
      points = [ Point[0, 0, 0], Point[3, 0, 0], Point[0, 3, 0] ]
      p = Polygon.new points
      target = Point[-1, -1, 0]
      p.isInside(target).should == 0
    end
    it "should return 'Please enter convex polygon'" do
      points = [ Point[0, 0, 0], Point[3, 0, 0], Point[0, 3, 0], Point[1, 1, 0] ]
      p = Polygon.new points
      target = Point[0, 0, 0]
      p.isInside(target).should == -1
    end

  end

end