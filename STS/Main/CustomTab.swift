//
//  CustomTab.swift
//  STS
//
//  Created by admin on 6/3/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "newspaper"
    case clubs = "gamecontroller"
    case qr = "qrcode.viewfinder"
    case service = "wrench.adjustable"
    case settings = "gearshape"
    
    var index: CGFloat {
        return CGFloat(Tab.allCases.firstIndex(of: self) ?? 0)
    }
    
    static var count: CGFloat {
        return CGFloat(Tab.allCases.count)
    }
}

struct CustomTabBar: View {
    
    @Binding var activeTab: Tab
    @State var text = "News"
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Image(systemName: tab.rawValue)
                        .resizable()
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .offset(y: offset(tab))
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)) {
                                activeTab = tab
                                switch tab {
                                case .home:
                                    text = "News"
                                case .clubs:
                                    text = "Clubs"
                                case .qr:
                                    text = "Loyalty"
                                case .service:
                                    text = "Service"
                                case .settings:
                                    text = "Settings"
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                }
            }
            .padding(.top, 12)
            .padding(.bottom, 20)
        }
       
        .padding(.bottom, safeArea.bottom == 0 ? 30 : safeArea.bottom)
        .background(content: {
            ZStack {
                TabBarTopCurve()
                    .stroke(Color.lightBlue, lineWidth: 0.5)
                    .blur(radius: 0.5)
                    .padding(.horizontal, -10)
                
                TabBarTopCurve()
                    .fill(Color.darkBlue)
            }
        })
        .overlay(content: {
            GeometryReader { proxy in
                let rect = proxy.frame(in: .global)
                let width = rect.width
                let maxedWidth = width * 5
                let height = rect.height
                
                Circle()
                    .fill(.clear)
                    .frame(width: maxedWidth, height: maxedWidth)
                    .background(alignment: .top) {
                        Rectangle()
                            .fill(.linearGradient(colors: [
                                Color.lightBlue.opacity(0.2),
                                Color.darkBlue,
                                Color.lightBlue,
                            ], startPoint: .top, endPoint: .bottom))
                            .frame(width: width, height: height)
                            .mask(alignment: .top) {
                                Circle()
                                    .frame(width: maxedWidth, height: maxedWidth, alignment: .top)
                            }
                    }
                    .overlay(content: {
                        Circle()
                            .stroke(Color.lightBlue, lineWidth: 0.2)
                            .blur(radius: 0.5)
                        
                    })
                    .frame(width: width)
                    .background(content: {
                        Rectangle()
                            .fill(.yellow)
                            .frame(width: 45, height: 4)
                            .offset(y: -1.5)
                            .offset(y: -maxedWidth / 2)
                            .rotationEffect(.init(degrees: calculateRotation(maxedWidth: maxedWidth / 2, actualWidth: width, true)))
                            .rotationEffect(.init(degrees: calculateRotation(maxedWidth: maxedWidth / 2, actualWidth: width)))
                    })
                    .offset(y: height / 2.1)
            }
            .overlay(alignment: .bottom) {
                Text(text)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .offset(y: safeArea.bottom == 0 ? -15 : -safeArea.bottom + 12)
            }
        })
        .preferredColorScheme(.dark)
    }
    
    func calculateRotation(maxedWidth y: CGFloat, actualWidth: CGFloat, _ isInitial: Bool = false) -> CGFloat {
        let tabWidth = actualWidth / Tab.count
        let firstTabPositionX: CGFloat = -(actualWidth - tabWidth) / 2
        let tan = y / firstTabPositionX
        let radians = atan(tan)
        let degree = radians * 180 / .pi
        
        if isInitial {
            return -(degree + 90)
        }
        
        let x = tabWidth * activeTab.index
        let tan_ = y / x
        let radians_ = atan(tan_)
        let degree_ = radians_ * 180 / .pi
        
        return -(degree_ - 90)
    }
    
    func offset(_ tab: Tab) -> CGFloat {
        let totalIndices = Tab.count
        let currentIndex = tab.index
        let progress = currentIndex / totalIndices
        
        return progress < 0.5 ? (currentIndex * -10) : ((totalIndices - currentIndex - 1) * -10)
    }
}


struct TabBarTopCurve: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width = rect.width
            let height = rect.height
            let midWidth = width / 2
            
            path.move(to: .init(x: 0, y: 5))
            path.addCurve(to: .init(x: midWidth, y: -20), control1: .init(x: midWidth / 2, y: -20), control2: .init(x: midWidth, y: -20))
            path.addCurve(to: .init(x: width, y: 5), control1: .init(x: (midWidth + (midWidth / 2)), y: -20), control2: .init(x: width, y: 5))
            
            path.addLine(to: .init(x: width, y: height))
            path.addLine(to: .init(x: 0, y: height))
            path.closeSubpath()
        }
    }
}



#Preview {
    TabBarView()
}
