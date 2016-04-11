import UIKit

class MahouView: UIView {
    
    struct Path{
        var start: CGPoint;
        var end:CGPoint;
    }
    
    var paths: [Path] = []
    var pathsSet: [[Path]] = [[]]
    var lastPoint: CGPoint!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        lastPoint = touches.first?.locationInView(self)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let current = touches.first?.locationInView(self)
        {
            paths.append(Path(start: lastPoint, end: current))
            lastPoint = current
            self.setNeedsDisplay()
        }
    }

    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        
        for path in paths {
            CGContextMoveToPoint(context, path.start.x, path.start.y)
            CGContextAddLineToPoint(context, path.end.x, path.end.y)
        }
        
        CGContextSetRGBStrokeColor(context, 1, 1, 1, 1)
        CGContextSetLineWidth(context, 1)
        CGContextSetLineCap(context, .Round)
        CGContextStrokePath(context)
    }
}