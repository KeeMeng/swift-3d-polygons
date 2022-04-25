import SwiftUI
import SceneKit
import Foundation

struct FourView: View {
    @State private var size_value: Int = 4
    @State private var hollow: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Group {
                    Text("Size: \(size_value)").padding(.leading, 10.0)
                    Button(action: {
                        if (size_value > 1) {
                            size_value -= 1
                        }
                    }) {
                        Image(systemName: "minus.square")
                    }.buttonStyle(.bordered)
                    Button(action: {
                        if (size_value < 10) {
                            size_value += 1
                        }
                    }) {
                        Image(systemName: "plus.square")
                    }.buttonStyle(.bordered)
                    Spacer()
                }
                Group {
                    Button("Hollow") {
                        hollow.toggle()
                    }.padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12.0)
                                .stroke(Color.blue, lineWidth: (hollow ? 2.0 : 0.0))
                        )
                    Spacer()
                }
                Group {
                    Button("Update Shape") {
                        delete_shape()
                        show_four(size: size_value, hollow: hollow)
                        sceneView.allowsCameraControl = true
                    }.buttonStyle(.bordered)
                    Button("Clear") {
                        delete_shape()
                        sceneView.allowsCameraControl = false
                    }.padding(.trailing, 10.0).buttonStyle(.bordered)
                }
            }.padding(.top, 10.0)
            Spacer()
            Text("Just a cube, nothing much here...").padding(.bottom, 60.0)
        }
    }
}

func show_four(size: Int, hollow: Bool) {
    let offset: Double = Double(size)/2
    for i in 0...size-1 {
        for j in 0...size-1 {
            for k in 0...size-1 {
                if (!hollow || (hollow && (i == size-1 || j == size-1 || k == size-1 || i == 0 || j == 0 || k == 0))) {
                    add_sphere(coordinates:[Double(i)*2-offset, Double(j)*2-offset, Double(k)*2-offset])
                }
            }
        }
    }
}
