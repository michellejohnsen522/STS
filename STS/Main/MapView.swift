//
//  MapView.swift
//  STS
//
//  Created by admin on 6/3/24.
//



import SwiftUI
import MapKit


struct LocationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var club: Club
    
    var body: some View {
        ZStack {
            MapView(coordinate: CLLocationCoordinate2D(
                latitude: Double(club.latitude ?? "0") ?? 0,
                longitude: Double(club.longtitude ?? "0") ?? 0)
            )
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
            
            VStack {
                Rectangle()
                    .frame(height: 150)
                    .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                    .overlay {
                        VStack {
                            Text(club.name ?? "")
                                .font(.system(size: 22, weight: .bold))
                            
                            
                            Text(club.address ?? "")
                        }
                        .padding(.top, 30)
                        
                        .foregroundColor(.white)
                    }
                    .overlay {
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 22, weight: .bold))
                            }
                            .padding()
                            
                            Spacer()
                        }
                    }
                
                Spacer()
                
                Rectangle()
                    .frame(height: 150)
                    .cornerRadius(12, corners: [.topLeft, .topRight])
                    .overlay {
                        VStack {
                            Text("Open with:")
                                .foregroundColor(.white)
                            
                            HStack {
                                Button {
                                    openAppleMaps()
                                } label: {
                                    Text("Apple Maps")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .padding(10)
                                        .background {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .cornerRadius(8)
                                        }
                                }
                                
                                Button {
                                    openGoogleMaps()
                                } label: {
                                    Text("Google Maps")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .padding(10)
                                        .background {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .cornerRadius(8)
                                        }
                                }
                            }
                        }
                    }
                
            }
            .foregroundColor(.softBlue)
            .ignoresSafeArea()
            
        }
        
    }
    
    func openAppleMaps() {
        guard let address = club.address else { return }
        
        let url = URL(string: "http://maps.apple.com/?q=\(address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")")!
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(URL(string: "http://maps.apple.com/?q=\(address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")")!, options: [:], completionHandler: nil)
        }
    }
    
    func openGoogleMaps() {
        guard let address = club.address else { return }
        
        let url = URL(string: "https://www.google.com/maps/search/?api=1&query=\(address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")")!
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(URL(string: "https://www.google.com/maps/search/?api=1&query=\(address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")")!, options: [:], completionHandler: nil)
        }
    }
}

#Preview {
    LocationView(club: .example)
}


struct MapView: UIViewRepresentable {
    
    var coordinate: CLLocationCoordinate2D
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        
        view.removeAnnotations(view.annotations)
        view.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        view.setRegion(region, animated: true)
    }
}
