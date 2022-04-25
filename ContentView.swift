import SwiftUI
import SceneKit

let sceneView = SCNView()

struct ContentView: View {
    @State var selection: Int = 5
    @State var modal = false
    
    var body: some View {
        ZStack {
            SceneKitView()
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Spacer()
                    Group {
                        Button(action: {
                            selection = 2
                            delete_shape()
                            show_ball()
                        }) {
                            HStack {
                                Image(systemName: "circle" + ((selection == 2) ? ".fill" : ""))
                                Text("Ball")
                            }.padding(10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12.0)
                                    .stroke(lineWidth: ((selection == 2) ? 2.0 : 0.0))
                            )
                        }
                        Spacer()
                        Button(action: {
                            selection = 3
                            delete_shape()
                            show_three(size: 4, bipyramid: false)
                        }) {
                            HStack {
                                Image(systemName: "triangle" + ((selection == 3) ? ".fill" : ""))
                                Text("Triangle")
                            }.padding(10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8.0)
                                    .stroke(lineWidth: ((selection == 3) ? 2.0 : 0.0))
                            )
                        }
                        Spacer()
                        Button(action: {
                            selection = 4
                            delete_shape()
                            show_four(size: 4, hollow: true)
                        }) {
                            HStack {
                                Image(systemName: "circle.grid.2x2" + ((selection == 4) ? ".fill" : ""))
                                Text("Square")
                            }.padding(10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8.0)
                                    .stroke(lineWidth: ((selection == 4) ? 2.0 : 0.0))
                            )
                        }
                        Spacer()
                        Button(action: {
                            selection = 5
                            delete_shape()
                            show_five(size: 6, center: 1, star: true)
                        }) {
                            HStack {
                                Image(systemName: "pentagon" + ((selection == 5) ? ".fill" : ""))
                                Text("Pentagon")
                            }.padding(10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8.0)
                                    .stroke(lineWidth: ((selection == 5) ? 2.0 : 0.0))
                            )
                        }
                        Spacer()
                        Button(action: {
                            selection = 6
                            delete_shape()
                            show_six(size: 5, bipyramid: false)
                        }) {
                            HStack {
                                Image(systemName: "circle.hexagongrid" + ((selection == 6) ? ".fill" : ""))
                                Text("Hexagon")
                            }.padding(10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12.0)
                                    .stroke(lineWidth: ((selection == 6) ? 2.0 : 0.0))
                            )
                        }
                    }
                    Spacer()
                    Button(action: {
                        modal.toggle()
                    }) {
                        HStack {
                            Image(systemName: "questionmark.circle")
                            Text("About")
                    } }.sheet(isPresented: $modal) {
                        Group {
                            Text("Hello!").fontWeight(.bold)
                            Text("""
                                This app was inspired by one of my favourite toys: Spherical magnetic balls.
                                Using these magnets, I really enjoyed creating complex shapes and patterns, and sharing these ideas on social media.
                            """).multilineTextAlignment(.center)
                            Image("stars").resizable().scaledToFit()
                            Text("""
                                The image above is a hollow star which I made in real life, which can also be created digitally in the "Pentagon" page.
                            
                                One of the issues when sharing these pictures was that it was hard to see the shape from different angles. Therefore, I created this interactive app which can display multiple designs in 3D!

                                I hope to add more complicated designs in the future too, such as the one below!
                            """).multilineTextAlignment(.center)
                            
                            Image("ball").resizable().scaledToFit()
                            Text("""
                                I hope that this app is interesting and fun to use!
                                Have a nice day!
                            """).multilineTextAlignment(.center)
                            
                            Spacer()
                            Spacer()
                            Button("Dismiss") {
                                modal.toggle()
                            }.buttonStyle(.borderedProminent)
                            Spacer()
                        }.padding(20.0)
                    }
                    Spacer()
                    Spacer()
                }
            }
            BallView().opacity((selection == 2) ? 1.0 : 0.0)
            ThreeView().opacity((selection == 3) ? 1.0 : 0.0)
            FourView().opacity((selection == 4) ? 1.0 : 0.0)
            FiveView().opacity((selection == 5) ? 1.0 : 0.0)
            SixView().opacity((selection == 6) ? 1.0 : 0.0)
        }
    }
}

struct SceneKitView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<SceneKitView>) -> SCNView {
        sceneView.scene = SCNScene()
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = .systemBackground
        sceneView.backgroundColor = UIColor.clear
        sceneView.allowsCameraControl = true
        
        show_five(size: 6, center: 1, star: true)

        return sceneView
    }
    func updateUIView(_ uiView: SCNView, context: UIViewRepresentableContext<SceneKitView>) {
    }
//    typealias UIViewType = SCNView
}

func delete_shape() {
    sceneView.scene?.rootNode.enumerateChildNodes { (node, stop) in node.removeFromParentNode()}
}

func rotate3d(coordinates: [Double], angle: [Int]) -> Array<Double> {
    let x = coordinates[0]
    let y = coordinates[1]
    let z = coordinates[2]
    
    let a: Double = Double(angle[0])*Double.pi/180
    let b: Double = Double(angle[1])*Double.pi/180
    let c: Double = Double(angle[2])*Double.pi/180
    
    let new_x = (cos(b)*cos(c))*x+(cos(b)*sin(c))*y+(-sin(b))*z
    let new_y = (sin(a)*sin(b)*cos(c)-cos(a)*sin(c))*x+(sin(a)*sin(b)*sin(c)+cos(a)*cos(c))*y+(sin(a)*cos(b))*z
    let new_z = (cos(a)*sin(b)*cos(c)+sin(a)*sin(c))*x+(cos(a)*sin(b)*sin(c)-sin(a)*cos(c))*y+(cos(a)*cos(b))*z
    
    return [new_x, new_y, new_z]
    
}

func rotate(coordinates: [Double], angle: Int) -> Array<Double> {
    let x = coordinates[0]
    let z = coordinates[2]
    let a = Double(angle)*Double.pi/180
    return [(cos(a)*x-sin(a)*z), coordinates[1], (sin(a)*x+cos(a)*z)]
}

func add_sphere(coordinates: [Double]) {
    let x = coordinates[0]
    let y = coordinates[1]
    let z = coordinates[2]
    let sphere = SCNSphere(radius: 1.0)
    sphere.firstMaterial?.diffuse.contents = UIColor.lightGray
    let node = SCNNode(geometry: sphere)
    node.position = SCNVector3(x: Float(x), y:Float(y), z: Float(z))
    
    sceneView.scene?.rootNode.addChildNode(node)
}

func add_multiple_spheres(coordinates: [Double], n: Int) {
    for i in 1...n {
        add_sphere(coordinates: rotate(coordinates: coordinates, angle: 360/n*i))
    }
}
