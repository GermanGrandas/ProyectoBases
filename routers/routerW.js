const express = require("express");

const router = express.Router();
const mysql = require("mysql")
const con =mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database :"andapez"
})

con.connect(function(err){
    if (err) throw err;});


router.get("/",function(req,res){
    var sql = "SELECT * FROM tareas";
    con.query(sql,function(err,result){
        if(err) throw err;
        res.render("worker/home",{d:result});
    });
});
router.get("/logout",function(req,res) {
        //req.session.destroy(function(err) {
    req.session = null;
      // cannot access session here
    res.redirect("/login");
        
});
router.get("/new",function(req,res){
    var sql="SELECT * FROM tareas";
    con.query(sql,function(err,result){
        if(err) throw err;
        res.render("worker/new",{tareas:result});
    });
});
router.route("/tareas").post(function(req,res){
    var sql= "UPDATE tareas SET estado=? WHERE ref=?";
    con.query(sql,[req.body.estado,req.body.ref],function(err,result){
        if(err) throw err;
        sql ="UPDATE usuarios SET pares=? WHERE DNI=?";
        counter = res.locals.user[0].pares + 1;
        con.query(sql,[counter,res.locals.user[0].DNI],function(err,result){
            if(err) throw err; 
            res.redirect("/worker/tareas");
        });
    });
});
module.exports = router;