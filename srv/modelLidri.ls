require! fs
(err, data) <~ fs.readFile "#__dirname/../data/postyLidri.json"
data .= toString!
data .= replace /\\x/g ""
data .= replace /\\v/g ""
data = JSON.parse data
firstTime = new Date "2012-01-01" .getTime!
parties = for party, posts of data
    weeks = []
    name = null
    sum = 0
    for post in posts
        id = post.created_time.substr 0, 10
        time = new Date id .getTime!
        diff = time - firstTime
        continue if diff < 0
        week = Math.floor diff / (7 * 86400 * 1000)
        name = post.from_name
        weeks[week] = (weeks[week] || 0) + 1
        sum++
    console.log party, name, posts.length
    {party, name, weeks, sum}
parties .= filter -> it.party not in <[ 279044678939006  ]>
parties .= sort (a, b) -> b.sum - a.sum
parties.forEach ->
    party = switch it.party
    | \DanielKroupaOfficial => "SNK-ED"
    | \abbartos             => "NE Bruselu"
    | \svobodakdu           => "KDU-ČSL"
    | \Niedermayer.Ludek    => "TOP 09"
    | \profil.paroubek      => "LEV 21"
    | \konecna.k            => "KSČM"
    | \jan.keller2014       => "ČSSD"
    | \189032860155         => "ANO"
    | \zahradil             => "ODS"
    | \klarasamkova.cz      => "Úsvit"
    | \liska.ondrej         => "SZ"
    | \petrmach.cz          => "Svobodní"
    | \rastislav.lucansky.1 => "RDS"
    | \160116197332645      => "DSSS"
    | \ottochaloupka        => "Republika"
    | \ivan.bartos.37       => "Piráti"
    | \jana.volfova.777     => "Suverenita"
    | \radekjohn.cz         => "VV"
    it.name += " (#party)"
fs.writeFile "#__dirname/../data/leaders.json", JSON.stringify parties, yes, 4
