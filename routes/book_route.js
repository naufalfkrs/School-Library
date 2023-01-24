const express = require(`express`)
const app = express()
app.use(express.json())
const bookController = require(`../controllers/book_controller`)

app.get("/get",bookController.getAllBook)
app.post("/add", bookController.addBook)
app.post("/find", bookController.findBook)
app.put("/update/:id", bookController.updateBook)
app.delete("/delete/:id", bookController.deleteBook)

module.exports = app