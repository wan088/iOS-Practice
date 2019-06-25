class EmployeeDAO{
    
    init() {
        self.fmdb.open()
    }
    deinit {
        self.fmdb.close()
    }
    
    lazy var fmdb: FMDatabase = {
        let fileMgr = FileManager.default
        let docuPathUrl = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first!
        let dbPath = docuPathUrl.appendingPathComponent("hr.sqlite").path
        
        if fileMgr.fileExists(atPath: dbPath) == false {
            var a = Bundle.main.path(forResource: "hr", ofType: "sqlite")!
            try! fileMgr.copyItem(atPath: a, toPath: dbPath)
        }
        return FMDatabase(path: dbPath)
    }()
    
    enum EmpStateType: Int{
        case ING = 0
        case STOP = 1
        case OUT = 2
        
        func desc() -> String{
            switch self {
            case .ING:
                return "재직중"
            case .STOP:
                return "휴직"
            case .OUT:
                return "퇴사"
            }
        }
    }
    struct EmployeeVO{
        var empCd = 0
        var empName = ""
        var joinDate = ""
        var stateCd = EmpStateType.ING
        var departCd = 0
        var departTitle = ""
    }
    
    func find() -> [EmployeeVO] {
        var returnValue = [EmployeeVO]()
        let sql = """
            SELECT emp_cd, emp_name, join_date, state_cd, department.depart_title
            FROM employee
            JOIN department On department.depart_cd = employee.depart_cd
            ORDER BY employee.depart_cd ASC
        """
        
        do{
            let rs = try self.fmdb.executeQuery(sql, values: nil)
            while(rs.next()){
                var Emp = EmployeeVO()
                Emp.empCd = Int(rs.int(forColumn: "emp_cd"))
                Emp.empName = rs.string(forColumn: "emp_name")!
                Emp.joinDate = rs.string(forColumn: "join_date")!
                Emp.stateCd = EmpStateType(rawValue: Int(rs.int(forColumn: "state_cd")))!
                Emp.departTitle = rs.string(forColumn: "department.depart_title")!
                returnValue.append(Emp)
            }
        }catch let error as NSError{
            print("Find Error : \(error.localizedDescription)")
        }
        return returnValue
    }
    func get(empCd: Int) -> EmployeeVO?{
        let sql = """
            SELECT emp_cd, emp_name, join_date, state_cd, department.depart_title
            FROM employee
            JOIN employee.depart_cd = department.depart_cd
            WHERE emp_cd = ?
        """
        
        
            var rs = try self.fmdb.executeQuery(sql, withArgumentsIn: [empCd])
            if let _rs = rs{
                var Emp = EmployeeVO()
                Emp.empCd = Int(_rs.int(forColumn: "emp_cd"))
                Emp.empName = _rs.string(forColumn: "emp_name")!
                Emp.joinDate = _rs.string(forColumn: "join_date")!
                Emp.stateCd = EmpStateType(rawValue: Int(_rs.int(forColumn: "state_cd")))!
                Emp.departTitle = _rs.string(forColumn: "department.depart_title")!
                return Emp
            }else{
                return nil
            }
    }
    func create(param: EmployeeVO) -> Bool{
        
        let sql = """
            INSERT INTO employee (emp_name, join_date, state_cd, depart_cd)
            VALUES (?, ?, ?, ?)
        """
        
        do{
            try self.fmdb.executeUpdate(sql, values: [param.empName, param.joinDate, param.stateCd.rawValue, param.departCd])
            return true
            
        }catch let error as NSError{
            print("failed : \(error.localizedDescription)")
            return false
        }
    }
    func remove(empCd: Int) -> Bool{
        let sql = "REMOVE FROM employee WHERE emp_cd = ?"
        do{
            try self.fmdb.executeUpdate(sql, values: [empCd])
            return true
        }catch let error as NSError{
            print("failed : \(error.localizedDescription)")
            return false
        }
    }
}
