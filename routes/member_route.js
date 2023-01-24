const express = require(`express`)
const app = express()
app.use(express.json())
const memberController = require(`../controllers/member_controller`)

app.get("/get", memberController.getAllMember)
app.post("/add", memberController.addMember)
app.post("/find", memberController.findMember)
app.put("/update/:id", memberController.updateMember)
app.delete("/delete/:id", memberController.deleteMember)

module.exports = app