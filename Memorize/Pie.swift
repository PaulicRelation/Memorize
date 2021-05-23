//
//  Pie.swift
//  Memorize
//
//  Created by Pavel Senchenko on 23.05.2021.
//

import SwiftUI

struct Pie: Shape {
    let startAngle: Angle
    let endAngle: Angle
    var clockwise = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint.init(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(startAngle.radians)))

        var path = Path()
        path.move(to: center)
        path.addLine(to: start)
        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: clockwise)
        path.addLine(to: center)
        
        
        
        
        
        
        return path
        
    }
    
    
}
