import SwiftUI

struct ParamsViewDC: View {
    
    @State private var capacity = 100.0
    @State private var contractedLoad = 10.0
    @State private var isEditing = false
    @State private var desiredCharge = 100.0
    @State private var vehicleConsumption = 100.0
    @State private var range = 100.0
    
    private var timeToFullCharge: Double {
        ( (capacity * desiredCharge) / contractedLoad ) / 100
    }
    private var chargingCurrent: Double {
        ( contractedLoad*1000 ) / 230
    }
    private var estimagedRange: Double {
        ( capacity * 1000 ) / vehicleConsumption + Double.random(in: 1...20)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 5) {
                Text("DC Charge").font(.title3).bold()
                Image(systemName: "bolt.car")
                    .resizable()
                    .renderingMode(.original)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .scaledToFit()
                    .frame(height: 60)
                Text("Estimated time to charge \(Int(desiredCharge))% is:\n")
                Text("\((timeToFullCharge), specifier: "%.2f") Hours")
                    .foregroundColor((isEditing ? .green : .blue))
                Text("Estimated range is:\n")
                Text("\((estimagedRange), specifier: "%.2f") Km")
                    .foregroundColor((isEditing ? .green : .blue))
            }
            Divider()
            Text("Paremeters to calculate charge time needed").font(.title3)
            Divider()
            Text("Select car battery capacity (Kw/h)").padding()
            Image(systemName: "bolt.batteryblock")
                .resizable()
                .renderingMode(.original)
                .foregroundColor(.red)
                .scaledToFit()
                .frame(height: 30)
            //}
            VStack(spacing: 0) {
                Slider(value: $capacity,
                       in: 0...100
                )
                {
                    Text("Values from 0 to 100")
                }minimumValueLabel: {
                    Text("0")
                }
            maximumValueLabel: {
                Text("100")
            } onEditingChanged: {
                editing in
                isEditing = editing
            }
                Text("\(capacity, specifier: "%.2f") Kw/h")
                    .foregroundColor(isEditing ? .green : .red)
                Text("Select power load (Kw)").padding()
                Image(systemName: "bolt.square")
                    .resizable()
                    .renderingMode(.original)
                    .foregroundColor(.red)
                    .scaledToFit()
                    .frame(height: 30)
            }
            VStackLayout(spacing: 0) {
                Slider(
                    value: $contractedLoad,
                    in: 11...150,
                    step: 1
                ) {
                    Text("Values from 11 to 150")
                } minimumValueLabel: {
                    Text("11")
                } maximumValueLabel: {
                    Text("150")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                Text("\(contractedLoad, specifier: "%.2f") Kw")
                    .foregroundColor(isEditing ? .green : .red)
            }
            Text("Select desired charge percentage (%)").padding()
            Image(systemName: "battery.100percent.bolt")
                .resizable()
                .renderingMode(.original)
                .foregroundColor(.red)
                .scaledToFit()
                .frame(height: 30)
            VStackLayout(spacing: 0) {
                Slider(
                    value: $desiredCharge,
                    in: 25...100,
                    step: 25
                ) {
                    Text("Values from 25 to 100")
                } minimumValueLabel: {
                    Text("25")
                } maximumValueLabel: {
                    Text("100")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                Text("\(Int(desiredCharge))%").foregroundColor(isEditing ? .green : .red)
            }
            Text("Select estimated vehicle Consumption (Wh/km)").padding()
            Image(systemName: "car.rear.road.lane.dashed")
                .resizable()
                .renderingMode(.original)
                .foregroundColor(.red)
                .scaledToFit()
                .frame(height: 30)
            VStackLayout(spacing: 0) {
                Slider(
                    value: $vehicleConsumption,
                    in: 50...200
                ) {
                    Text("Values from 50 to 200")
                } minimumValueLabel: {
                    Text("50")
                } maximumValueLabel: {
                    Text("200")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                Text("\(vehicleConsumption, specifier: "%.2f") Wh/km")
                    .foregroundColor(isEditing ? .green : .red)
            }
            Divider()
            //            VStackLayout(spacing: 10) {
            //                Text("Time to charge \(Int(desiredCharge))% is: ")
            //                Text("\((timeToFullCharge), specifier: "%.2f") Hours").foregroundColor((isEditing ? .green : .blue))
            //            }
            //            VStackLayout(spacing: 10) {
            //                Text("Recomended charging current is: ")
            //                Text("\((chargingCurrent), specifier: "%.2f") A")
            //                    .foregroundColor((isEditing ? .green : .blue))
            //            }
        }
    }
}
#Preview {
    ParamsViewDC()
}
