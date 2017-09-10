//
//  ViewController.swift
//  TicTacToe
//
//  Created by Betalantz on 9/7/17.
//  Copyright © 2017 Betalantz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var winnerLabel: UILabel!
    var turnNumber = 0
    var player = 0
    var winner = 0
    var gameboard = [
        [0,0,0],
        [0,0,0],
        [0,0,0]
    ]
    
    @IBOutlet var gameButtonCollection: [UIButton]!
    
    @IBAction func resetPressed(_ sender: UIButton) {
        print("Reset")
        turnNumber = 0
        player = 0
        winner = 0
        gameboard = [
            [0,0,0],
            [0,0,0],
            [0,0,0]
        ]
        for i in 0...8 {
            gameButtonCollection[i].backgroundColor = UIColor.lightGray
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameButtonCollection.sort { $0.tag < $1.tag }
    }
    @IBAction func gameButtonPressed(_ sender: UIButton) {
        print("Button \(sender.tag) pressed")
        
        turnNumber += 1
        if turnNumber % 2 == 0 {
            player = 1
        } else {
            player = 2
        }
        let marker = sender.tag
        let posY = marker / 3
        let posX = marker % 3
        if gameboard[posY][posX] == 0 {
            gameboard[posY][posX] = player
            print(gameboard)
            print(player)
            changeColor()
        }
//        switch marker {
//        case 0:
//            if gameboard[0][0] == 0 {
//            gameboard[0][0] = player
//            changeColor()
//            }
//        case 1:
//            if gameboard[0][1] == 0 {
//                gameboard[0][1] = player
//                changeColor()
//            }
//        case 2:
//            if gameboard[0][2] == 0 {
//                gameboard[0][2] = player
//                changeColor()
//            }
//        case 3:
//            if gameboard[1][0] == 0 {
//                gameboard[1][0] = player
//                changeColor()
//            }
//        case 4:
//            if gameboard[1][1] == 0 {
//                gameboard[1][1] = player
//                changeColor()
//            }
//        case 5:
//            if gameboard[1][2] == 0 {
//                gameboard[1][2] = player
//                changeColor()
//            }
//        case 6:
//            if gameboard[2][0] == 0 {
//                gameboard[2][0] = player
//                changeColor()
//            }
//        case 7:
//            if gameboard[2][1] == 0 {
//                gameboard[2][1] = player
//                changeColor()
//            }
//        case 8:
//            if gameboard[2][2] == 0 {
//                gameboard[2][2] = player
//                changeColor()
//            }
//        default:
//            gameboard[0][0] = player
//        }
        
        print(gameboard)
        print(player)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func changeColor() {
 
        
        for y in 0..<gameboard.count {
            var x = 0
            for val in gameboard[y] {
//                color = val == 1 ? UIColor.green : UIColor.magenta
//                print ("Apparently our value is \(val)")
                if y == 0 && val == 1 {
                    gameButtonCollection[x].backgroundColor = UIColor.green
                } else if y == 1 && val == 1 {
                    self.gameButtonCollection[x+3].backgroundColor = UIColor.green
                } else if y == 2 && val == 1 {
                    self.gameButtonCollection[x+6].backgroundColor = UIColor.green
                }
                if y == 0 && val == 2 {
                    gameButtonCollection[x].backgroundColor = UIColor.magenta
                } else if y == 1 && val == 2 {
                    self.gameButtonCollection[x+3].backgroundColor = UIColor.magenta
                } else if y == 2 && val == 2 {
                    self.gameButtonCollection[x+6].backgroundColor = UIColor.magenta
                }
                print ("At pos \(x),\(y) with val of \(val)")
                x += 1
            }
        }
    }

}

