import SwiftUI
import PlaygroundSupport
import Charts

struct MountPrice: Identifiable {
    var id = UUID()
    var mount: String
    var value: Double
}

struct MountCombinePrice: Identifiable {
    var id = UUID()
    var mount: String
    var value: Double
    var type: String
}

struct ChartsExample: View {
    var body: some View {
        List {
            Chart {
                BarMark(
                    x: .value("Mount", "jan/22"),
                    y: .value("Value", 5)
                )
                BarMark(
                    x: .value("Mount", "feb/22"),
                    y: .value("Value", 4)
                )
                BarMark(
                    x: .value("Mount", "mar/22"),
                    y: .value("Value", 7)
                )
            }
            .frame(height: 250)
        }
    }
}

struct ChartsCustomExample: View {
    let data: [MountPrice] = [
        MountPrice(mount: "jan/22", value: 5),
        MountPrice(mount: "feb/22", value: 4),
        MountPrice(mount: "mar/22", value: 7),
        MountPrice(mount: "apr/22", value: 15),
        MountPrice(mount: "may/22", value: 14),
        MountPrice(mount: "jun/22", value: 27),
        MountPrice(mount: "jul/22", value: 27)
    ]
        
    var body: some View {
        List {
            Chart(data) {
                LineMark(
                    x: .value("Mount", $0.mount),
                    y: .value("Value", $0.value)
                )
                PointMark(
                    x: .value("Mount", $0.mount),
                    y: .value("Value", $0.value)
                )
            }
            .frame(height: 250)
        }
    }
}

struct ChartsCombineExample: View {
    let data: [MountCombinePrice] = [
        MountCombinePrice(mount: "jan/22", value: 5, type: "A"),
        MountCombinePrice(mount: "feb/22", value: 4, type: "A"),
        MountCombinePrice(mount: "mar/22", value: 7, type: "A"),
        MountCombinePrice(mount: "apr/22", value: 15, type: "A"),
        MountCombinePrice(mount: "may/22", value: 14, type: "A"),
        MountCombinePrice(mount: "jun/22", value: 27, type: "A"),
        MountCombinePrice(mount: "jul/22", value: 27, type: "A"),
        
        MountCombinePrice(mount: "jan/22", value: 15, type: "B"),
        MountCombinePrice(mount: "feb/22", value: 14, type: "B"),
        MountCombinePrice(mount: "mar/22", value: 17, type: "B"),
        MountCombinePrice(mount: "apr/22", value: 25, type: "B"),
        MountCombinePrice(mount: "may/22", value: 24, type: "B"),
        MountCombinePrice(mount: "jun/22", value: 37, type: "B"),
        MountCombinePrice(mount: "jul/22", value: 49, type: "B")
    ]
        
    var body: some View {
        List {
            Chart {
                ForEach(data) {
                    AreaMark(
                        x: .value("Mount", $0.mount),
                        y: .value("Value", $0.value)
                    )
                    .foregroundStyle(by: .value("Type", "Series \($0.type)"))
                }
            }
            .frame(height: 250)
        }
    }
}

//let view = ChartsExample()
//let view = ChartsCustomExample()
let view = ChartsCombineExample()
let hostingVC = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = hostingVC
