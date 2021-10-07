//
//  LevelOneView.swift
//  Bob The Bouncing Ball (iOS)
//
//  Created by Jaden Sylvester on 10/4/21.
//

import SwiftUI

//
//  GameView.swift
//  Bob The Bouncing Ball (iOS)
//
//  Created by Jaden Sylvester on 9/29/21.

struct LevelOneView: View {
    @State var bobPosition = CGPoint(x: 50, y: 30)
    @State var dPadPosition = CGPoint(x: 725, y: 295)
    @State var doorPosition = CGPoint(x: 75, y: 235)
    @State var keyPosition = CGPoint(x: 385, y: 155)
    @State var timerDown = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    @State var timerLeft = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    @State var timerRight = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    @State var timerUp = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    @State private var isRunning: Bool = false
    static var numClicks = 0
    static func bumpCount() {
        LevelOneView.numClicks += 1
    }
    @ObservedObject var viewModel: GameMechanics
    @Binding var navigate: Screens
    
    var body: some View {
        ZStack {
            Door().position(doorPosition)
            Spikes()
            Walls()
            Key().position(keyPosition)
            Bob().position(bobPosition)
            dpad.font(.custom("String", size: 22)).position(dPadPosition).foregroundColor(.black)
            settingsButton.position(x: 775, y: 30)
        }.background(Color.blue).ignoresSafeArea()
            .onReceive(timerDown, perform: { _ in
                withAnimation {
                    if bobPosition.y < 360 {
                        bobPosition.y += 25
                    }
                }
            })
            .onReceive(timerRight, perform: { _ in
                withAnimation {
                    bobPosition.x += 25
                }
            })
            .onReceive(timerLeft, perform: { _ in
                withAnimation {
                    bobPosition.x -= 25
                }
            })
            .onReceive(timerUp, perform: { _ in
                withAnimation {
                    bobPosition.y -= 25
                }
            })
            .onAppear(perform: {
                timerDown.upstream.connect().cancel()
            })
            .onAppear(perform: {
                timerUp.upstream.connect().cancel()
            })
            .onAppear(perform: {
                timerRight.upstream.connect().cancel()
            })
            .onAppear(perform: {
                timerLeft.upstream.connect().cancel()
            })
            
    }
    
    var dpad: some View {
        VStack {
            upButton
            HStack {
                leftButton
                rightButton
            }
            downButton
        }
    }
    
    var rightButton: some View {
        Button(action: {
            if bobPosition.x < 800 {
                withAnimation {
                    startTimerRight()
                }
            }
            
            if bobPosition.x >= 800 {
                stopTimer()
            }
        }) {
            Image(systemName: "arrowshape.turn.up.right")
        }
    }

    var leftButton: some View {
        Button(action: {
            if bobPosition.x > 50 {
                withAnimation {
                    startTimerLeft()
                }
            }
        }) {
            Image(systemName: "arrowshape.turn.up.left")
        }
    }

    var upButton: some View {
        Button(action: {
            if bobPosition.y > 25 {
                withAnimation {
                    startTimerUp()
                }
            }
        }) {
            Image(systemName: "chevron.up.circle")
        }
    }
    
    var downButton: some View {
        Button(action: {
            if bobPosition.y < 360 {
                withAnimation {
                    moveDown()
                }
            }
        }) {
            Image(systemName: "chevron.down.circle")
        }
    }
    
    var settingsButton: some View {
        Image(systemName: "gearshape")
            .resizable()
            .scaledToFit()
            .frame(width: 35, height: 35)
            .foregroundColor(.black)
            .onTapGesture {
                withAnimation {
                    
                    navigate = .settings
                }
            }
    }
    
    func moveDown() {
        startTimerDown()
    }
    
    func stopTimer() {
        self.timerDown.upstream.connect().cancel()
        self.timerUp.upstream.connect().cancel()
        self.timerRight.upstream.connect().cancel()
        self.timerLeft.upstream.connect().cancel()
    }
    
    func startTimerRight() {
        self.timerRight = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
        self.timerUp.upstream.connect().cancel()
        self.timerLeft.upstream.connect().cancel()
        self.timerDown.upstream.connect().cancel()
    }
    
    func startTimerLeft() {
        self.timerLeft = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
        self.timerUp.upstream.connect().cancel()
        self.timerRight.upstream.connect().cancel()
        self.timerDown.upstream.connect().cancel()
    }
    
    func startTimerUp() {
        self.timerUp = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
        self.timerRight.upstream.connect().cancel()
        self.timerLeft.upstream.connect().cancel()
        self.timerDown.upstream.connect().cancel()
    }
    
    func startTimerDown() {
        self.timerDown = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
        self.timerUp.upstream.connect().cancel()
        self.timerLeft.upstream.connect().cancel()
        self.timerRight.upstream.connect().cancel()
    }
}
//struct LevelOneView_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = GameMechanics()
//        if #available(iOS 15.0, *) {
//            ContentView(viewModel: viewModel)
//                .previewInterfaceOrientation(.landscapeRight)
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//}
