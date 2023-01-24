const memberModel = require(`../models/index`).member
const Op = require(`sequelize`).Op
const upload = require(`./upload_profilM`).single(`profilM`)
const path = require(`path`)
const fs = require(`fs`)

exports.getAllMember = async (request, response) => {
    let members = await memberModel.findAll()
    return response.json({
        success: true,
        data: members,
        message: `All Members have been loaded`
    })
}
    
exports.findMember = async (request, response) => {
    let name = request.body.name
    let gender = request.body.gender
    let address = request.body.address
    let members = await memberModel.findAll({
        where: {
            [Op.or]: [
                { name: { [Op.substring]: name } },
                { gender: { [Op.substring]: gender } },
                { address: { [Op.substring]: address } }
            ]
        }
    })
    return response.json({
        success: true,
        data: members,
        message: `All Members have been loaded`
    })
}

exports.addMember = (request, response) => {
    upload(request, response, async error => {
        if (error) {
            return response.json({ 
                message: error 
            })
        }
        if (!request.file) {
            return response.json({ 
                message: `Nothing to Upload`
            })
        }

        let newMember = {
            name: request.body.name,
            address: request.body.address,
            gender: request.body.gender,
            contact: request.body.contact,
            profilM: request.file.filename
        }

        memberModel.create(newMember)
            .then(result => {
                return response.json({
                    success: true,
                    data: result,
                    message: `New member has been inserted`
                })
            })
            .catch(error => {
                return response.json({
                    success: false,
                    message: error.message
                })
            })
    })        
}

exports.updateMember = (request, response) => {
    upload(request, response, async error => {
        if (error) {
            return response.json({ message: error })
        }

        let idMember = request.params.id
        let dataMember = {
            name: request.body.name,
            address: request.body.address,
            gender: request.body.gender,
            contact: request.body.contact
        }

        if (request.file) {
            const selectedMember = await memberModel.findOne({
                where: { id: idMember }
            })
            const oldProfilMember = selectedMember.profilM
            const pathProfilM = path.join(__dirname, `../Gambar/profilM`, oldProfilMember)
            if (fs.existsSync(pathProfilM)) {
                fs.unlink(pathProfilM, error =>
                console.log(error))
            }
            member.profilM = request.file.filename
        }
        
        memberModel.update(dataMember, { where: { id: idMember } })
            .then(result => {
                return response.json({
                    success: true,
                    message: `Data member has been updated`
                })
            })
            .catch(error => {
                return response.json({
                    success: false,
                    message: error.message
                })
            })
    })
}

exports.deleteMember = async (request, response) => {
    let idMember = request.params.id
    const member = await memberModel.findOne({ where: { id: idMember } })
    const oldProfilMember = member.foto
    const pathProfilM = path.join(__dirname, `../Gambar/profilM`, oldProfilMember)

    if (fs.existsSync(pathProfilM)) {
        fs.unlink(pathProfilM, error => console.log(error))
    }

    memberModel.destroy({ where: { id: idMember } })
        .then(result => {
            return response.json({
                success: true,
                message: `Data member has been updated`
            })
        })
        .catch(error => {
            return response.json({
                success: false,
                message: error.message
            })
        })
}