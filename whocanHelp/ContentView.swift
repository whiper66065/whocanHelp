//
//  ContentView.swift
//  whocanHelp
//
//  Created by 潘昱任 on 2020/4/20.
//  Copyright © 2020 ntouyujen. All rights reserved.
//

import SwiftUI

struct hou {
    var img: String
    var name: String
    var speak: String
}

struct ContentView: View {
    
    let roles: [hou] = [
        hou(img: "James1", name: "鬍子", speak: "當然是我"),
        hou(img: "Russell1", name: "神龜", speak: "是我才對"),
        hou(img: "PJ1", name: "塔克", speak: "我才是啦"),
        hou(img: "Robert1", name: "國旻黨", speak: "這還要問"),
        hou(img: "Danuel1", name: "豪斯", speak: "都不要吵")
    ]
    
    @State private var pickhou = 0
    
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                Text("WHO can help?")
                    .foregroundColor(.blue)
                    .offset(x:-60, y:-300)
                    .font(.largeTitle)
                Group {
                    Path(roundedRect: CGRect(x:0,y:90,width:200, height:100),cornerRadius: 20)
                        .foregroundColor(.white)
                        .rotation3DEffect(Angle(degrees: 40), axis: (x: 200.0, y: 0.0, z: 110.0))
                        .offset(x:-50)
                    Path{ (path) in
                        path.move(to: CGPoint(x:90,y:180))
                        path.addLine(to: CGPoint(x:90,y:224))
                    }
                    .stroke(Color(.black))
                }
                Text("火箭隊守護神")
                .foregroundColor(.blue)
                .font(.largeTitle)
                    .offset(y:-30)
            }
            ZStack{
                Rectangle()
                    .frame(height:400)
                    .offset(y:209)
                    .foregroundColor(.white)
                
                Group {
                    Path(roundedRect: CGRect(x:330,y:230,width:200, height:100),cornerRadius: 20)
                        .foregroundColor(.blue)
                        .rotationEffect(Angle(degrees: 90))
                        .rotation3DEffect(Angle(degrees: -50), axis: (x: 10.0, y: 80.0, z: 0.0))
                        .offset()
                    Path{ (path) in
                        path.move(to: CGPoint(x:290,y:740))
                        path.addLine(to: CGPoint(x:355,y:700))
                        }
                    .stroke(Color(.white))
                }
                
                Picker(selection: $pickhou, label: Text("")) {
                    ForEach(0 ..< roles.count) { i in
                        Text(self.roles[i].name).tag(i)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.gray)
                .border(Color.white)
                .cornerRadius(30)
                .shadow(radius: 30)
                .frame(width:300)
                .offset(y:50)
                
                Image("\(roles[pickhou].img)")
                    .resizable()
                    .scaledToFit()
                    .frame(width:200)
                    .offset(x:-50,y:230)
            
                Text("\(roles[pickhou].speak)")
                    .offset(x:55,y:100)
                    .font(.system(size: 38))
                    .foregroundColor(Color.red)
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
