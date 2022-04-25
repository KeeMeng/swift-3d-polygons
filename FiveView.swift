import SwiftUI
import SceneKit
import Foundation

struct FiveView: View {
    @State private var size_value: Int = 6
    @State private var center_value: Int = 1
    @State private var star: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Group {
                    Text("Size: \(size_value)").padding(.leading, 10.0)
                    Button(action: {
                        if (size_value > 3) {
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
                    Button("Convex Center") {
                        center_value = 0
                    }.padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12.0)
                                .stroke(Color.blue, lineWidth: ((center_value == 0) ? 2.0 : 0.0))
                        )
                    Button("Concave Center") {
                        center_value = 1
                    }.padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12.0)
                                .stroke(Color.blue, lineWidth: ((center_value == 1) ? 2.0 : 0.0))
                        )
                    Button("Hollow Center") {
                        center_value = 2
                    }.padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12.0)
                                .stroke(Color.blue, lineWidth: ((center_value == 2) ? 2.0 : 0.0))
                        )
                    Spacer()
                }
                Group {
                    Button("Star") {
                        star.toggle()
                    }.padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12.0)
                                .stroke(Color.blue, lineWidth: star ? 2.0 : 0.0)
                        )
                    Spacer()
                }
                Group {
                    Button("Update Shape") {
                        delete_shape()
                        show_five(size: size_value, center: center_value, star: star)
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

func show_five(size: Int, center: Int, star: Bool) {
    let vertical = pow((4-pow(cos(0.3*Double.pi), -2.0)), 0.5)
    let out = pow(cos(0.3*Double.pi), -1.0)
    let a = out * sin(0.1*Double.pi)
    let b = out * cos(0.1*Double.pi)
    
    let tallest = 4*size - 4
    let offset = tallest/2
    var positions = [[Double]]()
    
    if (center == 0) {
        add_sphere(coordinates: [0.0, Double(-offset)*vertical, 0.0])
        add_sphere(coordinates: [0.0, Double(tallest-offset)*vertical, 0.0])
    }
    else if (center == 1) {
        add_sphere(coordinates: [0.0, 0.0, 0.0])
    }
    
    for i in 1...size-1 {
        if (center == 0) {
            positions.append([Double(i)*out, Double(i-offset)*vertical, 0.0])
            positions.append([Double(i)*out, Double(tallest-i-offset)*vertical, 0.0])
        }
        else if (center == 1) {
            positions.append([Double(i)*out, Double(i-offset+2*size-2)*vertical, 0.0])
            positions.append([Double(i)*out, Double(tallest-i-offset-2*size+2)*vertical, 0.0])
        }
        else if (center == 2) {
            if (i == size-1) {
                positions.append([Double(i)*out, Double(i-offset+2*size-2)*vertical, 0.0])
                positions.append([Double(i)*out, Double(tallest-i-offset-2*size+2)*vertical, 0.0])
            }
        }
    }
    
    for i in 1...size-1 {
        for j in 1...size-1 {
            if (center == 0) {
                positions.append([Double(i)*a+Double(j)*out, Double(i+j-offset)*vertical, Double(i)*b])
                positions.append([Double(i)*a+Double(j)*out, Double(tallest-i-j-offset)*vertical, Double(i)*b])
            }
            else if (center == 1) {
                if (i+j <= size-2) {
                    positions.append([Double(i)*a+Double(j)*out, Double(i+j-offset+2*size-2)*vertical, Double(i)*b])
                    positions.append([Double(i)*a+Double(j)*out, Double(tallest-i-j-offset-2*size+2)*vertical, Double(i)*b])
                }
                else {
                    positions.append([Double(i)*a+Double(j)*out, Double(i+j-offset)*vertical, Double(i)*b])
                    positions.append([Double(i)*a+Double(j)*out, Double(tallest-i-j-offset)*vertical, Double(i)*b])
                }
            }
            else if (center == 2) {
                if (i+j > size-2) {
                    positions.append([Double(i)*a+Double(j)*out, Double(i+j-offset)*vertical, Double(i)*b])
                    positions.append([Double(i)*a+Double(j)*out, Double(tallest-i-j-offset)*vertical, Double(i)*b])
                }
            }
            if (((i == size-1 || j == size-1) && star) || (i+j == size-1 && center == 2)) {
                var temp = 0
                while (i+j+2+temp < tallest-i-j) {
                    positions.append([Double(i)*a+Double(j)*out, Double(i+j+2+temp-offset)*vertical, Double(i)*b])
                    temp += 2
                }
            }
        }
    }
    if !star {
        for i in size...2*size-2 {
            positions.append([Double(i)*out, Double(i-offset)*vertical, 0.0])
            positions.append([Double(i)*out, Double(tallest-i-offset)*vertical, 0.0])
        }
        for i in 1...2*size-2 {
            for j in 1...2*size-2 {
                if ((i+j >= size) && (i+j <= 2*size-2)) {
                    positions.append([Double(i)*a+Double(j)*out, Double(i+j-offset)*vertical, Double(i)*b])
                    positions.append([Double(i)*a+Double(j)*out, Double(tallest-i-j-offset)*vertical, Double(i)*b])
                }
            }
        }
    }
    
    
    if (star || center == 2) {
        for i in 1...size-2 {
            positions.append([Double(size-1)*out, Double(2*i+size-1-offset)*vertical, 0.0])
        }
    }
    
    for position in positions {
        add_multiple_spheres(coordinates: position, n: 5)
    }
}

//    For a size=4 star
//    positions = [
//        [out, vertical, 0.0],
//        [2*out, 2*vertical, 0.0],
//        [3*out, 3*vertical, 0.0],
//
//        [1*a+1*out, 2*vertical, 1*b],
//        [2*a+1*out, 3*vertical, 2*b],
//        [3*a+1*out, 4*vertical, 3*b],
//        [1*a+2*out, 3*vertical, 1*b],
//        [2*a+2*out, 4*vertical, 2*b],
//        [3*a+2*out, 5*vertical, 3*b],
//        [1*a+3*out, 4*vertical, 1*b],
//        [2*a+3*out, 5*vertical, 2*b],
//        [3*a+3*out, 6*vertical, 3*b],
//
//        [1*a+1*out, 10*vertical, 1*b],
//        [2*a+1*out, 9*vertical, 2*b],
//        [3*a+1*out, 8*vertical, 3*b],
//        [1*a+2*out, 9*vertical, 1*b],
//        [2*a+2*out, 8*vertical, 2*b],
//        [3*a+2*out, 7*vertical, 3*b],
//        [1*a+3*out, 8*vertical, 1*b],
//        [2*a+3*out, 7*vertical, 2*b],
//
//        [3*out, 5*vertical, 0.0],
//        [3*out, 7*vertical, 0.0],
//        [1*a+3*out, 6*vertical, 1*b],
//        [3*a+1*out, 6*vertical, 3*b],
//
//        [3*out, 9*vertical, 0.0],
//        [2*out, 10*vertical, 0.0],
//        [out, 11*vertical, 0.0],
//    ]

