//
//  GStack.swift
//  Owl Home
//
//  Created by Menan Vadivel on 8/26/19.
//  Copyright © 2019 Tinrit Labs. All rights reserved.
//

import SwiftUI
import Foundation

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct GStack<Content>: View where Content: View {
    var elementsCount = 0
    var columns = 3
    var paddingBottom: CGFloat = 0
    var paddingRight: CGFloat = 0
    var spreadout = false
    
    var rows: Int {
        let rowsFloat = Float(elementsCount) / Float(columns)
        return Int(rowsFloat.rounded())
    }

    let content: (Int) -> Content
    
    
    public init(totalItems: Int = 0, columns: Int = 3, paddingBottom: CGFloat = 0, paddingRight: CGFloat = 0, spreadout: Bool, @ViewBuilder content: @escaping (Int) -> Content) {
        self.elementsCount = totalItems
        self.content = content
        self.columns = columns
        self.paddingBottom = paddingBottom
        self.paddingRight = paddingRight
        self.spreadout = spreadout
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { col in
                        Group {
                            if self.columns * row + col < self.elementsCount {
                                self.content(self.columns * row + col)
                                    .padding(.trailing, self.paddingRight)
                                if self.spreadout {
                                    Spacer()
                                }
                            }
                            else {
                                
                                Text("")
                            }
                        }
                        
                    }
                }
                .padding(.bottom, self.paddingBottom)
            }
        }
    }
}
