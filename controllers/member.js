const Member = require('../models').Member;

module.exports = {
    list(req, res) {
      return Member
        .findAll()
        .then((members) => res.status(200).send(members))
        .catch((error) => { res.status(400).send(error); });
    },
}