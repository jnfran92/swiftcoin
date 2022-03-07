//
//  PriceChartView.swift
//  swiftcoin
//
//  Created by usuario on 07-03-22.
//

import SwiftUI

struct PriceChartView: View {
    
    struct Point {
        let id = UUID()
        let x: Double
        let y: Double
    }
    
    let data: [Point] = [
        Point(x: 0.0, y: 0.0),
        Point(x: 0.1, y: 0.3),
        Point(x: 0.2, y: 0.6),
        Point(x: 0.3, y: 0.8),
        Point(x: 0.4, y: 0.9),
        Point(x: 0.5, y: 0.9),
        Point(x: 0.6, y: 0.9),
        Point(x: 0.7, y: 0.9),
        Point(x: 0.8, y: 1.0),
        Point(x: 0.9, y: 1.0),
        Point(x: 1.0, y: 1.0),
    ]
    
    var body: some View {
        GeometryReader { reader in
            let width: CGFloat = reader.size.width
            let height = reader.size.height
            
            Path { path in
                path.move(
                    to: CGPoint(
                        x: width * 0.0,
                        y: height * 1.0
                    )
                )
                
                data.forEach { point in
                    path.addLine(
                        to: CGPoint(
                            x: width * point.x,
                            y: height * (1.0 - point.y)
                        )
                    )
                }
            }.stroke(lineWidth: 2.0)
                .foregroundColor(.black)
            
            ForEach(data, id: \.id){ point in
                Circle()
                    .fill(.red)
                    .frame(width: 10, height: 10)
                    .position(x: width * point.x,
                              y: height * (1.0 - point.y))
            }
        }.padding()
    }
}

struct PriceChartView_Previews: PreviewProvider {
    static var previews: some View {
        PriceChartView()
    }
}
