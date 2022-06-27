////
////  SnapCarousel.swift
////  ACNIFY
////
////  Created by Local Administrator on 24/06/22.
////
//
//import SwiftUI
//
//struct SnapCarousel<Content: View, T: Identifiable>:
//    View {
//    
//    var content: (T)->Content
//    var list: [T]
//    
//    //Properties....
//    var spacing: CGFloat
//    var trailingSpace: CGFloat
//    @Binding var index: Int
//    
//    
//    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>, items: [T], @ViewBuilder
//         content: @escaping (T)->Content){
//        
//        self.list = items
//        self.spacing = spacing
//        self.trailingSpace = trailingSpace
//        self._index = index
//        self.content = content
//        
//    }
//    
//    
//    @GestureState var offset: CGFloat = 0
//    @State var currentIndex: Int = 0
//    
//
//    var body: some View {
//        
//        GeometryReader{ proxy in
//            
//            
//            
//            let width = proxy.size.width - (trailingSpace - spacing)
//            let adjustmentWidth = (trailingSpace / 2) - spacing
//            HStack(spacing: spacing) {
//                
//                ForEach(list) {
//                    item in
//                    
//                    content(item)
//                        .frame(width: proxy.size.width - trailingSpace)
//                }
//            }.padding(.horizontal, spacing)
//            
//                .offset(x: (CGFloat(currentIndex) * -width ) + (currentIndex != 0 ? adjustmentWidth : 0) + offset)
//    
//                .gesture(
//                    DragGesture()
//                        .updating($offset, body: {value, out, _ in
//                            out = value.translation.width
//                        })
//                .onEnded({value in
//                    
//                    //updating current index
//                    let offsetX = value.translation.width
//                    let progress = -offsetX / width
//                    let roundIndex = progress.rounded()
//                    
//                 //   currentIndex += Int(roundIndex)
//                    
//                    currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
//                    //updating index:
//                    
//                    currentIndex = index
//                    
//                    
//                    
//                })
//                .onChanged({ value in
//                    
//                    //updating current index
//                    let offsetX = value.translation.width
//                    let progress = -offsetX / width
//                    let roundIndex = progress.rounded()
//                    
//                 //   currentIndex += Int(roundIndex)
//                    
//                    index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
//                    //updating index:
//                    
//                
//                    
//                })
//            )
//        }
//        //animating when offset = 0
//        .animation(.easeInOut, value: offset == 0)
//    }
//}
//
//struct SnapCarousel_Previews: PreviewProvider {
//    static var previews: some View {
//        SnapView()
//    }
//}
