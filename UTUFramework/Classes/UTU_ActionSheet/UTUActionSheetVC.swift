//
//  UTUActionSheetVC.swift
//  UTUTaxFree
//
//  Created by Lakshmana Swamy on 11/18/19.
//  Copyright © 2019 utu. All rights reserved.
//

import UIKit
public protocol PickerSelectionDelegate {
    func getPickerValue(index:Int)
}
public class UTUActionSheetVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    public var delegateObj : PickerSelectionDelegate!

    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

//              self.navigationItem.titleView = customView
//              self.title = "Edit profile photo"
        
//        self.navigationItem.title = "Edit profile photo"
//        self.navigationController?.navigationBar.shadowImage = UIImage()
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target:self, action: #selector(cancelAction))
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target:self, action: #selector(doneAction))

        // Do any additional setup after loading the view.
    }
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.layer.cornerRadius = 10.0//floatValue;
        self.view.clipsToBounds = true
        self.view.layer.masksToBounds = true
    }
    @objc func cancelAction(){
        self.dismiss(animated: true, completion: nil)
    }
    @objc func doneAction(){
        delegateObj!.getPickerValue(index: 0)
        self.dismiss(animated: true, completion: nil)
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "CellId")
        cell.textLabel?.font = UIFont(name: UTUFontNames.NotoSansRegular , size: 16)
        if indexPath.row == 0 {
            cell.textLabel?.text = "Take photo"
            cell.imageView?.image = UIImage(named: "photoCamera24Px")
        }else{
            cell.textLabel?.text = "Choose existing"
            cell.imageView?.image = UIImage(named: "photoLibrary24Px")

        }
        return cell
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegateObj!.getPickerValue(index: indexPath.row)
    }
}
