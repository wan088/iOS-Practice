class DepartmentDAO{
    typealias DepartRecord = (Int, String, String)
    
    init() {
        self.fmdb.open()
    }
    deinit {
        self.fmdb.close()
    }
    

    //SQLite 연결 및 초기화
    lazy var fmdb: FMDatabase = {
        
        var fileMgr = FileManager.default
        var docuPathUrl = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first!
        var dbPath = docuPathUrl.appendingPathComponent("hr.sqlite").path
        
        if fileMgr.fileExists(atPath: dbPath) == false{
            var templit = Bundle.main.path(forResource: "hr", ofType: "sqlite")
            try! fileMgr.copyItem(atPath: templit!, toPath: dbPath)
        }
        
        return FMDatabase(path: dbPath)
    }()
    
    //부서목록 읽기
    func find() -> [DepartRecord]{
        var dr = [DepartRecord]()
        
        //sql문 생성
        var sql = """
        SELECT depart_cd, depart_title, depart_addr
        FROM department
        ORDER BY depart_cd ASC
        """
        
        //fmdb 객체를 통해서 result set을 가져온다
        do{
            var rs = try fmdb.executeQuery(sql, values: nil)
            while(rs.next()){
                var depart_cd = Int(rs.int(forColumn: "depart_cd"))
                var depart_title = rs.string(forColumn: "depart_title")!
                var depart_addr = rs.string(forColumn: "depart_addr")!
                
                dr.append((depart_cd, depart_title, depart_addr))
            }
            
        }catch let error as NSError{
            print("failed : \(error.localizedDescription)")
        }
        
        //각각의 result를 dr에 넣는다.
        
        return dr
    }
    
    //단일 부서정보 읽기
    func get(departCd: Int) -> DepartRecord?{
        //sql문 생성
        var sql = """
        SELECT depart_cd, depart_title, depart_addr
        FROM department
        WHERE depart_cd = ?
        """
        //fmdb 객체를 통해 rs 받아오기
        
            var rs = fmdb.executeQuery(sql, withArgumentsIn: [departCd])
            if let _rs = rs{
                _rs.next()
                var depart_cd = Int(_rs.int(forColumn: "depart_cd"))
                var depart_title = _rs.string(forColumn: "depart_title")!
                var depart_addr = _rs.string(forColumn: "depart_addr")!
                
                return (depart_cd, depart_title, depart_addr)
            }else{
                return nil
            }
    }
    
    //부서 정보 추가
    func create(title: String, address: String) -> Bool{
        //sql문 추가
        var sql = """
        INSERT into department (depart_title, depart_addr)
        VALUES (?, ?)
        """
        
        //fmdb 객체를 통해 update
        do{
            try self.fmdb.executeUpdate(sql, values: [title, address])
            return true
        }catch let error as NSError{
            print("CREATE ERROR : \(error.localizedDescription)")
            return false
        }
        
    }
    
    func remove(departCd: Int) -> Bool{
        //sql문 추가
        var sql = """
        REMOVE FROM department
        WHERE depart_cd = ?
        """
        //fmdb를 통해 excute
        do{
            try self.fmdb.executeUpdate(sql, values: [departCd])
            return true
        }catch let error as NSError{
            print("DELETE ERROR : \(error.localizedDescription)")
            return false
        }
        
    }

    
}
