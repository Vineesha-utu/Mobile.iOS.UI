//
//  UTUActionSheetVC.swift
//  UTUTaxFree
//
//  Created by Lakshmana Swamy on 11/18/19.
//  Copyright © 2019 utu. All rights reserved.
//

import UIKit
public protocol PickerSelectionDelegate {
    func getPickerValue(title:String,index:Int)
}
public class UTUActionSheetVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    public var delegateObj : PickerSelectionDelegate!
    public var items : Array<Dictionary<String,String>>!
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
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
        let dict = items[0]
        delegateObj!.getPickerValue(title: "\(dict["title"] ?? "")", index: 0)
        self.dismiss(animated: true, completion: nil)
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items == nil {
            return 0
        }
        return items.count
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "CellId")
        cell.textLabel?.font = UIFont(name: UTUFontNames.NotoSansRegular , size: 16)
        let dict = items[indexPath.row]
        cell.textLabel?.text = dict["title"] ?? ""
        cell.imageView?.image = UIImage(named: dict["image"] ?? "")
        return cell
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = items[indexPath.row]
        self.dismiss(animated: true, completion: {
            self.delegateObj!.getPickerValue(title:"\(dict["title"] ?? "")", index: indexPath.row)
        })
    }
}
