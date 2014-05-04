require! fs
(err, data) <~ fs.readFile "#__dirname/../data/postyStrany.json"
data .= toString!
data .= replace /\\x/g ""
data = JSON.parse data
firstTime = new Date "2012-01-01" .getTime!
parties = for party, posts of data
    weeks = []
    name = null
    sum = 0
    console.log party, posts.length
    for post in posts
        id = post.created_time.substr 0, 10
        time = new Date id .getTime!
        diff = time - firstTime
        continue if diff < 0
        week = Math.floor diff / (7 * 86400 * 1000)
        name = post.from_name
        weeks[week] = (weeks[week] || 0) + 1
        sum++
    {party, name, weeks, sum}
parties .= filter -> it.party in <[kducsl top09cz stranales.cz cssdcz komunistickastranacechamoravy anobudelip ods.cz hnutiusvit.cz stranazelenych svobodni ceska.piratska.strana veciverejne]>
parties .= sort (a, b) -> b.sum - a.sum
fs.writeFile "#__dirname/../data/parties.json", JSON.stringify parties, yes, 4
