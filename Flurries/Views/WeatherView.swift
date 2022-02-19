//
//  WeatherView.swift
//  Flurries
//
//  Created by Patrick Serrano on 2/19/22.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                                .padding(.horizontal)
                            
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(width: 130, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLikeFahrenheit.roundDouble() + "°")
                            .font(.system(size:100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                    VStack {
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Weather Now")
                                .bold()
                                .padding(.bottom)
                            
                            HStack {
                                WeatherRow(logo: "thermometer", name: "Min Temp", value: (weather.main.tempMinFahrenheit.roundDouble() + ("°")))
                                Spacer()
                                WeatherRow(logo: "thermometer", name: "Max Temp", value: (weather.main.tempMaxFahrenheit.roundDouble() + ("°")))
                            }
                            
                            HStack {
                                WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                                Spacer()
                                WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                        .padding(.bottom, 40)
                        .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                        .background(.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
