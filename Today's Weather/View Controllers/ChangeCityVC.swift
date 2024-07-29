//
//  ChangeCityVC.swift
//  Today's Weather
//
//  Created by Khalid Gad on 03/05/2024.
//

import UIKit



class ChangeCityVC: UIViewController {

    @IBOutlet weak var subVIewChange: ThemeView!
    @IBOutlet weak var aCityLabel: ThemeLabel!
    @IBOutlet weak var chooseLabel: ThemeLabel!
    @IBOutlet weak var citiesPickerView: UIPickerView!
    @IBOutlet weak var SelectBTN: UIButton!
    
    @IBOutlet weak var arrowIMG: UIImageView!
    
    var citiesArr = [
        City(name: "Cairo", id: "360631"),
        City(name: "Giza", id: "360995"),
        City(name: "Alexandria", id: "361058"),
        City(name: "Aswan", id: "359792"),
        City(name: "Assiut", id: "359783"),
        City(name: "Beheira", id: "361370"),
        City(name: "Beni Suef", id: "359173"),
        City(name: "Dakahlia", id: "361849"),
        City(name: "Damietta", id: "358044"),
        City(name: "Fayoum", id: "361320"),
        City(name: "Gharbia", id: "361294"),
        City(name: "Ismailia", id: "361056"),
        City(name: "Kafr el-Sheikh", id: "354502"),
        City(name: "Matrouh", id: "352603"),
        City(name: "Minya", id: "360631"),
        City(name: "Menofia", id: "360689"),
        City(name: "North Sinai", id: "355182"),
        City(name: "Port Said", id: "358619"),
        City(name: "Qualyubia", id: "350789"),
        City(name: "Qena", id: "350546"),
        City(name: "Red Sea", id: "361468"),
        City(name: "Al-Sharqia", id: "360016"),
        City(name: "South Sinai", id: "349401"),
        City(name: "Suez", id: "359796"),
        City(name: "Luxor", id: "360502"),
        City(name: "Sohag", id: "347796"),
    ]
    
    
    var selectedCity:City?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SelectBTN.layer.cornerRadius =  22
        SelectBTN.layer.masksToBounds = true
        
        citiesPickerView.delegate = self
        citiesPickerView.dataSource = self
        
        chooseLabel.text = NSLocalizedString("choose", comment: "choose Label")
        aCityLabel.text = NSLocalizedString("aCity", comment: "a City Label")

        SelectBTN.setTitle(NSLocalizedString("select", comment: "Change city"), for: .normal)
        
       // let flippedImage = UIImage(named: "arrowLeft")?.withHorizontallyFlippedOrientation()
        
      //  arrowIMG.image = flippedImage
    }
    
    
    @IBAction func selectButton(_ sender: Any) {
        
        if let city = selectedCity {
            NotificationCenter.default.post(name: NSNotification.Name("cityValueChange"), object: nil, userInfo: ["city":city])
            self.dismiss(animated: true)
        }

    }

}

extension ChangeCityVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        citiesArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return NSLocalizedString(citiesArr[row].name, comment: "Temp Label")
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = citiesArr[row]
    }
}
