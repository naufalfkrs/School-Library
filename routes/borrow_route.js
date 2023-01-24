const express = require(`express`)
const app = express()
app.use(express.json())
const borrowController = require(`../controllers/borrow_controller`)

app.get("/get",borrowController.getBorrow)
app.post("/add", borrowController.addBorrow)
app.get("/return/:id", borrowController.returnBook)
app.put("/update/:id", borrowController.updateBorrow)
app.delete("/delete/:id", borrowController.deleteBorrow)

module.exports = app