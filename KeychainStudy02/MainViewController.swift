//
//  MainViewController.swift
//  KeychainStudy02
//
//  Created by Dio Brand on 2022/7/28.
//

import UIKit

struct Credentials {
    var username: String
    var password: String
}

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}

class MainViewController: UIViewController {
    
    let server = "jobs8.cn"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Keychain"
        
    }
    
    @IBAction func insert(_ sender: UIButton) {
        let credentials : Credentials = Credentials(username: "Dio", password: "aaaaa")

        let account = credentials.username
        let password = credentials.password.data(using: String.Encoding.utf8)!
        let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                    kSecAttrAccount as String: account,
                                    kSecAttrServer as String: server,
                                    kSecValueData as String: password]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        if status == errSecSuccess {
            print("add success!")
        }else{
            print("add error. status = \(status)")
        }
    }
    
    @IBAction func updateItem(_ sender: UIButton) {
        let credentials : Credentials = Credentials(username: "Dio", password: "bbbbb")
        let account = credentials.username
        let password = credentials.password.data(using: String.Encoding.utf8)!
        let attributes: [String: Any] = [kSecAttrAccount as String: account,
                                         kSecValueData as String: password]
        
        let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                    kSecAttrServer as String: server]
        
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        if status == errSecSuccess {
            print("update success!")
        }else{
            print("update error. status = \(status)")
        }
    }

    @IBAction func delteItem(_ sender: UIButton) {
        let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword]
        let status = SecItemDelete(query as CFDictionary)
        if status == errSecSuccess {
            print("删除成功")
        }else{
            print("delete error. status = \(status)")
        }
    }
    
    
    @IBAction func queryItem(_ sender: UIButton) {
        let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                    kSecMatchLimit as String: kSecMatchLimitAll,
                                    kSecReturnAttributes as String: true,
                                    kSecReturnData as String: true]
        var result: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        if status != errSecItemNotFound {
            print("没有要查询的数据 status = \(status)")
        }else {
            print("other error status = \(status)")
        }
        if let res = result as? Array<Any> {
            print(res)
//            let data = NSKeyedArchiver.archivedData(withRootObject: result)
//            print(data)
        }
    }
    
}
