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
        
    let data: [Point] = (1...20).enumerated().map { (idx,it) in
        Point(x: Double(idx)/20.0,
              y: (Double(idx)/20.0)*(Double(idx)/20.0))
    }
    
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
                .foregroundColor(.yellow)
            
            ForEach(data, id: \.id){ point in
                Circle()
                    .fill(.blue)
                    .frame(width: 7, height: 7)
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
