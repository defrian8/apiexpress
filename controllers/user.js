const User = require('../models').User;
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const config = require("../config/auth.config");

module.exports = {
    async register(req, res) {
        const { name, email, password, confPassword } = req.body;
        if (password !== confPassword) return res.status(400).json({ msg: "Password and Confirm Password didnt match" });
        const isExist = await User.findOne({
            where: {
                email: email
            }
        });
        if (isExist) return res.status(400).send({ message: "Email already registered!" });
        const salt = await bcrypt.genSalt();
        const hashPassword = await bcrypt.hash(password, salt);
        return User
            .create({
                name: name,
                email: email,
                password: hashPassword
            })
            .then(() => {
                res.send({ message: "Register successfully!" })
            });
    },
    async login(req, res) {
        const user = await User.findOne({
            where: {
                email: req.body.email
            }
        });
        if (!user) return res.status(404).send({ message: "User Not found." });
        const checkPass = await bcrypt.compare(req.body.password, user.password);
        if (!checkPass) return res.status(400).json({ msg: "Incorrect Password" });

        const userId = user.id;
        const name = user.name;
        const email = user.email;

        const accessToken = jwt.sign({ userId, name, email }, config.accessSecret, {
            expiresIn: '120s'
        });
        const refreshToken = jwt.sign({ userId, name, email }, config.refreshSecret, {
            expiresIn: '1d'
        });
        await User.update({ refresh_token: refreshToken }, {
            where: {
                id: userId
            }
        });
        res.cookie('refreshToken', refreshToken, {
            httpOnly: true,
            maxAge: 24 * 60 * 60 * 1000
        });

        res.json({ accessToken });
    },
    async logout(req, res) {
        const refreshToken = req.cookies.refreshToken;
        if (!refreshToken) return res.sendStatus(204);
        const user = await User.findOne({
            where: {
                refresh_token: refreshToken
            }
        });
        if (!user) return res.sendStatus(204);
        const userId = user.id;
        await User.update({ refresh_token: null }, {
            where: {
                id: userId
            }
        });
        res.clearCookie('refreshToken');
        return res.sendStatus(200);
    },
    async refreshToken(req, res) {
        const refreshToken = req.cookies.refreshToken;
        if (!refreshToken) return res.sendStatus(401);
        const user = await User.findOne({
            where: {
                refresh_token: refreshToken
            }
        });
        if (!user) return res.sendStatus(401);
        jwt.verify(refreshToken, config.refreshSecret, (err, decoded) => {
            if(err) return res.sendStatus(403);
            const userId = user.id;
            const name = user.name;
            const email = user.email;
            const accessToken = jwt.sign({userId, name, email}, config.accessSecret,{
                expiresIn: '120s'
            });
            res.json({ accessToken });
        });
    },
}