module.exports = function(req,res,next) {
    console.log(req.baseUrl);
    if(req.session.userType=="diseñador" && (req.baseUrl=="/admin" || req.baseUrl=="/worker")){
        res.redirect("/designer");
    }else if(req.session.userType=="obrero" && (req.baseUrl=="/admin" || req.baseUrl=="/designer")){
        res.redirect("/worker");
    }else if(req.session.userType=="administrador" && (req.baseUrl=="/designer" || req.baseUrl=="/worker")){
        res.redirect("/admin");
    }
    else{
        next();        
    }
};