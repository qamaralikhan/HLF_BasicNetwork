const log4js = require('log4js');
//const logger = log4js.getLogger('BasicNetwork');
const express = require('express')
const app = express()
app.use(express.json())
const port = 3001
const registerUser = require('./src/registerUser.js')

const getClaim = require('./src/QueryClaimData.js')

app.get('/api/test', (req, res) => {
  res.send('Hello World1233s!')
})

app.post('/users', async function (req, res) {
  var username = req.body.username
  var orgName = req.body.orgName
  console.log(username)
  console.log(orgName) 
   result = registerUser.getRegisteredUser(username,orgName,true)
   res.json(result) 
})

app.get('/claimId', async(req, res) => {
 console.log('I am here')
   var rs = await getClaim('C003')
  console.log('msg',rs)
  res.send()
})




app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})