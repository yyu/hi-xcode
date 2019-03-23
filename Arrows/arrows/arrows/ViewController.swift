//
//  ViewController.swift
//  arrows
//
//  Created by Yu, Yuan (forresty) on 3/22/19.
//  Copyright © 2019 Yu, Yuan (forresty). All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet var upLabel: UILabel!
    @IBOutlet var downLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!

    func doRequest(url: String) {
        let apiURL = URL(string: url)!
        let task = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            if error == nil {
                DispatchQueue.main.async {
                    self.infoLabel.text = "✓"
                }
            }
        }
        task.resume()
    }

    func doRequestThenStop(angle: Int) {
        let apiURL = URL(string: "http://192.168.4.1:8888/angle\(angle)degree")!
        let task = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            if error == nil {
                sleep(2) // todo: use timer
                self.deskStop()
            }
        }
        task.resume()
    }

    func deskStop() {
        doRequest(url: "http://192.168.4.1:8888/angle60degree")
    }

    @IBAction func deskUp(_ sender: UIButton) {
        upLabel.text = "↑"
        downLabel.text = ""
        doRequestThenStop(angle: 90)
    }

    @IBAction func deskDown(_ sender: UIButton) {
        upLabel.text = ""
        downLabel.text = "↓"
        doRequestThenStop(angle: 10)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

