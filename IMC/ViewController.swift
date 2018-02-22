//
//  ViewController.swift
//  IMC
//
//  Created by Robson Adorno on 21/02/2018.
//  Copyright © 2018 Robson Adorno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var lbResult: UILabel!
    
    @IBOutlet weak var viViewMaster: UIView!
    var IMC:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calcular(_ sender: UIButton) {
     
        if let altura = Double(tfHeight.text!), let peso = Double(tfWeight.text!){
            IMC = peso/(altura*altura)
            showResults()
            
        }else{
            showToast(message: "Erro ao processar o conteudo")
        }
        
    }
        func showResults(){
            var result:String = ""
            var image:String = ""
            
            switch IMC {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
            }
            lbResult.text = result
            ivResult.image = UIImage(named:image)
            viViewMaster.isHidden = false
            view.endEditing(true)
        }
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 40.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 9.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    } }


