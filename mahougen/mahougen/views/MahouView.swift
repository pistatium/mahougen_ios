import UIKit

class MahouView: UIView {
    
    struct Path{
        var start: CGPoint;
        var end:CGPoint;
    }
    
    var vertexCount = 10
    
    var paths: [Path] = []
    var pathsSet: [[Path]] = [[]]
    var lastPoints: [CGPoint] = []
    
    lazy var view_center: Vector = {
        return Vector(
            x: self.frame.size.width/2.0,
            y: self.frame.size.height/2.0
        )
    }()
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let current = touches.first?.locationInView(self)
        {
            let moveTo = calcPoint(current)
            lastPoints = moveTo
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let current = touches.first?.locationInView(self)
        {
            let moveTo = calcPoint(current)
            for i in 0 ..< self.vertexCount {
                
                paths.append(Path(start: lastPoints[i], end: moveTo[i]))
            }
            lastPoints = moveTo
            self.setNeedsDisplay()
        }
    }
    
    private func calcPoint(current: CGPoint) -> [CGPoint] {
        let c = Vector(x: current.x, y: current.y)
        let direction = c - view_center
        let r = direction.size()
        let alpha = (2.0 * M_PI / Double(self.vertexCount))
        var theta = Double(direction.angle())
        for i in 0 ... self.vertexCount {
            if (Double(i) * alpha >= theta) {
                theta -= Double(i - 1) * alpha
                break
            }
        }
        var targets: [CGPoint] = []
        for i in 0 ..< self.vertexCount {
            let target = view_center + Vector.ofAngle(CGFloat(theta + alpha * Double(i))) * r
            targets.append(target.toPoint())
        }
        return targets
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