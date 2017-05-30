//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

func sizeToFitOriginalFrame(frame: CGRect) -> CGRect {
    // Determine which side is smaller so we can ensure our shapes
    //fit in the view correctly
    let minSize = min(frame.width, frame.height)
    // Make a new frame out of the original frame.
    // Set X, Y to the center and use width, height from shortest side (calculated above)
    let bestSize = CGRect(x: frame.width/2.0, y: frame.height/2.0 - minSize/2.0, width: minSize,
                          height: minSize)
    print("bestsize \(bestSize)")
    return bestSize
}


func bezierPathForCookieShapeInRect(originalFrame: CGRect) -> UIBezierPath
{
    let frame = sizeToFitOriginalFrame(frame: originalFrame)
    //椭圆
    return UIBezierPath(ovalIn: frame)
}

func bezierPathForSquareShapeInRect(originalFrame: CGRect, cornerRadius: CGFloat) -> UIBezierPath
{
    let frame = sizeToFitOriginalFrame(frame: originalFrame)
    return UIBezierPath(roundedRect: frame, cornerRadius:
        cornerRadius)
}


let bezier = bezierPathForCookieShapeInRect(originalFrame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
let ovalBezier = bezierPathForCookieShapeInRect(originalFrame: CGRect(x: 0.0, y: 0.0, width: 400.0, height: 200.0))
let squareBezier = bezierPathForSquareShapeInRect(originalFrame: CGRect(x: 0.0, y: 0.0, width: 400.0, height: 200.0), cornerRadius: 10.0)



let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
view.backgroundColor = UIColor.red


for i in 0...30 {
    let bezle = bezierPathForSquareShapeInRect(originalFrame:view.frame,
                                               cornerRadius: CGFloat(i))
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = bezle.cgPath
    view.layer.mask = shapeLayer
    XCPCaptureValue(identifier:"Corner Radius \(i)", value: view)
    
    
}

view.backgroundColor = UIColor.red

let pointString = "{3.0,1.0}"
let point = CGPointFromString(pointString)
let pointArray = ["{0.0,0.0}","{75.0,75.0}","{100.0,75.0}","{90.0,50.0}"]

let icicleShape = UIBezierPath()
icicleShape.move(to:CGPoint(x: 0.0, y: 0.0))

for i in 0..<pointArray.count {
    let pointString = CGPointFromString(pointArray[i])
    print(pointString)
    icicleShape.addLine(to:pointString)
}

icicleShape.close()

func showViewWithIcicle(bezle: UIBezierPath) {
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = bezle.cgPath
    view.layer.mask = shapeLayer
    XCPCaptureValue(identifier:"Icicle Shape", value: view)
}

showViewWithIcicle(bezle:icicleShape)
view


