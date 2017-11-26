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
    res.render("designer/home");
});
router.get("/logout",function(req,res) {
    //req.session.destroy(function(err) {
    req.session = null;
  // cannot access session here
    res.redirect("/login");
    
});
router.get("/new",function(req,res){
    var sql="SELECT * FROM suelas";
    con.query(sql,function(err,result){
        if(err) throw err;
        sql = "SELECT * FROM corte"
        con.query(sql,function(err,result2){
            if(err) throw err;
            res.render("designer/new",{suela:result,corte:result2});
        });
    });
});
router.post("/design",function(req,res){
    var sql = "INSERT INTO `calzado` (`id`, `ref`, `matSuela`, `matCorte`) VALUES (NULL,\'"+req.body.ref+'\', \''+req.body.tipoS+"\', \'"+req.body.tipoC+"\')";
    con.query(sql,function(err,result){
        if(err) throw err;
        sql ="UPDATE usuarios SET disenos=? WHERE DNI=?";
        counter = res.locals.user[0].disenos + 1;
        con.query(sql,[counter,res.locals.user[0].DNI],function(err,result){
            if(err) throw err; 
        });
    });
    res.redirect("/designer/design");
});
router.get("/design/:id/edit",function(req,res){
    let sql ="SELECT * FROM calzado WHERE id=?";
    con.query(sql,[req.params.id],function(err,result) {
        if(err)   throw err;
        res.render("designer/edit",{d:result});
    });
});
router.route("/design/:id").put(function(req,res){
    let sql="UPDATE calzado SET ref =?,matSuela=?,matCorte=? WHERE calzado.id = ?";
    con.query(sql,[req.body.ref,req.body.tipoS,req.body.tipoC,req.params.id],function(err,result){
        if(err) throw err;
        res.redirect("/designer/design");
    });

}).delete(function(req,res){
    let sql ="DELETE FROM calzado WHERE calzado.id =?";
    con.query(sql,[req.params.id],function(err,result){
        if(err) throw err;
        res.redirect("/designer/design");
    });
});
router.route("/design").get(function(req,res){
    var sql = "SELECT calzado.id,ref,corte.materialC,suelas.materialS FROM(calzado INNER JOIN corte ON calzado.matCorte=corte.id) INNER JOIN suelas ON calzado.matSuela=suelas.id ORDER BY REF";
    con.query(sql,function(err,result){
        if(err) throw err;
        res.render("designer/design",{d:result});
    });
});
router.get("/newM",function(req,res){
    var sql = "SELECT * FROM proveedor";
    con.query(sql,function(err,result){
        if(err) throw err;
        res.render("designer/newM",{prov:result});
    });
    
});
router.post("/material",function(req,res){
    if(req.body.tipo == "suela"){
        var sql= "INSERT INTO suelas (`id`, `materialS`, `idProv`) VALUES (NULL,\'"+req.body.nombre+'\', \''+req.body.prov+"\')";
        con.query(sql,function(err,result){
            if(err) throw err;
            res.redirect("/designer/design");
        });
    }else{
        var sql= "INSERT INTO corte (`id`, `materialC`, `idProv`) VALUES (NULL,\'"+req.body.nombre+'\', \''+req.body.prov+"\')";
        con.query(sql,function(err,result){
            if(err) throw err;
            res.redirect("/designer/design");
        });
    }
    var sql="INSERT INTO material(id,name,para) VALUES(NULL,\'"+req.body.nombre+'\', \''+req.body.tipo+"\')";
    con.query(sql,function(err,result){
        if(err) throw err;
    });
});
module.exports = router;