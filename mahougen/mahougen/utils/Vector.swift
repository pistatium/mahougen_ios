import UIKit

struct Vector {
    let x: CGFloat
    let y: CGFloat
}

extension Vector {
    func size() -> CGFloat {
        return sqrt(self.x * self.x + self.y * self.y)
    }
    
    func angle() -> CGFloat {
        return atan2(self.x, self.y)
    }
    
    func toPoint() -> CGPoint {
        return CGPoint(x: self.x, y: self.y)
    }
    
    static func ofAngle(rad: CGFloat) -> Vector {
        return Vector(x: cos(rad), y: sin(rad))
    }
}

func + (left: Vector, right: Vector) -> Vector {
    return Vector(x: left.x + right.x, y: left.y + right.y)
}

func - (left: Vector, right: Vector) -> Vector {
    return Vector(x: left.x - right.x, y: left.y - right.y)
}

func * (left: Vector, right: CGFloat) -> Vector {
    return Vector(x: left.x * right, y: left.y * right)
}


