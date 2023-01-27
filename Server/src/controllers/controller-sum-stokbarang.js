const config = require('../configs/database');
const mysql = require('mysql');
const pool = mysql.createPool(config);

pool.on('error',(err)=> {
    console.error(err);
});

module.exports ={
    // Ambil data semua produk
    getSumDataProduk(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
                SELECT SUM(stok) FROM tbl_produk;
                `
            , function (error, results) {
                if(error) throw error;  
                res.render('admin-stokbarang.ejs',{ 
                    datas: results[0]['SUM(stok)']
                });
            });
            connection.release();
        })
    }
}