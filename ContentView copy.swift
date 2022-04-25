//import SwiftUI
//import SceneKit
//
//let sceneView = SCNView()
//
//
//struct ContentView: View {
//    @State private var slider_value = 5.0
//
//    var body: some View {
//        VStack {
//            Text("Hello, world!")
////            Group {
////                Button("Show 1") {
////                    hide_object()
////                    show_object(object: 1)
////                    sceneView.allowsCameraControl = true
////                }
////                Button("Show 2") {
////                    hide_object()
////                    show_object(object: 2)
////                    sceneView.allowsCameraControl = true
////                }
////                Button("Show 3") {
////                    hide_object()
////                    show_object(object: 3)
////                    sceneView.allowsCameraControl = true
////                }
////                Button("Show 4") {
////                    hide_object()
////                    show_object(object: 4)
////                    sceneView.allowsCameraControl = true
////                }
////                Button("Show 5") {
////                    hide_object()
////                    show_object(object: 5)
////                    sceneView.allowsCameraControl = true
////                }
////                Button("Show 6") {
////                    hide_object()
////                    show_object(object: 6)
////                    sceneView.allowsCameraControl = true
////                }
////                Button("Show 7") {
////                    hide_object()
////                    show_object(object: 7)
////                    sceneView.allowsCameraControl = true
////                }
////            }
//            Button("Show Shape") {
//                hide_object()
//                show_object(size: Int(slider_value))
//                sceneView.allowsCameraControl = true
//            }
//            Button("Clear") {
//                hide_object()
//                sceneView.allowsCameraControl = false
//            }
//            Slider(
//                value: $slider_value,
//                in: 3...10,
//                step: 1
//            ) {
//                Text("Speed")
//            } minimumValueLabel: {
//                Text("3")
//            } maximumValueLabel: {
//                Text("10")
//            }
//            Text("\(Int(slider_value))")
//
////            Button("Print") {
////                print(rotate(coordinates: [1.0, 1.0, 1.0], angle: 90))
////            }
//            SceneKitView()
//        }
//    }
//}
//
//struct SceneKitView: UIViewRepresentable {
//    func makeUIView(context: UIViewRepresentableContext<SceneKitView>) -> SCNView {
//        sceneView.scene = SCNScene()
//        sceneView.autoenablesDefaultLighting = true
////        sceneView.backgroundColor = UIColor.white
//        sceneView.backgroundColor = .systemBackground
//        sceneView.allowsCameraControl = false
////        let camera = SCNCamera()
////        let cameraNode = SCNNode()
////        cameraNode.camera = camera
////        cameraNode.position = SCNVector3(x: 5.0, y: 5.0, z: 0.0)
//
//        return sceneView
//    }
//    func updateUIView(_ uiView: SCNView, context: UIViewRepresentableContext<SceneKitView>) {
//    }
////    typealias UIViewType = SCNView
//}
//
//func show_object(size: Int) {
////    if (object == 1) {
////        let sphere = SCNSphere(radius: 1.0)
////        sphere.firstMaterial?.diffuse.contents = UIColor.lightGray
////        let spherenode = SCNNode(geometry: sphere)
////        spherenode.position = SCNVector3(x: 0.0, y: 0.0, z: 0.0)
////
////        let sphere2 = SCNSphere(radius: 1.0)
////        sphere2.firstMaterial?.diffuse.contents = UIColor.red
////        let spherenode2 = SCNNode(geometry: sphere2)
////        spherenode2.position = SCNVector3(x: 0.0, y: 2.0, z: 0.0)
////
////        let sphere3 = SCNSphere(radius: 1.0)
////        sphere3.firstMaterial?.diffuse.contents = UIColor.yellow
////        let spherenode3 = SCNNode(geometry: sphere3)
////        spherenode3.position = SCNVector3(x: 0.0, y: 0.0, z: 2.0)
////
////        sceneView.scene?.rootNode.addChildNode(spherenode)
////        sceneView.scene?.rootNode.addChildNode(spherenode2)
////        sceneView.scene?.rootNode.addChildNode(spherenode3)
////    }
////    else if (object == 2) {
////        let sphere = SCNSphere(radius: 1.0)
////        sphere.firstMaterial?.diffuse.contents = UIColor.lightGray
////        let spherenode = SCNNode(geometry: sphere)
////        spherenode.position = SCNVector3(x: 0.0, y: 0.0, z: 0.0)
////
////        let sphere2 = SCNSphere(radius: 1.0)
////        sphere2.firstMaterial?.diffuse.contents = UIColor.red
////        let spherenode2 = SCNNode(geometry: sphere2)
////        spherenode2.position = SCNVector3(x: 1.0, y: 1.0, z: 1.0)
////
////        let sphere3 = SCNSphere(radius: 1.0)
////        sphere3.firstMaterial?.diffuse.contents = UIColor.yellow
////        let spherenode3 = SCNNode(geometry: sphere3)
////        spherenode3.position = SCNVector3(x: -1.0, y: 1.0, z: -1.0)
////
////        sceneView.scene?.rootNode.addChildNode(spherenode)
////        sceneView.scene?.rootNode.addChildNode(spherenode2)
////        sceneView.scene?.rootNode.addChildNode(spherenode3)
////    }
////    else if (object == 3) {
//////        1.7 out = sec54
//////        1.7 bigger down = 4sin72 - 2x1.05
//////        1.05 down = sqrt(2^2-sec54^2)
////        let positions = [
////            [1.7, 0.0, 0.0],
////            rotate(coordinates: [1.7, -1.7, 0.0], angle: 108)
////        ]
////        add_sphere(coordinates: [0.0, 1.05, 0.0])
////        add_sphere(coordinates: [0.0, -2.75, 0.0])
////        for position in positions {
////            add_multiple_spheres(coordinates: position, n: 5)
////        }
////    }
////    else if (object == 4) {
////        let vertical = pow((4-pow(cos(0.3*Double.pi), -2.0)), 0.5)
////        let out = pow(cos(0.3*Double.pi), -1.0)
////        let a = out * sin(0.1*Double.pi)
////        let b = out * cos(0.1*Double.pi)
////
////        add_sphere(coordinates: [0.0, 0, 0.0])
////        add_sphere(coordinates: [0.0, 8*vertical, 0.0])
////
////        let positions = [
////            [out, vertical, 0.0],
////            [2*out, 2*vertical, 0.0],
////
////            [a+out, 2*vertical, b],
////            [2*a+out, 3*vertical, 2*b],
////            [a+2*out, 3*vertical, b],
////            [2*a+2*out, 4*vertical, 2*b],
////            [2*a+out, 5*vertical, 2*b],
////            [a+2*out, 5*vertical, b],
////            [a+out, 6*vertical, b],
////
////            [2*out, 4*vertical, 0.0],
////            [2*out, 6*vertical, 0.0],
////            [out, 7*vertical, 0.0],
////        ]
////
////        for position in positions {
////            add_multiple_spheres(coordinates: position, n: 5)
////        }
////    }
////    else if (object == 5) {
////        let vertical = pow((4-pow(cos(0.3*Double.pi), -2.0)), 0.5)
////        let out = pow(cos(0.3*Double.pi), -1.0)
////        let a = out * sin(0.1*Double.pi)
////        let b = out * cos(0.1*Double.pi)
////
////        add_sphere(coordinates: [0.0, 4*vertical, 0.0])
////
////        let positions = [
////            [out, 3*vertical, 0.0],
////            [2*out, 2*vertical, 0.0],
////
////            [a+out, 2*vertical, b],
////            [2*a+out, 3*vertical, 2*b],
////            [a+2*out, 3*vertical, b],
////            [2*a+2*out, 4*vertical, 2*b],
////            [2*a+out, 5*vertical, 2*b],
////            [a+2*out, 5*vertical, b],
////            [a+out, 6*vertical, b],
////
////            [2*out, 4*vertical, 0.0],
////            [2*out, 6*vertical, 0.0],
////            [out, 5*vertical, 0.0],
////        ]
////
////        for position in positions {
////            add_multiple_spheres(coordinates: position, n: 5)
////        }
////    }
////    else if (object == 6) {
////        let vertical = pow((4-pow(cos(0.3*Double.pi), -2.0)), 0.5)
////        let out = pow(cos(0.3*Double.pi), -1.0)
////        let a = out * sin(0.1*Double.pi)
////        let b = out * cos(0.1*Double.pi)
////
////
////        let positions = [
////            [2*out, 2*vertical, 0.0],
////
////            [a+out, 2*vertical, b],
////            [2*a+out, 3*vertical, 2*b],
////            [a+2*out, 3*vertical, b],
////            [2*a+2*out, 4*vertical, 2*b],
////            [2*a+out, 5*vertical, 2*b],
////            [a+2*out, 5*vertical, b],
////            [a+out, 6*vertical, b],
////
////            [2*out, 4*vertical, 0.0],
////            [a+out, 4*vertical, b],
////            [2*out, 6*vertical, 0.0],
////        ]
////
////        for position in positions {
////            add_multiple_spheres(coordinates: position, n: 5)
////        }
////    }
////    else if (object == 7) {
////        let vertical = pow((4-pow(cos(0.3*Double.pi), -2.0)), 0.5)
////        let out = pow(cos(0.3*Double.pi), -1.0)
////        let a = out * sin(0.1*Double.pi)
////        let b = out * cos(0.1*Double.pi)
////
////        add_sphere(coordinates: [0.0, 0, 0.0])
////
////        let positions = [
////            [out, vertical, 0.0],
////            [2*out, 2*vertical, 0.0],
////            [3*out, 3*vertical, 0.0],
////
////            [1*a+1*out, 2*vertical, 1*b],
////            [2*a+1*out, 3*vertical, 2*b],
////            [3*a+1*out, 4*vertical, 3*b],
////            [1*a+2*out, 3*vertical, 1*b],
////            [2*a+2*out, 4*vertical, 2*b],
////            [3*a+2*out, 5*vertical, 3*b],
////            [1*a+3*out, 4*vertical, 1*b],
////            [2*a+3*out, 5*vertical, 2*b],
////            [3*a+3*out, 6*vertical, 3*b],
////
////            [1*a+1*out, 10*vertical, 1*b],
////            [2*a+1*out, 9*vertical, 2*b],
////            [3*a+1*out, 8*vertical, 3*b],
////            [1*a+2*out, 9*vertical, 1*b],
////            [2*a+2*out, 8*vertical, 2*b],
////            [3*a+2*out, 7*vertical, 3*b],
////            [1*a+3*out, 8*vertical, 1*b],
////            [2*a+3*out, 7*vertical, 2*b],
////
////            [3*out, 5*vertical, 0.0],
////            [3*out, 7*vertical, 0.0],
////
////            [1*a+3*out, 6*vertical, 1*b],
////            [3*a+1*out, 6*vertical, 3*b],
////
////            [3*out, 9*vertical, 0.0],
////            [2*out, 10*vertical, 0.0],
////            [out, 11*vertical, 0.0],
////        ]
////        add_sphere(coordinates: [0.0, 12*vertical, 0.0])
////
////        for position in positions {
////            add_multiple_spheres(coordinates: position, n: 5)
////        }
////    }
////    else if (object == 8) {
//    let vertical = pow((4-pow(cos(0.3*Double.pi), -2.0)), 0.5)
//    let out = pow(cos(0.3*Double.pi), -1.0)
//    let a = out * sin(0.1*Double.pi)
//    let b = out * cos(0.1*Double.pi)
//
//    let tallest = 4*size - 4
//    let offset = tallest/2
//    var positions = [[Double]]()
//
//    add_sphere(coordinates: [0.0, Double(-offset)*vertical, 0.0])
//    add_sphere(coordinates: [0.0, Double(tallest-offset)*vertical, 0.0])
//
//    for i in 1...size-1 {
//        positions.append([Double(i)*out, Double(i-offset)*vertical, 0.0])
//        positions.append([Double(i)*out, Double(tallest-i-offset)*vertical, 0.0])
//    }
//
//    for i in 1...size-1 {
//        for j in 1...size-1 {
//            positions.append([Double(i)*a+Double(j)*out, Double(i+j-offset)*vertical, Double(i)*b])
//            positions.append([Double(i)*a+Double(j)*out, Double(tallest-i-j-offset)*vertical, Double(i)*b])
//            if (i == size-1 || j == size-1) {
//                var temp = 0
//                while (i+j+2+temp < tallest-i-j) {
//                    positions.append([Double(i)*a+Double(j)*out, Double(i+j+2+temp-offset)*vertical, Double(i)*b])
//                    temp += 2
//                }
//            }
//        }
//    }
//
//    for i in 1...size-2 {
//        positions.append([Double(size-1)*out, Double(2*i+size-1-offset)*vertical, 0.0])
//    }
//
//
////    positions = [
////        [out, vertical, 0.0],
////        [2*out, 2*vertical, 0.0],
////        [3*out, 3*vertical, 0.0],
////
////        [1*a+1*out, 2*vertical, 1*b],
////        [2*a+1*out, 3*vertical, 2*b],
////        [3*a+1*out, 4*vertical, 3*b],
////        [1*a+2*out, 3*vertical, 1*b],
////        [2*a+2*out, 4*vertical, 2*b],
////        [3*a+2*out, 5*vertical, 3*b],
////        [1*a+3*out, 4*vertical, 1*b],
////        [2*a+3*out, 5*vertical, 2*b],
////        [3*a+3*out, 6*vertical, 3*b],
////
////        [1*a+1*out, 10*vertical, 1*b],
////        [2*a+1*out, 9*vertical, 2*b],
////        [3*a+1*out, 8*vertical, 3*b],
////        [1*a+2*out, 9*vertical, 1*b],
////        [2*a+2*out, 8*vertical, 2*b],
////        [3*a+2*out, 7*vertical, 3*b],
////        [1*a+3*out, 8*vertical, 1*b],
////        [2*a+3*out, 7*vertical, 2*b],
////
////        [3*out, 5*vertical, 0.0],
////        [3*out, 7*vertical, 0.0],
////        [1*a+3*out, 6*vertical, 1*b],
////        [3*a+1*out, 6*vertical, 3*b],
////
////        [3*out, 9*vertical, 0.0],
////        [2*out, 10*vertical, 0.0],
////        [out, 11*vertical, 0.0],
////    ]
////
//    for position in positions {
//        add_multiple_spheres(coordinates: position, n: 5)
//    }
//
//}
//
//func hide_object() {
//    sceneView.scene?.rootNode.enumerateChildNodes { (node, stop) in node.removeFromParentNode()}
//}
//
//func rotate3d(coordinates: [Double], angle: [Int]) -> Array<Double> {
//    let x = coordinates[0]
//    let y = coordinates[1]
//    let z = coordinates[2]
//
//    let a: Double = Double(angle[0])*Double.pi/180
//    let b: Double = Double(angle[1])*Double.pi/180
//    let c: Double = Double(angle[2])*Double.pi/180
//
//    let new_x = (cos(b)*cos(c))*x+(cos(b)*sin(c))*y+(-sin(b))*z
//    let new_y = (sin(a)*sin(b)*cos(c)-cos(a)*sin(c))*x+(sin(a)*sin(b)*sin(c)+cos(a)*cos(c))*y+(sin(a)*cos(b))*z
//    let new_z = (cos(a)*sin(b)*cos(c)+sin(a)*sin(c))*x+(cos(a)*sin(b)*sin(c)-sin(a)*cos(c))*y+(cos(a)*cos(b))*z
//
//    return [new_x, new_y, new_z]
//
//}
//
//func rotate(coordinates: [Double], angle: Int) -> Array<Double> {
//    let x = coordinates[0]
//    let z = coordinates[2]
//    let a = Double(angle)*Double.pi/180
//    return [(cos(a)*x-sin(a)*z), coordinates[1], (sin(a)*x+cos(a)*z)]
//}
//
//func add_sphere(coordinates: [Double]) {
//    let x = coordinates[0]
//    let y = coordinates[1]
//    let z = coordinates[2]
//    let sphere = SCNSphere(radius: 1.0)
//    sphere.firstMaterial?.diffuse.contents = UIColor.lightGray
//    let node = SCNNode(geometry: sphere)
//    node.position = SCNVector3(x: Float(x), y:Float(y), z: Float(z))
//
//    sceneView.scene?.rootNode.addChildNode(node)
//}
//
//func add_multiple_spheres(coordinates: [Double], n: Int) {
//    for i in 1...n {
//        add_sphere(coordinates: rotate(coordinates: coordinates, angle: 360/n*i))
//    }
//}
