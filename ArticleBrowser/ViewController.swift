//
//  ViewController.swift
//  ArticleBrowser
//
//  Created by Nick Martin on 12/18/17.
//  Copyright © 2017 MonkeyMan Technology. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func leftMenuButtonTap(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer?.toggle(.left, animated: true, completion: nil)
    }
}

