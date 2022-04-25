import SwiftUI
import SceneKit
import Foundation

struct ThreeView: View {
    @State private var size_value: Int = 4
    @State private var bipyramid: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Group {
                    Text("Size: \(size_value)").padding(.leading, 10.0)
                    Button(action: {
                        if (size_value > 2) {
                            size_value -= 1
                        }
                    }) {
                        Image(systemName: "minus.square")
                    }.buttonStyle(.bordered)
                    Button(action: {
                        if (size_value < 8) {
                            size_value += 1
                        }
                    }) {
                        Image(systemName: "plus.square")
                    }.buttonStyle(.bordered)
                    Spacer()
                }
                Group {
                    Button("Bipyramid") {
                        bipyramid.toggle()
                    }.padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12.0)
                                .stroke(Color.blue, lineWidth: (bipyramid ? 2.0 : 0.0))
                        )
                    Spacer()
                }
                Group {
                    Button("Update Shape") {
                        delete_shape()
                        show_three(size: size_value, bipyramid: bipyramid)
                        sceneView.allowsCameraControl = true
                    }.buttonStyle(.bordered)
                    Button("Clear") {
                        delete_shape()
                        sceneView.allowsCameraControl = false
                    }.padding(.trailing, 10.0).buttonStyle(.bordered)
                }
            }.padding(.top, 10.0)
            Spacer()
        }
    }
}

func show_three(size: Int, bipyramid: Bool) {
    let up = sqrt(2/3)*2
    let out = 2.0
    let a = 2*cos(Double.pi/3)
    let b = 2*sin(Double.pi/3)
    
    var positions = [[Double]]()
    
    for s in 0...size-2 {
        add_sphere(coordinates: [0.0, Double(s)*up, 0.0])
        if (bipyramid) {
            add_sphere(coordinates: [0.0, -Double(s)*up, 0.0])
        }
        for i in 0...size-1-s {
            positions.append([Double(i)*out, Double(s)*up, 0.0])
            if (bipyramid) {
                positions.append([Double(i)*out, -Double(s)*up, 0.0])
            }
            for j in 0...size-1-s {
                positions.append([Double(i)*out+Double(j)*a, Double(s)*up, Double(j)*b])
                if (bipyramid) {
                    positions.append([Double(i)*out+Double(j)*a, -Double(s)*up, Double(j)*b])
                }
                if (i+j <= 2*size-s) {
                    positions.append([Double(i)*out-Double(j)*a, Double(s)*up, Double(j)*b])
                    if (bipyramid) {
                        positions.append([Double(i)*out-Double(j)*a, -Double(s)*up, Double(j)*b])
                    }
                }
            }
        }
    }
    
    add_sphere(coordinates: [0.0, Double(size-1)*up, 0.0])
    if (bipyramid) {
        add_sphere(coordinates: [0.0, -Double(size-1)*up, 0.0])
    }
    for position in positions {
        add_multiple_spheres(coordinates: position, n: 3)
    }
}

//func show_three(size: Int) {
//    let up = sqrt(2/3)*2
//    let out = 2*sqrt(3)
//    let a = 2*cos(Double.pi/3)
//    let b = 2*sin(Double.pi/3)
//
//    let positions = [
//        rotate(coordinates: [out, 0.0, 0.0], angle: 30),
//        [1*a, 0.0, 1*b],
//        [1*a-2, 0.0, 1*b],
//        [2*a, 0.0, 2*b],
//        [2*a-2, 0.0, 2*b],
//        [2*a, 0.0, 2*b-2]
//    ]
//
//    add_sphere(coordinates: [0.0, Double(size)*up, 0.0])
//    add_sphere(coordinates: [0.0, 0.0, 0.0])
//    add_sphere(coordinates: [6.0, 0.0, 0.0])
//    for position in positions {
//        add_multiple_spheres(coordinates: position, n: 3)
//    }
//}
