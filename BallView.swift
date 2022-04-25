import SwiftUI
import SceneKit
import Foundation

struct BallView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("This is the most boring shape, keep rolling on!").padding(.bottom, 60.0)
        }
    }
}

func show_ball() {
    let out = pow(cos(0.3*Double.pi), -1.0)
    let a = pow((4-pow(cos(0.3*Double.pi), -2.0)), 0.5)
    let b = 4*sin(0.4*Double.pi) - 2*a
    let offset = 0.5*b
    let positions = [
        [out, offset, 0.0],
        rotate(coordinates: [out, -b+offset, 0.0], angle: 108)
    ]
    add_sphere(coordinates: [0.0, a+offset, 0.0])
    add_sphere(coordinates: [0.0, -a-b+offset, 0.0])
    for position in positions {
        add_multiple_spheres(coordinates: position, n: 5)
    }
}
