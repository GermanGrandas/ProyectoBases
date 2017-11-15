const express = require("express");

const router = express.Router();
const mysql = require("mysql")
const con =mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "usuarioutp",
    database :"andapez"
})

con.connect(function(err) {
    if (err) throw err;});

router.get("/",function(req,res){
    res.render("admin/home");
});
router.get("/logout",function(req,res) {
    //req.session.destroy(function(err) {
    req.session = null;
  // cannot access session here
    res.redirect("/login");
    
});

router.get("/users/new",function(req,res) {
    res.render("admin/users/new");
});
router.get("/users/:id/edit",function(req,res) {
    let sql ="SELECT * FROM `usuarios` WHERE `DNI`=?";
    let data= [req.params.id];
    con.query(sql,data,function(err,result) {
        if(err) throw err;
        else{
            res.render("admin/users/edit",{users:result});
        }
    }); 
});

router.route("/users/:id").put(function(req,res){
        let data=[req.body.nombre,req.params.id];
        let sql ="UPDATE usuarios SET nombre=? WHERE `usuarios`.`DNI` =?";
        con.query(sql,data,function(err,result){
            if(err) throw err;
            res.redirect("/admin/users");
        });
}).delete(function(req,res){
    let sql = "DELETE FROM usuarios WHERE usuarios.DNI =?";
    con.query(sql,[req.params.id],function(err,result){
        if(err) throw err;
        res.redirect("/admin/users");
    });
});

router.route("/users").get(function(req,res) {
    let sql ="SELECT * FROM `usuarios` WHERE `usertype`!='administrador'";
    con.query(sql,function(err,result) {
        if(err) throw err;
        else{
            res.render("admin/users/users",{users:result});
        }
    });
}).post(function(req,res) {
   let sql = "INSERT INTO usuarios(DNI,nombre,usertype,tel,username,password,diseños,pares,refcalzado) VALUES (\'"+req.body.cedula+"\', \'"+req.body.nombre+"\', \'"+req.body.tipo+"\', \'"+req.body.telefono+"\', \'"+req.body.username+"\', \'"+req.body.password+"\', NULL, NULL, NULL)";
    con.query(sql,function(err,result) {
        if(err) throw err;
    });
    res.redirect("/admin/users");
});


router.get("/bills/newP",function(req,res) {
    res.render("admin/bills/newP");
});
router.route("/bills").get(function(req,res){
    let sql = "SELECT * FROM cuentas INNER JOIN proveedor on cuentas.idProv=proveedor.rut";
    con.query(sql,function(err,result){
        if(err) throw err;
        else{
            res.render("admin/bills/bills",{bills:result});
        }
    });
}).post(function(req,res){
    let sql ='INSERT INTO `proveedor` (`id`, `RUT`, `nombre`, `direccion`, `tel`, `ciudad`) VALUES (NULL,\''+ req.body.rut+"\', \'"+req.body.nombre+"\', \'"+req.body.direccion+"\', \'"+req.body.telefono+"\', \'"+req.body.ciudad+"\')";
    con.query(sql,function(err,result){
        if(err) throw err;
    });
    res.redirect("/admin/bills");
});
module.exports = router;