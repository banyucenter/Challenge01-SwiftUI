//
//  ContentView.swift
//  Challenge01
//
//  Created by Ipung Dev Center on 13/08/20.
//  Copyright © 2020 Banyu Center. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var search : String = ""
    
    var body: some View {
        ZStack{
            Color("bgmaincolor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Header()
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        Search(search: $search)
                        TopTitle()
                        FoodContent()
                        SecondTitle()
                        CategoriesContent()
                        ThirdTitle()
                        SecondFoodContent()
                    }
                    
                }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Header: View {
    var body: some View {
        HStack {
            VStack(alignment:.leading, spacing: 3) {
                Text("Delivery to").font(.system(size: 20, weight: .bold, design: .rounded))
                HStack{
                    Image(systemName: "mappin.circle").foregroundColor(Color.secondary)
                    Text("Hanoi, Vietnam").font(.system(size: 18, weight: .light, design: .rounded)).foregroundColor(Color.secondary)
                }
            }.padding(.leading,30)
            Spacer()
            Image("profile")
                .resizable()
                .frame(width:40, height:40)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(Color.white, lineWidth: 4))
                .padding(.trailing,30)
            
        }.padding(.bottom, 10)
    }
}

struct Search: View {
    @Binding var search : String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.white)
                .frame(height:55)
            HStack {
                Button(action:{}){
                    Image(systemName: "magnifyingglass").frame(width: 55, height: 55).foregroundColor(Color.secondary)
                }
                
                TextField("Search for dish or restaurant", text: $search)
            }
        }.padding([.leading,.trailing], 30)
            .padding(.bottom, 10)
    }
}

struct TopTitle: View {
    var body: some View {
        HStack{
            Text("Popular Near You").font(.system(size: 18, weight: .bold, design: .rounded)).padding(.leading,30)
            Spacer()
            Text("View more").font(.system(size: 12, weight: .bold, design: .rounded)).foregroundColor(Color("iconcolor1")).padding(.trailing,30)
        }.padding(.bottom, 10)
    }
}

struct SecondTitle: View {
    var body: some View {
        HStack{
            Text("Explore Categoies").font(.system(size: 18, weight: .bold, design: .rounded)).padding(.leading,30)
            Spacer()
            Text("Show all").font(.system(size: 12, weight: .bold, design: .rounded)).foregroundColor(Color("iconcolor1")).padding(.trailing,30)
        }.padding(.bottom, 10)
    }
}

struct ThirdTitle: View {
    var body: some View {
        HStack{
            Text("Recommended").font(.system(size: 18, weight: .bold, design: .rounded)).padding(.leading,30)
            Spacer()
            Text("Show all").font(.system(size: 12, weight: .bold, design: .rounded)).foregroundColor(Color("iconcolor1")).padding(.trailing,30)
        }.padding(.bottom, 10)
    }
}

struct KontentFood: View {
    var image : String = ""
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
                Image(self.image).resizable().aspectRatio(contentMode: .fill)
                    .frame(width: 330, height: 200).clipped().cornerRadius(15)
                
                Text("Mc Donald's - Thai Ha").font(.system(size: 18, weight: .bold, design: .rounded))
                Text("Western cuisine, Fast Food, Burger").font(.system(size: 14, weight: .light, design: .rounded)).foregroundColor(Color.secondary)
                HStack{
                    HStack{
                        Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color("iconcolor4"))
                        Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color("iconcolor4"))
                        Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color("iconcolor4"))
                        Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color("iconcolor4"))
                    }
                    Spacer()
                    HStack{
                        HStack{
                            Image(systemName: "mappin.circle").resizable().frame(width: 15, height: 15).foregroundColor(Color("iconcolor1")).padding(.leading,5)
                            Text("254m").font(.system(size: 12, weight: .medium, design: .rounded)).foregroundColor(Color("iconcolor1")).padding(.trailing,5)
                        }
                        .padding(5).background(Color("tagcolor")).cornerRadius(10)
                        
                        HStack{
                            Image(systemName: "clock").resizable().frame(width: 15, height: 15).foregroundColor(Color("iconcolor1")).padding(.leading,5)
                            Text("27'").font(.system(size: 12, weight: .medium, design: .rounded)).foregroundColor(Color("iconcolor1")).padding(.trailing,5)
                        }
                        .padding(5).background(Color("tagcolor")).cornerRadius(10)
                    }
                }
                
            }
            .frame(width: 330)
        }
        .padding(15)
        .background(Color.white).cornerRadius(30)
        
        
        
    }
}

struct IconCategories: View {
    var color : String = ""
    var icon: String = ""
    var body: some View {
        Button(action: {}){
            VStack{
                Image(self.icon).resizable().frame(width: 60, height: 60)
                Text("Food").font(.system(size: 18, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                Text("2215 Places")
                    .font(.system(size: 14, weight: .light, design: .rounded))
            }.padding([.leading,.trailing],30)
                .padding([.top,.bottom])
                .background(Color(self.color))
                .foregroundColor(Color.white)
                .cornerRadius(15)
        }
    }
}

struct FoodContent: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:20){
                KontentFood(image: "food1")
                KontentFood(image: "food2")
                KontentFood(image: "food3")
                KontentFood(image: "food4")
            }.padding([.leading,.trailing], 30)
        }.padding(.bottom,25)
    }
}

struct CategoriesContent: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:20){
                IconCategories(color: "iconcolor1", icon: "breakfast")
                IconCategories(color: "iconcolor2", icon: "burger")
                IconCategories(color: "iconcolor3", icon: "donut")
                IconCategories(color: "iconcolor4", icon: "tea-cup")
                IconCategories(color: "iconcolor1", icon: "onigiri")
            }.padding([.leading,.trailing], 30)
            
        }
    }
}

struct FoodContentSecond: View {
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
                Image("food3").resizable().aspectRatio(contentMode: .fill).frame(width: 200,height:100 ).clipped().cornerRadius(15)
                Text("Mc Donald's").font(.system(size: 18, weight: .bold, design: .rounded))
                Text("Western cuisine, Fast Food, Burger").font(.system(size: 14, weight: .light, design: .rounded)).foregroundColor(Color.secondary).fixedSize(horizontal: false, vertical: true)
                VStack(alignment:.leading){
                    HStack{
                        Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color("iconcolor4"))
                        Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color("iconcolor4"))
                        Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color("iconcolor4"))
                        Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color("iconcolor4"))
                    }.padding(.bottom,20)
                    
                    HStack{
                        HStack{
                            Image(systemName: "mappin.circle").resizable().frame(width: 15, height: 15).foregroundColor(Color("iconcolor1")).padding(.leading,5)
                            Text("254m").font(.system(size: 12, weight: .medium, design: .rounded)).foregroundColor(Color("iconcolor1")).padding(.trailing,5)
                        }
                        .padding(5).background(Color("tagcolor")).cornerRadius(10)
                        
                        HStack{
                            Image(systemName: "clock").resizable().frame(width: 15, height: 15).foregroundColor(Color("iconcolor1")).padding(.leading,5)
                            Text("27'").font(.system(size: 12, weight: .medium, design: .rounded)).foregroundColor(Color("iconcolor1")).padding(.trailing,5)
                        }
                        .padding(5).background(Color("tagcolor")).cornerRadius(10)
                        Spacer()
                    }
                    
                    
                }
            }.frame(width: 200)
        }.padding(15)
            .background(Color.white).cornerRadius(30)
    }
}

struct SecondFoodContent: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:20){
                FoodContentSecond()
                FoodContentSecond()
                FoodContentSecond()
            }.padding([.leading,.trailing], 30)
        }
    }
}
