//
//  ChooseThemeViewController.swift
//  ConcentrationLSG
//
//  Created by Mac de Pol on 13/03/2019.
//  Copyright © 2019 CFGS La Salle Gracia. All rights reserved.
//

import UIKit

class ChooseThemeViewController: UIViewController, UISplitViewControllerDelegate{

    
    let themes=[
        "halloween":Concentration(numberOfPairsOfCards: 8, theme:"halloween"),
        "flags": Concentration(numberOfPairsOfCards: 8, theme:"flags"),
        "animals":Concentration(numberOfPairsOfCards: 8, theme:"animals")]

    override func awakeFromNib() {
        super.awakeFromNib()
        self.splitViewController?.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func splitViewController (
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool{
        if let navigationController = primaryViewController as? UINavigationController{
            if navigationController.visibleViewController != nil {
                return true
            }
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bvc = segue.destination as? BoardViewController{
            if let segueIdentifier = segue.identifier{
                if let themeSelected = themes[segueIdentifier]{
                    bvc.concentration = themeSelected
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    }
}
