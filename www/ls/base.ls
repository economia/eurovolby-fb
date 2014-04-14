for party in ig.data.parties
    console.log party.party
colors =
    "cssdcz": \#f29400
    "ceska.piratska.strana": \#333333
    "svobodni": \#005B46
    "stranazelenych": \#00AD00
    "anobudelip": \#282560
    "kducsl": \#EEE03E
    "veciverejne": \#84d0f1
    "ods.cz": \#006ab3
    "top09cz": \#7c0042
    "hnutiusvit.cz": \#ffd91f
    "komunistickastranacechamoravy": \#ce0000
    "stranales.cz ": \#76ce29
new Tooltip!watchElements!
container = d3.select ig.containers.base
weekWidth = 4_px
firstTime = 1325376000000
date = new Date!
x = (d, week) -> "#{week * weekWidth}px"
y = -> it * 0.8
container.selectAll \div.party .data ig.data.parties .enter!append \div
    ..attr \class \party
    ..append \h2
        ..html -> "#{it.name}"
    ..selectAll \div.month .data (.weeks) .enter!append \div
        ..attr \class \month
        ..style \left x
        ..style \width "#{weekWidth}px"
        ..style \height ->"#{y it}px"
        ..style \background (d, i, ii) -> colors[ig.data.parties[ii].party]
        ..attr \data-tooltip (d, i) ->
            date.setTime firstTime + i * 7 * 86400 * 1000
            "Týden od #{date.getDate!}. #{date.getMonth! + 1} #{date.getFullYear!}: #{d} příspěvků"
