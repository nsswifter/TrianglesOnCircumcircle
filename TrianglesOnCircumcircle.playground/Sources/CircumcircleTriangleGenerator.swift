import CoreGraphics

// MARK: - Circumcircle Triangle Generator

/// A utility struct for generating triangles on a circumcircle.
public struct CircumcircleTriangleGenerator {
    public init() { }
    
    /// Generates an array of triangles on the circumcircle given the circumcenter, circumradius, and number of triangles.
    ///
    /// - Parameters:
    ///   - circumcenter: The center point of the circumcircle.
    ///   - circumradius: The radius of the circumcircle.
    ///   - numberOfTriangles: The desired number of triangles to generate.
    ///
    /// - Returns: An array of arrays of `CGPoint` representing the vertices of each triangle on the circumcircle.
    public func generateTriangles(circumcenter: CGPoint,
                                  circumradius: CGFloat,
                                  numberOfTriangles: Int) -> [[CGPoint]] {
        // Calculate the total number of points needed for all triangles
        let numberOfPoints = numberOfTriangles * 3
        
        // Array to store the points on the circumcircle
        var circlePoints: [CGPoint] = []
        
        // Calculate the points on the circumcircle using polar coordinates
        for i in 0..<numberOfPoints {
            let angle = CGFloat(i) * (2 * CGFloat.pi) / CGFloat(numberOfPoints)
            let x = circumcenter.x + circumradius * cos(angle)
            let y = circumcenter.y + circumradius * sin(angle)
            let point = CGPoint(x: x, y: y)
            circlePoints.append(point)
        }
        
        // Array to store the triangles
        var triangles: [[CGPoint]] = []
        
        // Generate triangles using the calculated points
        for trianglePoint in 0..<numberOfTriangles {
            let triangle = [
                circlePoints[trianglePoint],
                circlePoints[trianglePoint + numberOfTriangles],
                circlePoints[trianglePoint + numberOfTriangles * 2]
            ]
            triangles.append(triangle)
        }
        
        // Return the array of triangles
        return triangles
    }
    
    /// The callAsFunction method to generate triangles by calling an instance of the struct as a function.
    ///
    /// - Parameters:
    ///   - circumcenter: The center point of the circumcircle.
    ///   - circumradius: The radius of the circumcircle.
    ///   - numberOfTriangles: The desired number of triangles to generate.
    ///
    /// - Returns: An array of arrays of `CGPoint` representing the vertices of each triangle on the circumcircle.
    public func callAsFunction(circumcenter: CGPoint,
                               circumradius: CGFloat,
                               numberOfTriangles: Int) -> [[CGPoint]] {
        generateTriangles(circumcenter: circumcenter, circumradius: circumradius, numberOfTriangles: numberOfTriangles)
    }
}
