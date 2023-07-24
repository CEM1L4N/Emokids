//
//  LabelWidget.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 17/07/23.
//

import SwiftUI
import Foundation

struct TagKeyword: View {
    //    var label: String
    var tags: NLPHelper
    var body: some View {
        GeometryReader { geometryProxy in
            FlexibleView(
                availableWidth: geometryProxy.size.width, data: tags.foundNouns,
                spacing: 15,
                alignment: .leading
            ) { item in
                Text(item)
                    .pinktext24()
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 4)
                    .background(Color.pinkClr.opacity(0.3))
                    .cornerRadius(60)
            }
            
            
            
        }
    }
}

//struct TagKeyword_Previews: PreviewProvider {
//    static var previews: some View {
//        TagKeyword(label: "ahaide")
//    }
//}


struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    @State var elementsSize: [Data.Element: CGSize] = [:]
    
    var body : some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(computeRows(), id: \.self) { rowElements in
                HStack(spacing: spacing) {
                    ForEach(rowElements, id: \.self) { element in
                        content(element)
                            .fixedSize()
                            .readSize { size in
                                elementsSize[element] = size
                            }
                    }
                }
            }
        }
    }
    
    func computeRows() -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth
        
        for element in data {
            let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]
            
            if remainingWidth - (elementSize.width + spacing) >= 0 {
                rows[currentRow].append(element)
            } else {
                currentRow = currentRow + 1
                rows.append([element])
                remainingWidth = availableWidth
            }
            
            remainingWidth = remainingWidth - (elementSize.width + spacing)
        }
        
        return rows
    }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
