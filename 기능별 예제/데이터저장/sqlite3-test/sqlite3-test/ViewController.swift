//
//  ViewController.swift
//  sqlite3-test
//
//  Created by Yongwan on 24/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var dbPath = self.getDbPath()
        self.dbExecute(dbPath: dbPath)
        
        
    }
    
    func getDbPath() -> String{
        var fileMgr = FileManager()
        var docPathUrl = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first!
        var dbPath = docPathUrl.appendingPathComponent("db.sqlite").path
        
        if fileMgr.fileExists(atPath: dbPath) == false{
            let dbSource = Bundle.main.path(forResource: "db", ofType: "sqlite")
            try! fileMgr.copyItem(atPath: dbSource!, toPath: dbPath)
        }
        
        return dbPath
    }
    
    func dbExecute(dbPath: String){
        var db: OpaquePointer? = nil
        guard sqlite3_open(dbPath, &db) == SQLITE_OK else {
            print("sqlite fail")
            return
        }
        
        //여기부터 종료된다면 무조건 아래 defer을 시행 - > sqlite3를 close한다
        defer{
            print("Close Database Connection")
            sqlite3_close(db)
        }
        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)"
        var stmt: OpaquePointer? = nil
        guard sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK else{
            print("prepare failed")
            return
        }
        defer{
            print("Finalize Statement")
            sqlite3_finalize(stmt)
        }
        if sqlite3_step(stmt) == SQLITE_DONE{
            print("create table success!")
        }
    }
    
    
}

