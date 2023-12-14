//
//  TimerView.swift
//  CryptoNight
//
//  Created by Ciko Edo Febrian on 01/11/23.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.modelContext) var context
    @EnvironmentObject var homeViewModel: HomeViewModel
    @State var isAgeKeyNotExist: Bool = false
    
    var body: some View {
        GeometryReader { screen in
       
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                LinearGradient(colors: [Color.clear, homeViewModel.isStarted ? Color.blue : Color.red], startPoint: UnitPoint.top, endPoint: UnitPoint.bottom)
                    .ignoresSafeArea()
                    .opacity(homeViewModel.shockBackground ? 1 : 0)
                
                
                
                Circle()
                    .stroke(.white, style: StrokeStyle(lineWidth: 10))
                    .opacity(0.2)
                    .frame(width: screen.size.width * 0.7, height: screen.size.width * 0.7)
                
                Circle()
                    .trim(from: 0, to:  (K.beepStagesList[homeViewModel.currentStage].speed.getEstimatedTime() - homeViewModel.secondsLeft) / K.beepStagesList[homeViewModel.currentStage].speed.getEstimatedTime() )
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .shadow(color: .white, radius: homeViewModel.circleShadowRadius ? 10 : 0)
                    .frame(width: screen.size.width * 0.7, height: screen.size.width * 0.7)
                    .rotationEffect(.degrees(-90))
                
                Circle()
                    .trim(from: 0, to: homeViewModel.isStarted ?  Double(homeViewModel.currentStageShuttles) / Double(K.beepStagesList[homeViewModel.currentStage].shuttles) : 0)
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .frame(width: screen.size.width * 0.58, height: screen.size.width * 0.58)
                    .rotationEffect(.degrees(-90))
                
                
                if(homeViewModel.isStarted ){
                    HStack(alignment: .bottom) {
                        Text(String(format: "%.1f", homeViewModel.secondsLeft))
                            .animation(.none)
                            .padding(.vertical, -8)
                            .font(.system(size: 60))
                            .bold()
                        Text("s")
                            .bold()
                            .font(.title)
                    }
                    .foregroundStyle(.white)
                }
                else {
                    if (homeViewModel.countdown != nil){
                        Text("\(homeViewModel.countdown!)")
                            .foregroundStyle(.white)
                            .font(.system(size: 60))
                            .bold()
                            .shadow(color: .white, radius: homeViewModel.circleShadowRadius ? 10 : 0)
                    } else {
                        Image(systemName: "play.fill")
                            .font(.system(size: 120))
                            .foregroundStyle(.white)
                            .shadow(color: .white, radius: homeViewModel.circleShadowRadius ? 10 : 0)
                            .onTapGesture {
                                homeViewModel.startBeepTest()
                            }
                    }
                }
                
                
                VStack {
                    HStack {
                        NavigationLink {
                            InfoView()
                        } label: {
                            Image(systemName: "info.circle")
                                .foregroundStyle(.white)
                                .font(.system(size: 32))
                        }
                        .disabled(homeViewModel.isStarted)
                        Spacer()
                        
                            .foregroundStyle(.white)
                        Spacer()
                        NavigationLink {
                            HistoryView(modelContext: context)
                        } label: {
                            Image(systemName: "clock")
                            
                                .foregroundStyle(.white)
                                .font(.system(size: 32))
                        }
                        .disabled(homeViewModel.isStarted)
                    }
                    .padding(.horizontal, 36)
                    .padding(.vertical, 12)
                    
                    if (homeViewModel.isStarted){
                        HStack {
                            Spacer()
                            VStack {
                                Text("Stages")
                                    .padding(.bottom, 8)
                                Text("\(homeViewModel.currentStage + 1)")
                                    .bold()
                                    .font(.title2)
                                + Text(" / 21")
                                
                
                            }
                            .foregroundStyle(.white)
                            Spacer()
                            VStack {
                                Text("Shuttles")
                                    .foregroundStyle(.white)
                                    .padding(.bottom, 8)
                      
                                Text("\(homeViewModel.currentStageShuttles)")
                                    .bold()
                                    .font(.title2) +
                                Text(" / \(K.beepStagesList[homeViewModel.currentStage].shuttles)")
                          
                            }
                            .foregroundStyle(.white)
                            Spacer()
                            VStack {
                                Text("Distance")
                                    .foregroundStyle(.white)
                                    .padding(.bottom, 8)
                                Text("\(homeViewModel.totalDistance)")
                                    .bold()
                                    .font(.title2) + 
                                Text(" m")
                            }
                            .foregroundStyle(.white)
                            Spacer()
                        }
                    } else {
                        if (homeViewModel.countdown == nil) {
                            VStack(alignment: .leading) {
                                Text("Welcome to ") + Text("btest,").bold()
                                
                                Text("Test your endurance now!")
                                
                            }
                            .fontWeight(.regular)
                            .font(.title)
                            .foregroundStyle(.white)
                        }
                    }
                    
                    
                    
                    Spacer()
                    if (homeViewModel.countdown == nil) {
                        HStack {
                            Text(homeViewModel.isStarted ?  "Cancel" : "Start")
                            .foregroundStyle(.white)
                            .font(.title2)
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .bold()
                            .background(RoundedRectangle(cornerRadius: 20).foregroundStyle(homeViewModel.isStarted ? .red : .blue)
                                .opacity(0.5))
                            .onTapGesture {
                                if (!homeViewModel.isStarted) {
                                    homeViewModel.startBeepTest()
                                } else {
                                    homeViewModel.cancelBeepTest()
                                }
                            }
                            
                        }
                        .padding(.horizontal, 36)
                        .padding(.bottom, 16)
                    }
                }
                .onAppear(perform: {
                    if !homeViewModel.shockBackground {
                        DispatchQueue.main.async {
                            self.homeViewModel.addCircleAnimation()
                            self.homeViewModel.addShockBackground()
                        }
                    }
                })
                .sheet(isPresented: $homeViewModel.showSheet) {
                    print("is dismissed")
                } content: {
                    ResultView(beepResult: $homeViewModel.beepResult)
                }

            }
            .navigationDestination(isPresented: $isAgeKeyNotExist) {
                SelectAgeView()
            }
           
        }
        .onAppear(
            perform: {
                isAgeKeyNotExist = !UserDefaults.standard.isKeyExist(key: "user_age")
            })
    }
}

#Preview {
    NavigationStack {
        TimerView()
    }
    .toolbar(.hidden)
    
}
