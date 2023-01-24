const express = require(`express`)
const app = express()
const PORT = 8000
const cors = require(`cors`)
const bodyParser = require("body-parser")
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))
app.use(cors())

const memberRoute = require(`./routes/member_route`)
const adminRoute = require(`./routes/admin_route`)
const bookRoute = require(`./routes/book_route`)
const borrowRoute = require(`./routes/borrow_route`)

app.use(`/member`, memberRoute)
app.use(`/admin`, adminRoute)
app.use(`/book`, bookRoute)
app.use(`/borrow`, borrowRoute)
app.use(express.static(__dirname))

app.listen(PORT, () => {
    console.log(`Server of School's Library runs on port ${PORT}`)
})