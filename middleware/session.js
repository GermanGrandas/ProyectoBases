const mysql = require("mysql")
const con =mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "usuarioutp",
    database :"andapez"
})

con.connect(function(err) {
    if (err) throw err;});

module.exports = function(req,res,next) {
    if(!req.session.userID){
        res.redirect("/login");
    }else{
        let sql = "SELECT * FROM usuarios WHERE DNI=?";
       con.query(sql,[req.session.userID],function(err,result){
                if(err) throw err;
                if(result.length == 0){
                    res.redirect("/login");
                }else{
                    res.locals = {user : result};
                    next();
                }
        });
    }
};