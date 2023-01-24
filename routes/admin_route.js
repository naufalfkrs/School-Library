const express = require(`express`)
const app = express()
app.use(express.json())
const adminController = require(`../controllers/admin_controller`)

app.get("/get",adminController.getAllAdmin)
app.post("/add", adminController.addAdmin)
app.post("/find", adminController.findAdmin)
app.put("/update/:id", adminController.updateAdmin)
app.delete("/delete/:id", adminController.deleteAdmin)

module.exports = app